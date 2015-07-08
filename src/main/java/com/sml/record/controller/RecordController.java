package com.sml.record.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sml.record.service.RecordService;


@Controller
public class RecordController {
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private RecordService recordService;
	/**
	 * @name : RecordController
	 * @date : 2015. 6. 23.
	 * @author : 이희재
	 * @description : 축구 전체 기록 출력하기.
	 */
	
	@RequestMapping(value="/record/soccerGameScore.do", method=RequestMethod.GET)
	public ModelAndView soccerGameScore(HttpServletRequest request, HttpServletResponse response){
		logger.info("Controller/soccerGameScore---------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		recordService.soccerGameScore(mav);
		return mav;
	}
}
