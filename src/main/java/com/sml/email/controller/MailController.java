package com.sml.email.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sml.email.service.MailService;



@Controller
public class MailController {
	final Logger logger=Logger.getLogger(this.getClass().getName());
	@Autowired
	private MailService service;
	
	/**
	 * @함수명:requestKey
	 * @작성일:2015. 7. 9.
	 * @작성자:이한빈 
	 * @설명문:인증번호 요청 버튼 누르면 실행되는 메소드 
	 */
	@RequestMapping(value="/requestKey",method=RequestMethod.POST)
	public ModelAndView requestKey(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		service.requestKey(mav);
		return mav;
	}
	/**
	 * 
	 * @함수명:checkAuthentication
	 * @작성일:2015. 7. 9.
	 * @작성자:이한빈 
	 * @설명문:사용자가 인증번호를 보내면 디비에 저장된 값과 사용자가 보낸 인증번호가 맞는지 비교하는 함
	 *
	 */
	@RequestMapping(value="/checkAuthentication" , method=RequestMethod.POST)
	public ModelAndView checkAuthentication(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request" , request);
		service.checkAuthentication(mav);
		return mav;
	}
	
	/**
	 * @함수명:changeTeamAccount
	 * @작성일:2015. 7. 9.
	 * @작성자:이한빈 
	 * @설명문:인증번호가 맞으면 아이디를 띄워주고 비밀번호 입력을 새로받고 비밀번호를 사용자가 입력한 비밀번호로 수정해주는 함수 
	 */
	@RequestMapping(value="/changeTeamAccount" , method=RequestMethod.POST)
	public ModelAndView changeTeamAccount(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request" , request);
		service.changeTeamAccount(mav);
		
		return mav;
	}
}
