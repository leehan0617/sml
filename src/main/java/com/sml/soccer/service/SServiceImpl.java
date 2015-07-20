package com.sml.soccer.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sml.common.dto.CommonBoardDto;
import com.sml.league.dto.LeagueDto;
import com.sml.member.dto.MemberDto;
import com.sml.soccer.dao.SDao;
import com.sml.team.dto.TeamDto;

@Service
public class SServiceImpl implements SService{
	private Logger logger = Logger.getLogger(SServiceImpl.class.getName());
	@Autowired
	private SDao dao;
	
	/**
	 * @함수명:viewSoccerBoard
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:축구페이지에서 공지사항 게시판 보는 함수 
	 */
	@Override
	public ModelAndView viewSoccerBoard(HttpServletRequest request) {
		logger.info("SService viewSoccerBoard");
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
		List<CommonBoardDto> soccerBoardList = dao.getSoccerBoardList(sportCode,startRow,endRow);

		ModelAndView mav = new ModelAndView();
		mav.addObject("blockCount", blockCount);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("blockSize", blockSize);
		mav.addObject("currentPage",currentPage);
		mav.addObject("soccerBoardList" , soccerBoardList);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	/**
	 * 
	 * @함수명:readSoccerBoard
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:축구페이지 공지사항 읽는 함수 
	 */
	@Override
	public ModelAndView readSoccerBoard(HttpServletRequest request) {
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
			case 2: sportType="풋살"; break;
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
			case 2: sportType="풋살"; break;
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
			case 2: sportType="풋살"; break;
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
	 * @함수명: soccerRule
	 * @작성일: 2015. 7. 17.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public void soccerRule(ModelAndView mav) {		
		
		mav.setViewName("soccer/soccerRule");
	}
	
	/**
	 * 
	 * @함수명: soccerTeamList
	 * @작성일: 2015. 7. 17.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public void soccerTeamList(ModelAndView mav) {
		List<TeamDto> teamList=dao.getAllTeamList("축구");
		logger.info("size: " + teamList.size());
		mav.addObject("teamList",teamList);
		mav.setViewName("soccer/soccerTeamList");
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
			case 2: sportType="풋살"; break;
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
			
		List<LeagueDto> leagueList = dao.showLeagueInfo(sportType);
		List<LeagueDto> leagueJoin = dao.getLeagueJoin();
		System.out.println("size:"+leagueJoin.size());
		mav.addObject("leaguelist" , leagueList);
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
			case 2: sportType="풋살"; break;
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
		
		int check = dao.joinLeague(hMap);
		ModelAndView mav = new ModelAndView();
		mav.addObject("check",check);
		mav.setViewName("jsonView");
		return mav;
	}
	
}
