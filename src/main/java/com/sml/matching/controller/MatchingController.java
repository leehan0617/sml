package com.sml.matching.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sml.matching.dto.MatchingDto;
import com.sml.matching.service.MatchingService;
import com.sml.team.controller.TeamController;

@Controller
public class MatchingController {

	private Logger logger = Logger.getLogger(TeamController.class.getName());
	@Autowired
	private MatchingService service;
	/**
	 * @name : TeamController
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 매칭 페이지로 이동
	 */
	@RequestMapping(value="/teamPage/matching.do", method=RequestMethod.GET)
	 public ModelAndView matching(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		service.matching(mav);
		
		return mav;
	}

	/**
	 * 
	 * @함수명 : searchMatching
	 * @작성일 : 2015. 7. 6.
	 * @작성자 : 이희재
	 * @설명   :  매칭 시작과 동시에 매칭 정보를 매칭 테이블에 입력
	 */
	@RequestMapping(value="/teamPage/searchMatching.do" , method=RequestMethod.POST)
	public ModelAndView searchMatching(HttpServletRequest request , MatchingDto matchingDto){
		logger.info("TeamController searchMatching");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request" , request);
		mav.addObject("matchingDto" , matchingDto);
		
		service.searchMatching(mav);
		return mav;
	}
	
	/**
	 * 
	 * @함수명 : searchMatching
	 * @작성일 : 2015. 7. 6.
	 * @작성자 : 이희재
	 * @설명   :  매칭 취소하기 
	 */
	@RequestMapping(value="/teamPage/deleteMatching.do" , method=RequestMethod.GET)
	public ModelAndView deleteMatching(HttpServletRequest request){
		logger.info("TeamController searchMatching");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request" , request);
		
		service.deleteMatching(mav);
		return mav;
	}
	
	/**
	 * 
	 * @함수명 : searchMatching
	 * @작성일 : 2015. 7. 6.
	 * @작성자 : 이희재
	 * @설명   :  매칭 시작하기
	 */
	@RequestMapping(value="/teamPage/searching.do" , method=RequestMethod.GET)
	public ModelAndView searching(HttpServletRequest request){
		logger.info("TeamController searchMatching");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request" , request);
		
		service.searching(mav);
		return mav;
	}
	
	/**
	 * @name : viewMatchingPlace
	 * @date : 2015. 7. 9.
	 * @author : 이희재
	 * @description : 매칭을 완료한 후에 경기장 정보를 제공하기 위한 함수
	 */
	@RequestMapping(value="/teamPage/viewMatchingPlace.do", method=RequestMethod.GET)
	 public ModelAndView viewMatchingPlace(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);	
		service.viewMatchingPlace(mav);		
		return mav;
	}
	
}
