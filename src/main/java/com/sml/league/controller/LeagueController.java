package com.sml.league.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sml.league.service.LeagueService;

@Controller
public class LeagueController {
	@Autowired
	private LeagueService service;
	
	/**
	 * @함수명:applicate
	 * @작성일:2015. 7. 9.
	 * @작성자:조영석
	 * @설명문:리그신청관리 이동 메소드
	 */
	@RequestMapping(value="/league/applicate.do",method=RequestMethod.GET)
	public ModelAndView applicate(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		
		service.applicate(mav);
		return mav;
	}
}
