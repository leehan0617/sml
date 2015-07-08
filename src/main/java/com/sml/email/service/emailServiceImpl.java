package com.sml.email.service;

import java.util.Map;
import java.util.logging.Logger;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.mail.javamail.JavaMailSender;

import com.sml.email.dao.emailDao;
import com.sml.email.dto.emailDto;

@Component
public class emailServiceImpl implements emailService{
	final Logger logger=Logger.getLogger(this.getClass().getName());
	@Autowired
	private emailDao dao;
	JavaMailSender mailSender;
	
	/**
	 * @함수명:sendEmail
	 * @작성일:2015. 7. 8.
	 * @작성자:조영석
	 * @설명문:팀장이름,폰번호 여부 확인을위한 서비스메소드
	 */
	@Override
	public void sendEmail(ModelAndView mav)throws Exception {
		Map<String,Object> map=mav.getModel();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String memberName=request.getParameter("memberName");
		String memberPhone=request.getParameter("memberPhone");
		String memberEmail=request.getParameter("memberEmail");
		
		String check=dao.search(memberName,memberPhone,memberEmail);
		System.out.println("check"+check);
		if(check!=null){
			emailDto email=new emailDto();
			email.setContent("인증번호는"+""+"입니다");
			
			MimeMessage msg= mailSender.createMimeMessage();
			
			try{
				mailSender.send(msg);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else{
			
		}
		mav.addObject("check",check);
		mav.setViewName("teamPage/emailConfirm");
	}
}
