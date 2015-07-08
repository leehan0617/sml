package com.sml.email.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sml.email.dto.emailDto;
import com.sml.email.service.emailService;



@Controller
public class emailController {
	final Logger logger=Logger.getLogger(this.getClass().getName());
	@Autowired
	private emailService service;
	
	/**
	 * @함수명:requestPW
	 * @작성일:2015. 7. 8.
	 * @작성자:조영석
	 * @설명문:아이디/비밀번호 찾기 페이지 이동
	 */
	@RequestMapping(value="/email/requestPW.do",method=RequestMethod.GET)
	public String requestPW(){
		return "teamPage/requestPW";
	}
	
	/**
	 * @throws Exception 
	 * @함수명:requestPW
	 * @작성일:2015. 7. 8.
	 * @작성자:조영석
	 * @설명문:팀장이름,폰번호 여부 확인을위한 컨트롤 메소드
	 */
	@RequestMapping(value="/email/sendEmail.do",method=RequestMethod.POST)
	public ModelAndView requestPW(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		service.sendEmail(mav);
		return mav;
	}
}
