package com.sml.basketBall.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sml.baseball.dao.BaseballDao;
import com.sml.basketBall.dao.BasketBallDao;
import com.sml.common.dto.CommonBoardDto;
import com.sml.league.dto.LeagueDto;
import com.sml.member.dto.MemberDto;
import com.sml.record.dto.RecordDto;
import com.sml.weather.WeatherDTO;
import com.sml.weather.WeatherParser;
	
	@Service
	public class BasketBallServiceImpl implements BasketBallService{
		private Logger logger = Logger.getLogger(BasketBallServiceImpl.class.getName());
		@Autowired
		private BasketBallDao dao;
		
		/**
		 * @함수명:viewbasketBallBoard
		 * @작성일:2015. 7. 16.
		 * @작성자:이한빈 
		 * @설명문:축구페이지에서 공지사항 게시판 보는 함수 
		 */
		@Override
		public ModelAndView viewbasketBallBoard(HttpServletRequest request) {
			logger.info("SService viewbasketBallBoard");
			//축구페이지 스포츠코드는 0 
			int sportCode = Integer.parseInt(request.getParameter("sportCode"));
			
			//축구페이지인 공지사항 총갯수 가져오기.
			int count=dao.getBoardCount(sportCode);
			
			//System.out.println("축구페이지 공지사항 총갯수:" + count);
			
			// 한 블록 당 출력될 게시물 수
			int boardSize=8;
			// 한 페이지당 들어갈 블록
			int blockSize=2;
			
			String cp = request.getParameter("currentPage");
			int currentPage;
			if(cp.equals("") || cp == null){
				currentPage = 1;
			}else{
				currentPage = Integer.parseInt(cp);
			}
			
			int blockCount=count/boardSize + (count%boardSize==0? 0:1);
			int startRow=(currentPage-1)*boardSize+1;
			int endRow=startRow+boardSize-1;
			
			//System.out.println("sportCode"+sportCode+",count:"+count+",currentPage:"+currentPage+",blockCount:"+blockCount+",startRow:"+startRow);
			
			//축구페이지 게시물 가져오기 
			List<CommonBoardDto> basketBallBoardList = dao.getbasketBallBoardList(sportCode,startRow,endRow);

			ModelAndView mav = new ModelAndView();
			mav.addObject("blockCount", blockCount);
			mav.addObject("count", count);
			mav.addObject("boardSize", boardSize);
			mav.addObject("blockSize", blockSize);
			mav.addObject("currentPage",currentPage);
			mav.addObject("basketBallBoardList" , basketBallBoardList);
			mav.setViewName("jsonView");
			
			return mav;
		}
		
		/**
		 * 
		 * @함수명:readbasketBallBoard
		 * @작성일:2015. 7. 16.
		 * @작성자:이한빈 
		 * @설명문:축구페이지 공지사항 읽는 함수 
		 */
		@Override
		public ModelAndView readbasketBallBoard(HttpServletRequest request) {
			int boardNumber=Integer.parseInt(request.getParameter("boardNumber"));
			
			CommonBoardDto board = dao.getBoardContent(boardNumber);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("board" , board);
			mav.setViewName("jsonView");
			
			return mav;
		}

		@Override
		public ModelAndView showAgeChart(HttpServletRequest request) {
			int sportCode = Integer.parseInt(request.getParameter("sportCode"));
			String sportType="";
			switch(sportCode){
				case 0: sportType="축구"; break;
				case 1: sportType="야구"; break;
				case 2: sportType="농구"; break;
				case 3: sportType="족구"; break;
			}
			
			List<MemberDto> list = dao.showAgeChart(sportType);
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.setViewName("jsonView");
			return mav;
		}

		@Override
		public ModelAndView showCityChart(HttpServletRequest request) {
			int sportCode = Integer.parseInt(request.getParameter("sportCode"));
			String sportType="";
			switch(sportCode){
				case 0: sportType="축구"; break;
				case 1: sportType="야구"; break;
				case 2: sportType="농구"; break;
				case 3: sportType="족구"; break;
			}
			
			List<MemberDto> list = dao.showAgeChart(sportType);
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.setViewName("jsonView");
			return mav;
		}

		@Override
		public ModelAndView showDayChart(HttpServletRequest request) {
			int sportCode = Integer.parseInt(request.getParameter("sportCode"));
			String sportType="";
			switch(sportCode){
				case 0: sportType="축구"; break;
				case 1: sportType="야구"; break;
				case 2: sportType="농구"; break;
				case 3: sportType="족구"; break;
			}
			
			List<Date> list = dao.showDayChart(sportType);
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.setViewName("jsonView");
			return mav;
		}

		/**
		 * 
		 * @함수명: basketBallRule
		 * @작성일: 2015. 7. 17.
		 * @작성자: 정성남
		 * @설명 : 농구규칙 페이지를 호출하기위한 서비스함수
		 */
		@Override
		public void basketBallRule(ModelAndView mav) {
			Map<String,Object> map=mav.getModelMap();		
			HttpServletRequest request=(HttpServletRequest)map.get("request");
			int sportCode = Integer.parseInt(request.getParameter("sportCode"));
			String sportType="";
			switch(sportCode){
				case 0: sportType="축구"; break;
				case 1: sportType="야구"; break;
				case 2: sportType="농구"; break;
				case 3: sportType="족구"; break;
			}
			ArrayList<WeatherDTO> weatherList=null;
			try {
				WeatherParser weatherParser = new WeatherParser();
				weatherList=weatherParser.xmlRssParser();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			for(WeatherDTO weather:weatherList){
				/*01 맑음
				02 구름 조금
				03 구름 많음
				04 흐림
				05 비
				06 눈/비
				07 눈*/			
				if(weather.getWfKor().equals("맑음")){
					weather.setWfKor("01.png");
				}else if(weather.getWfKor().equals("구름 조금")){
					weather.setWfKor("02.png");
				}else if(weather.getWfKor().equals("구름 많음")){
					weather.setWfKor("03.png");
				}else if(weather.getWfKor().equals("흐림")){
					weather.setWfKor("04.png");
				}else if(weather.getWfKor().equals("비")){
					weather.setWfKor("05.png");
				}else if(weather.getWfKor().equals("눈/비")){
					weather.setWfKor("06.png");
				}else if(weather.getWfKor().equals("눈")){
					weather.setWfKor("07.png");
				}
			}
			
			mav.addObject("weatherList", weatherList);
			mav.addObject("sportCode",sportCode);
			mav.addObject("sportType",sportType);
			mav.setViewName("basketBall/basketBallRule");
		}
		
		/**
		 * 
		 * @함수명: basketBallTeamList
		 * @작성일: 2015. 7. 17.
		 * @작성자: 정성남
		 * @설명 : 농구 팀의 리스트를 호출하기 위한 서비스함수
		 */
		@Override
		public void basketBallTeamList(ModelAndView mav) {
			Map<String,Object> map=mav.getModelMap();		
			HttpServletRequest request=(HttpServletRequest)map.get("request");
			
			String sportType="";
			int sportCode = Integer.parseInt(request.getParameter("sportCode"));
			//System.out.println("RefereeListsportCode:"+sportCode);
			
			
			switch(sportCode){
				case 0: sportType="축구"; break;
				case 1: sportType="야구"; break;
				case 2: sportType="농구"; break;
				case 3: sportType="족구"; break;
			}
			
			int teamCount=dao.teamCount(sportType);
			
			String pageNumber=request.getParameter("pageNumber");
			//System.out.println("pageNumber"+pageNumber);
			if(pageNumber==null) pageNumber="1";
				
			int boardSize=5;		
			int currentPage=Integer.parseInt(pageNumber);
			int startRow=(currentPage-1)*boardSize+1;
			int endRow=currentPage*boardSize;
			
			
			
			List<HashMap<String,Object>> teamList=dao.getAllTeamList(sportType,startRow,endRow);
			logger.info("size: " + teamList.size());
			
			ArrayList<WeatherDTO> weatherList=null;
			try {
				WeatherParser weatherParser = new WeatherParser();
				weatherList=weatherParser.xmlRssParser();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			for(WeatherDTO weather:weatherList){
				/*01 맑음
				02 구름 조금
				03 구름 많음
				04 흐림
				05 비
				06 눈/비
				07 눈*/			
				if(weather.getWfKor().equals("맑음")){
					weather.setWfKor("01.png");
				}else if(weather.getWfKor().equals("구름 조금")){
					weather.setWfKor("02.png");
				}else if(weather.getWfKor().equals("구름 많음")){
					weather.setWfKor("03.png");
				}else if(weather.getWfKor().equals("흐림")){
					weather.setWfKor("04.png");
				}else if(weather.getWfKor().equals("비")){
					weather.setWfKor("05.png");
				}else if(weather.getWfKor().equals("눈/비")){
					weather.setWfKor("06.png");
				}else if(weather.getWfKor().equals("눈")){
					weather.setWfKor("07.png");
				}
			}
			
			mav.addObject("weatherList", weatherList);
			mav.addObject("sportCode",sportCode);
			mav.addObject("sportType", sportType);
			mav.addObject("boardSize", boardSize);		
			mav.addObject("currentPage",currentPage);
			mav.addObject("teamCount",teamCount);
			mav.addObject("teamList",teamList);
			mav.setViewName("basketBall/basketBallTeamList");
		}

		/**
		 * 
		 * @함수명:showLeagueInfo
		 * @작성일:2015. 7. 17.
		 * @작성자:이한빈 
		 * @설명문:리그정보가져오는 함수 
		 */
		@Override
		public ModelAndView showLeagueInfo(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			int sportCode = Integer.parseInt(request.getParameter("sportCode"));
			String sportType="";
			switch(sportCode){
				case 0: sportType="축구"; break;
				case 1: sportType="야구"; break;
				case 2: sportType="농구"; break;
				case 3: sportType="족구"; break;
			}
			
			List<LeagueDto> leagueList = dao.showLeagueInfo(sportType);
			System.out.println("size"+leagueList.size());
			mav.addObject("list" , leagueList );
			mav.setViewName("jsonView");
			return mav;
		}
		/**
		 * 
		 * @함수명:leagueTable
		 * @작성일:2015. 7. 20.
		 * @작성자:이한빈 
		 * @설명문:테이블에 보여줄 리그정보 출력
		 */
		@Override
		public ModelAndView leagueTable(HttpServletRequest request) {
			logger.info("SService leagueTable");
			ModelAndView mav = new ModelAndView();
			int sportCode = Integer.parseInt(request.getParameter("sportCode"));
			String sportType = this.setSportCode(sportCode);
			System.out.println("type:"+sportType);
			List<LeagueDto> leagueList = dao.showLeagueInfo(sportType);
			List<LeagueDto> leagueJoin = dao.getLeagueJoin();
			System.out.println("size:"+leagueJoin.size());
			mav.addObject("leaguelist" , leagueList);
			System.out.println(leagueList.size());
			mav.addObject("leagueJoin" , leagueJoin);
			mav.setViewName("jsonView");
			return mav;
		}
		
		/**
		 * 
		 * @함수명:setSportCode
		 * @작성일:2015. 7. 20.
		 * @작성자:이한빈 
		 * @설명문:스포츠코드 스트링으로 전환함수 
		 */
		private String setSportCode(int sportCode){
			String sportType="";
			
			switch(sportCode){
				case 0: sportType="축구"; break;
				case 1: sportType="야구"; break;
				case 2: sportType="농구"; break;
				case 3: sportType="족구"; break;
			}
			return sportType;
		}

		@Override
		public ModelAndView joinLeague(HttpServletRequest request) {
			int leagueCode = Integer.parseInt(request.getParameter("leagueCode"));
			String teamName = request.getParameter("teamName");
			HashMap<String,Object> hMap = new HashMap<String,Object>();
			hMap.put("leagueCode", leagueCode);
			hMap.put("teamName", teamName);
			int check = dao.checkLeague(hMap);
			int value=0;
			if(check>0){
				value=-1;
			}else{
				value=dao.joinLeague(hMap);
			}		
			ModelAndView mav = new ModelAndView();
			mav.addObject("value",value);
			mav.setViewName("jsonView");
			return mav;
		}

		/**
		 * @함수명: basketBallCommonBoard
		 * @작성일: 2015. 7. 21.
		 * @작성자: 정성남
		 * @설명 : 농구 공지게시판을 불러오기위한 서비스 함수
		 */
		@Override
		public void basketBallCommonBoard(ModelAndView mav) {
			Map<String,Object> map=mav.getModelMap();		
			HttpServletRequest request=(HttpServletRequest)map.get("request");
			logger.info("SService basketBallCommonBoard");
			
			//축구페이지 스포츠코드는 0 
			int sportCode = Integer.parseInt(request.getParameter("sportCode"));
			
			
			//축구페이지인 공지사항 총갯수 가져오기.
			int count=dao.getBoardCount(sportCode);
			
			//System.out.println("축구페이지 공지사항 총갯수:" + count);
			
			String pageNumber=request.getParameter("pageNumber");
			//System.out.println("pageNumber"+pageNumber);
			if(pageNumber==null) pageNumber="1";
				
			int boardSize=5;		
			int currentPage=Integer.parseInt(pageNumber);
			int startRow=(currentPage-1)*boardSize+1;
			int endRow=currentPage*boardSize;
			
			//축구페이지 게시물 가져오기 
			List<CommonBoardDto> basketBallBoardList = dao.getbasketBallBoardList(sportCode,startRow,endRow);
			
			
			ArrayList<WeatherDTO> weatherList=null;
			try {
				WeatherParser weatherParser = new WeatherParser();
				weatherList=weatherParser.xmlRssParser();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			for(WeatherDTO weather:weatherList){
				/*01 맑음
				02 구름 조금
				03 구름 많음
				04 흐림
				05 비
				06 눈/비
				07 눈*/			
				if(weather.getWfKor().equals("맑음")){
					weather.setWfKor("01.png");
				}else if(weather.getWfKor().equals("구름 조금")){
					weather.setWfKor("02.png");
				}else if(weather.getWfKor().equals("구름 많음")){
					weather.setWfKor("03.png");
				}else if(weather.getWfKor().equals("흐림")){
					weather.setWfKor("04.png");
				}else if(weather.getWfKor().equals("비")){
					weather.setWfKor("05.png");
				}else if(weather.getWfKor().equals("눈/비")){
					weather.setWfKor("06.png");
				}else if(weather.getWfKor().equals("눈")){
					weather.setWfKor("07.png");
				}
			}
			
			mav.addObject("weatherList", weatherList);
			mav.addObject("sportCode",sportCode);
			mav.addObject("count", count);
			mav.addObject("boardSize", boardSize);		
			mav.addObject("currentPage",currentPage);
			mav.addObject("basketBallBoardList" , basketBallBoardList);
			mav.setViewName("basketBall/basketBallCommonBoardPage");		
			
		}
		
		/**
		 * 
		 * @함수명:showRecentMatch
		 * @작성일:2015. 7. 21.
		 * @작성자:이한빈 
		 * @설명문:로딩시 대진표 보여주는 함수 
		 */
		@Override
		public ModelAndView showRecentMatch(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			String gameType = setSportCode(Integer.parseInt(request.getParameter("sportCode")));
			List<RecordDto> recordList = dao.showRecentMatch(gameType);
			//System.out.println("recordList:"+recordList.size());
			mav.addObject("recordList",recordList);
			mav.setViewName("jsonView");
			return mav;
		}

		@Override
		public ModelAndView findMatchTeams(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			String team1 = dao.findMatchTeams(Integer.parseInt(request.getParameter("teamCode")));
			String team2 = dao.findMatchTeams(Integer.parseInt(request.getParameter("teamCode2")));
			mav.addObject("teamA",team1);
			mav.addObject("teamB",team2);
			System.out.println("teamA:"+team1+"teamB:"+team2);
			mav.setViewName("jsonView");
			return mav;
		}
}

