package com.sml.email.service;

import java.util.Map;
import java.util.logging.Logger;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.sml.email.controller.MailSetting;
import com.sml.email.dao.emailDao;
import com.sml.member.dto.MemberDto;

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
		
		System.out.println("name : " + memberName + ", phone : " + memberPhone);
		
		MemberDto memberDto=dao.search(memberName,memberPhone);
		String email = memberDto.getMemberEmail();
		String number = this.RandomNum();
		
		if(memberDto !=null){
			String from = "sml.korea.kosta@gmail.com";    // 메일 보내는 사람
			String to = email;   // 메일 보낼사람
			String cc = "";     // 참조
			String subject = "SML Korea 계정 정보 입니다.";// 제목
			String content = "인증번호 :" + number;// 내용
			
		  try {
			 MailSetting mt = new MailSetting();
			 // 메일보내기
			 mt.sendEmail(from, to, cc, subject, content);
			 mav.addObject("phone" , memberPhone);
			 mav.addObject("hintNumber" , number);
			 System.out.println("메일 전송에 성공하였습니다.");
			 dao.addCertification(number,memberPhone);
		  	}catch(MessagingException me) {
		  		System.out.println("메일 전송에 실패하였습니다.");
		  		System.out.println("실패 이유 : " + me.getMessage());
		  	}catch(Exception e) {
		  		System.out.println("메일 전송에 실패하였습니다.");
		  		System.out.println("실패 이유 : " + e.getMessage());
		  	}
			mav.setViewName("teamPage/emailConfirm");	
		}
	}		
	
	/**
	 * @함수명:RandomNum
	 * @작성일:2015. 7. 8.
	 * @작성자:조영석
	 * @설명문:인증번호를 위한 랜덤값
	 */
	public String RandomNum(){
		StringBuffer buffer=new StringBuffer();
		for(int i=0;i<=5;i++){
			int n=(int)(Math.random()*100);
			buffer.append(n);
		}
		return buffer.toString();
	}

	@Override
	public void compareNumber(ModelAndView mav) {
		Map <String , Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		System.out.println("#####eeeee$$$$$");
		
		String number = request.getParameter("number");
		String phone = request.getParameter("phone");
		String key = dao.getCertificationNumber(phone);
		
		System.out.println("key : " + key + "number : " + number);
		
		
		if(number.equals(key)){
			int check = 1;
			mav.addObject("check" , check);
			mav.setViewName("teamPage/resultCertification");
		}else{
			int check = 0;
			mav.addObject("check" , check);
			mav.setViewName("teamPage/resultCertification");
		}
	}
	
	
}
