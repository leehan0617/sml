package com.sml.member.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sml.member.dto.MemberDto;
import com.sml.member.service.MemberService;

@Controller
public class MemberController {
	private Logger logger = Logger.getLogger(MemberController.class.getName());
	@Autowired
	private MemberService service;
	

	/**
	 * @함수명:teamMember
	 * @작성일:2015. 6. 25.
	 * @작성자:조영석
	 * @설명문:팀원등록을 위한 이동메소드
	 */
	@RequestMapping(value="/member/registerMember.do" , method=RequestMethod.POST)
	public ModelAndView teamMember(HttpServletRequest request,HttpServletResponse response,MemberDto memberDto){
		logger.info("MemberController teamMemberInfo");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("memberDto",memberDto);
		service.teamMember(mav);
		return mav;
	}
	
	/**
	 * 
	 * @함수명 : teamMemberInfo
	 * @작성일 : 2015. 6. 23.
	 * @작성자 : 이한빈
	 * @설명   : 팀페이지에서 팀원소개 및 팀원관리 메소드 (구분은 JSP페이지에서 처리해야할듯)
	 */
	@RequestMapping(value="/teamMemberInfo.do" , method=RequestMethod.GET)
	public ModelAndView teamMemberInfo(){
		logger.info("MemberController teamMemberInfo");
		ModelAndView mav = new ModelAndView("teamPage/teamMemberInfo");
		service.teamMemberInfo(mav);
		return mav;
	}
	
	/**
	 * 
	 * @함수명 : myInfoPage
	 * @작성일 : 2015. 7. 10.
	 * @작성자 : 변형린
	 * @설명   : 팀페이지에서 회원수정 페이지로 이동
	 */										
	@RequestMapping(value="/member/myInfoPage.do" , method=RequestMethod.GET)			
	public ModelAndView myInfoPage(HttpServletRequest request){
		logger.info("MemberController myInfoPage");		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		service.myInfoPage(mav);
		return mav;
	}
	
	/**
	 * 
	 * @함수명 : updateMemberInfo
	 * @작성일 : 2015. 7. 10.
	 * @작성자 : 변형린
	 * @설명   : 팀페이지에서 회원수정 페이지로 이동
	 */										
	@RequestMapping(value="/member/updateMemberInfo.do" , method=RequestMethod.GET)			
	public ModelAndView updateMemberInfo(HttpServletRequest request){
		logger.info("MemberController updateMemberInfo");		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		service.updateMemberInfo(mav);
		return mav;
	}
	
	
	/**
	 * 
	 * @함수명 : updateMemberInfo
	 * @작성일 : 2015. 7. 10.
	 * @작성자 : 변형린
	 * @설명   : 회원정보 수정
	 */										
	@RequestMapping(value="/member/updateMemberInfoOk.do" , method=RequestMethod.POST)			
	public ModelAndView updateMemberInfoOk(HttpServletRequest request, MemberDto memberDto){
		logger.info("MemberController updateMemberInfoOk");		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("memberDto", memberDto);
		service.updateMemberInfoOk(mav);
		return mav;
	}
}
