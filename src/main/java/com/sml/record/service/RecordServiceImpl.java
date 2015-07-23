package com.sml.record.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sml.member.service.MemberServiceImpl;
import com.sml.record.dao.RecordDao;
import com.sml.record.dto.RecordDto;


@Service
public class RecordServiceImpl implements RecordService {
	private Logger logger = Logger.getLogger(MemberServiceImpl.class.getName());
	@Autowired
	private RecordDao recordDao;
	
	/**
	 * @name : RecordServiceImpl
	 * @date : 2015. 6. 25.
	 * @author : 이희재
	 * @description : 축구에 대한 전체 기록을 출력해오기 위함
	 * 					하나의 dao의 함수를 이용하여 종목만 다르게하여 출력.
	 */
	@Override
	public void soccerGameScore(ModelAndView mav) {
		HashMap<String, Object> hMap=mav.getModelMap();
		
		List<HashMap<String, Object>> recordList=recordDao.getAllRecordList("축구");
		logger.info("RecordList : " + recordList.size());
		mav.addObject("recordList",recordList);
		mav.setViewName("soccer/soccerGameScore");
	}

	/**
	 * @name : getRecordList
	 * @date : 2015. 7. 16.
	 * @author : 이희재
	 * @description : 팀 명에 따른 경기 기록을 가져옴 
	 */
	@Override
	public void getRecordList(ModelAndView mav) {
		HashMap<String, Object> hMap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hMap.get("request");
		String teamName=request.getParameter("teamName");
//		System.out.println(teamName);
		List<HashMap<String, Object>> recordList=recordDao.getRecordList(teamName);
		mav.addObject("recordList", recordList);
	}

	/**
	 * @name : getMatchingResult
	 * @date : 2015. 7. 21.
	 * @author : 이희재
	 * @description : 매칭 중인 결과를 출력
	 */
	@Override
	public void getMatchingResult(ModelAndView mav) {
		HashMap<String, Object> hMap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hMap.get("request");
		String teamName=request.getParameter("teamName");
		int teamCode=recordDao.getTeamInfo(teamName).getTeamCode();
		
		HashMap<String, Object> resultMap=recordDao.getMatchingResult(teamCode);
		
		if(resultMap!=null){
			// 통산 전적 출력
			int teamCode1=Integer.valueOf(String.valueOf(resultMap.get("TEAMCODE")));
			int teamCode2=Integer.valueOf(String.valueOf(resultMap.get("TEAMCODE2")));
			
			List<RecordDto> team1RecordList=recordDao.getTeamRecordList(teamCode1);
			List<RecordDto> team2RecordList=recordDao.getTeamRecordList(teamCode2);
			
			HashMap<String, Object> team1Map=calcTeamRecord(team1RecordList, teamCode1);
			HashMap<String, Object> team2Map=calcTeamRecord(team2RecordList, teamCode2);
			
			if(resultMap!=null){
				mav.addObject("team1Map",team1Map);
				mav.addObject("team2Map",team2Map);
				mav.addObject("matchingResult", resultMap);
			}
		}
		
		
	}

	/**
	 * @name : calcTeamRecord
	 * @date : 2015. 7. 22.
	 * @author : 이희재
	 * @description : 승 무 패 확인 함수
	 */
	public HashMap<String, Object> calcTeamRecord(List<RecordDto> teamRecordList, int teamCode){
		HashMap<String, Object> resultMap=new HashMap<String, Object>();
		int countWin=0;
		int countLose=0;
		int countDraw=0;
		int gameCount=0;
		double winPer=0.0;
		
		if(teamRecordList!=null){
			for(int i=0;i<teamRecordList.size();i++){
				if(teamRecordList.get(i).getTeamResult()!=null){
					gameCount++;
					if(teamRecordList.get(i).getTeamResult().equals("무")){
						countDraw++;
					}
					
					if(teamRecordList.get(i).getTeamResult().equals("승")&&(teamRecordList.get(i).getTeamCode()==teamCode)){
						countWin++;
					}else if(teamRecordList.get(i).getTeamResult().equals("승")&&(teamRecordList.get(i).getTeamCode()!=teamCode)){
						countLose++;
					}
					
					if(teamRecordList.get(i).getTeamResult().equals("패")&&(teamRecordList.get(i).getTeamCode()==teamCode)){
						countLose++;
					}else if(teamRecordList.get(i).getTeamResult().equals("패")&&(teamRecordList.get(i).getTeamCode()!=teamCode)){
						countWin++;
					}
				}
			}
		}
		
		if(gameCount!=0){
			winPer=((double)countWin)/gameCount;
		}
		
		resultMap.put("gameCount", gameCount);
		resultMap.put("countWin", countWin);
		resultMap.put("countLose", countLose);
		resultMap.put("countDraw", countDraw);
		resultMap.put("winPer",winPer * 100);
		
		return resultMap;
	}
	
	/**
	 * @name : insertMatchingResult
	 * @date : 2015. 7. 22.
	 * @author : 이희재
	 * @description : 매칭 후 친선 전 경기 결과 입력
	 */
	@Override
	public void insertMatchingResult(ModelAndView mav) {
		HashMap<String, Object> hMap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hMap.get("request");
		int gameCode=Integer.parseInt(request.getParameter("gameCode"));
		String resultScore=request.getParameter("resultScore");
		String result=request.getParameter("result");
		String teamName=request.getParameter("teamName");

		HashMap<String, Object> record=recordDao.getRecordInfo(gameCode);
		int check=0;
		
		if(result.equals("무")){
			check=recordDao.insertDraw(gameCode, resultScore);
		}else if(result.equals(record.get("TEAMNAME1"))){
			check=recordDao.insertTeam1(gameCode, resultScore);
		}else if(result.equals(record.get("TEAMNAME2"))){
			check=recordDao.insertTeam2(gameCode, resultScore);
		}
		int teamCode=Integer.valueOf(String.valueOf(record.get("TEAMCODE")));
		int teamCode2=Integer.valueOf(String.valueOf(record.get("TEAMCODE2")));
		
		recordDao.deleteMatching(teamCode);
		recordDao.deleteMatching(teamCode2);
		
		mav.addObject("teamName",teamName);
		mav.addObject("check",check);
		mav.setViewName("teamPage/insertResultOk");
	}
}
