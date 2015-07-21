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
			mav.addObject("matchingResult", resultMap);
		}
		
	}
}
