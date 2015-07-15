package com.sml.soccer.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sml.soccer.service.SoccerService;

@Controller
public class SoccerController{
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private SoccerService soccerService;	
	
	
	/**
	 * @name : soccerMain
	 * @date : 2015. 6. 23.
	 * @author : 변형린
	 * @description : 축구 메인페이지로 이동시키는 메소드 함수
	 */
	@RequestMapping(value="/soccer/soccerMain.do", method=RequestMethod.GET)
	public ModelAndView soccerMain(HttpServletRequest request, HttpServletResponse response){
		logger.info("Controller/soccerMain---------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		soccerService.soccerMain(mav);
		soccerService.cards(mav);
		
		mav.setViewName("soccer/soccerMain");
		
		return mav;
	}
	
	
	/**
	 * @name : teamSearch
	 * @date : 2015. 6. 23.
	 * @author : 변형린
	 * @description : 팀 검색 메소드
	 */
	@RequestMapping(value="/soccer/teamSearch.do", method=RequestMethod.GET)
	public ModelAndView teamSearch(HttpServletRequest request, HttpServletResponse response){
		logger.info("Controller/teamSearch---------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		soccerService.teamSearch(mav);
		
		return mav;
	}
	
	/**
	 * @name : soccerRule
	 * @date : 2015. 6. 23.
	 * @author : 변형린
	 * @description : 축구 규칙 페이지로 이동시키는 메소드
	 */
	@RequestMapping(value="/soccer/soccerRule.do", method=RequestMethod.GET)
	public ModelAndView soccerRule(HttpServletRequest request, HttpServletResponse response){
		logger.info("Controller/soccerRule---------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		soccerService.soccerRule(mav);
		
		return mav;
	}
	
	/**
	 * @name : soccerTeamList
	 * @date : 2015. 6. 23.
	 * @author : 변형린
	 * @description : 축구 팀 리스트 페이지로 이동시키는 메소드
	 */
	@RequestMapping(value="/soccer/soccerTeamList.do", method=RequestMethod.GET)
	public ModelAndView soccerTeamList(HttpServletRequest request, HttpServletResponse response){
		logger.info("Controller/soccerMain---------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		soccerService.soccerTeamList(mav);
		
		return mav;
	}
	
	/**
	 * @name : soccerGameScore
	 * @date : 2015. 6. 23.
	 * @author : 변형린
	 * @description : 축구 경기 기록 페이지로 이동시키는 메소드
	 */
	@RequestMapping(value="/soccer/soccerGameScore.do", method=RequestMethod.GET)
	public ModelAndView soccerGameScore(HttpServletRequest request, HttpServletResponse response){
		logger.info("Controller/soccerGameScore---------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		soccerService.soccerGameScore(mav);
		
		return mav;
	}
	
	/**
	 * @name : commonBoard
	 * @date : 2015. 6. 25.
	 * @author : 변형린
	 * @description : 축구페이지에서 공지사항 페이지로 이동
	 */
	@RequestMapping(value="/soccer/commonBoard.do", method=RequestMethod.GET)
	public ModelAndView commonBoard(HttpServletRequest request, HttpServletResponse response){
		logger.info("Controller/commonBoard---------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		soccerService.commonBoard(mav);
		
		return mav;
	}
	
	/**
	 * @name : readCommonBoard
	 * @date : 2015. 6.25
	 * @author : 변형린
	 * @description : 축구 공지게시판 읽기
	 */
	@RequestMapping(value="/soccer/readCommonBoard.do", method=RequestMethod.GET)
	public ModelAndView readCommonBoard(HttpServletRequest request, HttpServletResponse response){
		logger.info("Controller/readCommonBoard---------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		soccerService.readCommonBoard(mav);
		
		return mav;
	}
	
	/**
	 * @함수명:soccerLeague
	 * @작성일:2015. 7. 9.
	 * @작성자:조영석
	 * @설명문:축구전용 리그정보 열람
	 */
	@RequestMapping(value="/soccer/soccerLeague.do", method=RequestMethod.GET)
	public ModelAndView soccerLeague(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		soccerService.soccerLeague(mav);
		return mav;
	}
	
	
	/**
	 * @함수명:cards
	 * @작성일:2015. 7. 10.
	 * @작성자:조영석
	 * @설명문:지역별통계 차트값 열람 컨트롤러
	 */
	@RequestMapping(value="/static/chart.do",method=RequestMethod.GET)
	public ModelAndView cards(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		soccerService.cards(mav);
		return mav;
	}
}
