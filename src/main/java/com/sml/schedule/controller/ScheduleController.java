package com.sml.schedule.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sml.schedule.service.ScheduleService;
import com.sml.schedule.dto.ScheduleDto;

@Controller
public class ScheduleController {
	private final Logger logger = Logger.getLogger(ScheduleController.class.getName());
	@Autowired
	private ScheduleService service;
	
	/**
	 * @함수명:teamSchedule
	 * @작성일:2015. 6. 25.
	 * @작성자:조영석
	 * @설명문:스케쥴관리용 달력 jsp페이지 이동 메소드
	 */
	@RequestMapping(value="/teamPage/teamScheduleEdit.do",method=RequestMethod.GET)	
	public ModelAndView teamSchedule(HttpServletRequest request,HttpServletResponse response){
		logger.info("teamScheduleController");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		service.readteamSchedule(mav);
		return mav;
	}
	
	/**
	 * @함수명:editScheduleView
	 * @작성일:2015. 7. 3.
	 * @작성자:조영석
	 * @설명문:스케쥴 세부일정 페이지 이동 메소드
	 */
	@RequestMapping(value="/teamPage/Schedule.do",method=RequestMethod.GET)
	public ModelAndView editScheduleView(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		service.showSchedule(mav);
		return mav;
	}
	
	/**
	 * @함수명:ScheduleContent
	 * @작성일:2015. 7. 7.
	 * @작성자:조영석
	 * @설명문:스케쥴 내용 이동 메소드 
	 */
	@RequestMapping(value="/teamPage/ScheduleContent.do",method=RequestMethod.GET)
	public ModelAndView ScheduleContent(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		service.scheduleContent(mav);
		return mav;
	}
	/**
	 * @함수명:editSchedule
	 * @작성일:2015. 7. 6
	 * @작성자:조영석
	 * @설명문:스케쥴 일정 입력용 서비스 이동 메소드
	 */
	@RequestMapping(value="/teamPage/editSchedule.do",method=RequestMethod.GET)
	public ModelAndView editSchedule(HttpServletRequest request,HttpServletResponse response,ScheduleDto scheduleDto){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("scheduleDto",scheduleDto);
		service.editSchedule(mav);
		
		return mav;
	}
	
	/**
	 * @함수명:deleteSchedule
	 * @작성일:2015. 7. 7.
	 * @작성자:조영석
	 * @설명문:스케쥴 삭제 이동 메소드
	 */
	@RequestMapping(value="/teamPage/deleteSchedule.do", method=RequestMethod.GET)
	public ModelAndView deleteSchedule(HttpServletRequest request,HttpServletResponse response){
		System.out.println("deleteScheduledeleteScheduledeleteScheduledeleteScheduledeleteSchedule");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		service.deleteSchedule(mav);
		return mav;
	}
}
