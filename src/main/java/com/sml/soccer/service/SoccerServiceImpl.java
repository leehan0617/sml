package com.sml.soccer.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.sml.common.dao.CommonDao;
import com.sml.common.dto.CommonBoardDto;
import com.sml.league.dao.LeagueDao;
import com.sml.league.dto.LeagueDto;
import com.sml.member.dto.MemberDto;
import com.sml.record.dto.RecordDto;
import com.sml.soccer.dao.SoccerDao;
import com.sml.team.dto.TeamDto;
import com.sml.weather.WeatherDTO;
import com.sml.weather.WeatherParser;

@Component
public class SoccerServiceImpl implements SoccerService {
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private SoccerDao soccerDao;
	@Autowired
	private CommonDao commonDao;
	@Autowired
	private LeagueDao leagueDao;
	
	//종목 공지게시판 코드
	private int sportCode=0;
	
	/**
	 * @name : soccerMain
	 * @date : 2015. 6. 23.
	 * @author : 변형린
	 * @description : 축구 메인 페이지로 이동시키는 Service 메소드
	 */
	@Override
	public void soccerMain(ModelAndView mav) {
		Map <String, Object> map=mav.getModel();		
		HttpServletRequest request=(HttpServletRequest) map.get("request");	
		//////////////////////////////////////////////////////////////////////
		String sportType="축구";
		//////////////////////////////////////////////////////////////////////
		
		//금주매치
		String matchDay=request.getParameter("matchDay");
		String moveMatchDay=request.getParameter("moveMatchDay");// 1, -1
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		if(moveMatchDay==null){
			moveMatchDay="1";
		}		
			
		if(matchDay==null){	
			//맨 처음 축구페이지로 이동했을때
			//현재 년도, 월, 일
			Date today= new Date();			
			matchDay=sdf.format(today).toString();//yyyyMMdd		
			logger.info("matchDay: "+matchDay);			
		}else if(matchDay!=null){		
			//매치 날짜를 변경했을때
			if(Integer.parseInt(moveMatchDay)>0){//moveMatchDay=1, 다음
				matchDay=""+(Integer.parseInt(matchDay)+1);
			}else if(Integer.parseInt(moveMatchDay)<0){////moveMatchDay=-1, 이전
				matchDay=""+(Integer.parseInt(matchDay)-1);
			}
			logger.info("matchDay: "+matchDay);
		}	
		
		java.sql.Date sqlDate= soccerDao.moveMatchDay(matchDay, moveMatchDay);	
		if(sqlDate!=null){
			matchDay=sdf.format(sqlDate).toString();
		}else{
			matchDay=request.getParameter("matchDay");
		}
		List<HashMap<String, Object>> todayMatchList=soccerDao.todayMatch(matchDay);
		
		//공통공지사항					
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null)pageNumber="1";
		
		int boardSize=6;
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=commonDao.getCommonBoardCount();
		logger.info("count:" + count);
				
		List<CommonBoardDto> commonBoardList=null;
		if(count>0){
			commonBoardList=soccerDao.commonBoard(startRow, endRow, sportCode);
		}
		//logger.info("boardSize:" + commonBoardList.size());
		
		
		//날씨 파싱 정보 가져오기		
		ArrayList<WeatherDTO> weatherList=null;
		try {
			WeatherParser weatherParser = new WeatherParser();
			weatherList=weatherParser.xmlRssParser();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		//리그 정보 가져오기
		List<LeagueDto> leagueList=leagueDao.getLeagueList(sportType);
		
		mav.addObject("leagueList", leagueList);
		mav.addObject("sportType", sportType);//종목 구분
		mav.addObject("matchDay", matchDay);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);		
		mav.addObject("count", count);
		mav.addObject("commonBoardList", commonBoardList);
		mav.addObject("todayMatchList", todayMatchList);
		mav.addObject("weatherList", weatherList);
		mav.setViewName("soccer/soccerMain");
	}

	/**
	 * @name : teamSearch
	 * @date : 2015. 6. 23.
	 * @author : 변형린
	 * @description : 팀 검색 메소드
	 */
	@Override
	public void teamSearch(ModelAndView mav) {
		Map <String, Object> map=mav.getModel();		
		HttpServletRequest request=(HttpServletRequest) map.get("request");		
		
		String teamName=request.getParameter("teamName");
		//logger.info("SoccerServiceImpl/teamSearch/teamName:" + teamName);
		
		int teamCode=soccerDao.teamSearch(teamName);
		
		mav.setViewName("teamPage/teamPageMain");
	}
	
	/**
	 * @name : soccerRule
	 * @date : 2015. 6. 23.
	 * @author : 변형린
	 * @description : 축구 경기 규칙 페이지로 이동시키는 Service 메소드
	 */
	@Override
	public void soccerRule(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map <String, Object> map=mav.getModel();
		mav.setViewName("soccer/soccerRule");
	}

	/**
	 * @name : SoccerServiceImpl
	 * @date : 2015. 6. 23.
	 * @author : 이희재
	 * @description : 페이지 눌렀을때 전체 팀 리스트 먼저 가져오는 함수
	 */
	@Override
	public void soccerTeamList(ModelAndView mav) {
		Map <String, Object> map=mav.getModel();
		
		List<TeamDto> teamList=soccerDao.getAllTeamList("축구");
		logger.info("size: " + teamList.size());
		mav.addObject("teamList",teamList);
		mav.setViewName("soccer/soccerTeamList");
	}

	/**
	 * @name : soccerGameScore
	 * @date : 2015. 6. 23.
	 * @author : 변형린
	 * @description : 축구 경기 기록 페이지로 이동시키는 Service 메소드
	 */
	@Override
	public void soccerGameScore(ModelAndView mav) {
		Map <String, Object> map=mav.getModel();
		mav.setViewName("soccer/soccerGameScore");
	}

	/**
	 * @name : soccerRefereeList
	 * @date : 2015. 6. 23.
	 * @author : 변형린
	 * @description : 심판현황 페이지로 이동시키는 Service 메소드
	 */
	@Override
	public void soccerRefereeList(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map <String, Object> map=mav.getModel();
		mav.setViewName("soccer/soccerRefereeList");
	}


	/**
	 * @name : commonBoard
	 * @date : 2015. 6. 25.
	 * @author : 변형린
	 * @description : 공지사항게시판으로 이동하는 Service 메소드
	 */
	@Override
	public void commonBoard(ModelAndView mav) {
		logger.info("/soccer/serviceImpl/commonBoard----------");
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");	
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null)pageNumber="1";
		
		int boardSize=10;
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=commonDao.getCommonBoardCount();
		logger.info("count:" + count);
		
		List<CommonBoardDto> commonBoardList=null;
		if(count>0){
			commonBoardList=soccerDao.commonBoard(startRow, endRow, sportCode);
		}
		logger.info("boardSize:" + commonBoardList.size());
		
		mav.addObject("commonBoardList", commonBoardList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		
		mav.setViewName("soccer/soccerCommonBoard");
	}
	
	/**
	 * @name : readCommonBoard
	 * @date : 2015. 6. 26.
	 * @author : 변형린
	 * @description : 공지사항 읽기
	 */
	@Override
	public void readCommonBoard(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int boardNumber=Integer.parseInt(request.getParameter("boardNumber"));
		String pageNumber=request.getParameter("pageNumber");
		
		if(pageNumber==null){
			pageNumber="1";
		}
		
		CommonBoardDto commonBoard=commonDao.readCommonBoard(boardNumber);
		mav.addObject("commonBoard",commonBoard);
		mav.addObject("pageNumber",Integer.parseInt(pageNumber));
		mav.addObject("boardNumber",boardNumber);
		mav.setViewName("soccer/soccerCommonBoardRead");
	}

	/**
	 * @함수명:soccerLeague
	 * @작성일:2015. 7. 9.
	 * @작성자:조영석
	 * @설명문:축구전용 리그정보 열람 
	 */
	@Override
	public void soccerLeague(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");			
	
		String leagueSport=request.getParameter("leagueSport");
		int leagueCode=Integer.parseInt(request.getParameter("leagueCode"));
		
		if(leagueSport==null) leagueSport="축구";
		int count=soccerDao.LeagueCount(leagueCode);
		
		List<LeagueDto> soccerLeagueList=null;	

		soccerLeagueList=soccerDao.LeagueList(leagueSport);
		mav.addObject("count",count);
		mav.addObject("soccerLeagueList",soccerLeagueList);		
		
		mav.setViewName("soccer/soccerLeagueInfo");		
	}

	/**
	 * @함수명:cards
	 * @작성일:2015. 7. 10.
	 * @작성자:조영석
	 * @설명문:지역별 통계 서비스메소드
	 */
	@Override
	public void cards(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");	
		
		String legion=request.getParameter("legion");
		String age=request.getParameter("age");
	    List<MemberDto> cardsList=soccerDao.cards();
		
	    JSONArray jsonArray=JSONArray.fromObject(cardsList);
//	    System.out.println("cardsList:"+jsonArray);
	    
	    Map<String,Object> Map=new HashMap<String,Object>();
		Map.put("cardsList", jsonArray);
		
		JSONObject jsonObject=JSONObject.fromObject(Map);
//		System.out.println("json-"+jsonObject);
		
		mav.addObject("jsonObject",jsonObject);
		mav.addObject("legion",legion);
		mav.addObject("age",age);
		if(legion!=null){
			mav.setViewName("static/legionChart");
		}else if(age!=null){
			mav.setViewName("static/ageChart");
		}
	}	
}
