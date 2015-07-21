package com.sml.baseball.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sml.baseball.service.BaseballService;
import com.sml.soccer.service.SService;

@Controller
public class BaseballController {
	private Logger logger = Logger.getLogger(BaseballController.class.getName());
	@Autowired
	private BaseballService service;	
	/**
	 * 
	 * @함수명: baseBallPage
	 * @작성일: 2015. 7. 21.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@RequestMapping(value="/baseBall/baseBallMain.do", method=RequestMethod.GET)
	public String baseballPage(HttpServletRequest request , HttpServletResponse response){
		logger.info("BaseballController baseBallPage ");
		
		return "baseBall/baseBallMain";
	}
	
	
	

}
