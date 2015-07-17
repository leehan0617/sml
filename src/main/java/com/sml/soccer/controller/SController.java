package com.sml.soccer.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sml.soccer.service.SService;

@Controller
public class SController {
	private Logger logger = Logger.getLogger(SController.class.getName());
	@Autowired
	private SService service;
	
	/**
	 * @함수명:soccerPage
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:축구페이지 이동함수
	 */
	@RequestMapping(value="/sc", method=RequestMethod.GET)
	public String soccerPage(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController soccerPage");
		
		return "sc/soccerMain";
	}
	/**
	 * @함수명:viewSoccerBoard
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:축구페이지 공지사항 게시판 보는 함수
	 */
	@RequestMapping(value="/viewSoccerBoard" , method=RequestMethod.GET)
	public ModelAndView viewSoccerBoard(HttpServletRequest request, HttpServletResponse response){
		logger.info("SController viewSoccerBoard");
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mav = service.viewSoccerBoard(request);
		return mav;
	}
	/**
	 * 
	 * @함수명:readSoccerBoard
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:축구페이지 공지사항 읽는 함수 
	 */
	@RequestMapping(value="/readSoccerBoard" , method=RequestMethod.GET)
	public ModelAndView readSoccerBoard(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController readSoccerBoard");
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mav = service.readSoccerBoard(request);
		return mav;
	}
}
