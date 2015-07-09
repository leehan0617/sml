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
	
	@RequestMapping(value="/findAccountInfo" , method=RequestMethod.POST)
	public ModelAndView compareNumber(HttpServletRequest request){
		System.out.println("#####dddddd###");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request" , request);
		service.compareNumber(mav);
		
		return mav;
	}
}
