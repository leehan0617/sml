package com.sml.email.service;

import java.net.PasswordAuthentication;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Logger;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.mail.javamail.JavaMailSender;

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
		
		MemberDto memberDto=dao.search(memberName,memberPhone);

		if(memberDto!=null){
			String e_mail=memberDto.getMemberEmail();
			String host="smtp.gmail.com";
			String subject="SML Korea: 인증번호전달";
			String fromName="SML Korea";
			String from="SML Korea입니다 귀하의 인증번호입니다";
			String to1=e_mail;
			String autoNum="";
			String content="인증번호["+autoNum+"]";
			autoNum=RandomNum();
			
			Properties p = new Properties();
			 p.put("mail.smtp.user", "vs112kr@gmail.com"); // Google계정@gmail.com으로 설정, 수신측에서는 송신자주소로 보임
			 p.put("mail.smtp.host", "smtp.gmail.com");
			 p.put("mail.smtp.port", "465");
			 p.put("mail.smtp.starttls.enable", "true");
			 p.put("mail.smtp.auth", "true");
			 p.put("mail.smtp.debug", "true");
			 p.put("mail.smtp.socketFactory.port", "465");
			 p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			 p.put("mail.smtp.socketFactory.fallback", "false");
			
			try{
				 
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
			mav.addObject("memberDto",memberDto);
			mav.addObject("autoNum",autoNum);
		}else{
			
		}
		
		mav.setViewName("teamPage/emailConfirm");
	}
	
	/**
	 * @함수명:RandomNum
	 * @작성일:2015. 7. 8.
	 * @작성자:조영석
	 * @설명문:인증번호를 위한 랜덤값
	 */
	public String RandomNum(){
		StringBuffer buffer=new StringBuffer();
		for(int i=0;i<=100;i++){
			int n=(int)(Math.random()*100);
			buffer.append(n);
		}
		return buffer.toString();
	}
}
