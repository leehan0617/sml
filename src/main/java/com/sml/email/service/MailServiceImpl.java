package com.sml.email.service;

import java.util.Map;
import java.util.logging.Logger;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.sml.email.controller.MailSetting;
import com.sml.email.dao.MailDao;

@Component
public class MailServiceImpl implements MailService{
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	@Autowired
	private MailDao dao;
	
	/*
	
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
	*/
	/**
	 * @함수명:requestKey
	 * @작성일:2015. 7. 9.
	 * @작성자:이한빈 
	 * @설명문:메일 컨트롤러에서 넘어온 서비스 메소드 
	 */
	@Override
	public void requestKey(ModelAndView mav) {
		Map<String , Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String name = request.getParameter("memberName");
		String phone = request.getParameter("memberPhone");
		
		int check = dao.checkInfo(name,phone);
		String email = dao.findEmail(name,phone);
		mav.addObject("check" , check);
		
		if(check == 0){
			String errorMsg = "입력된 정보가 존재하지않거나 잘못되었습니다";
			mav.addObject("errorMsg" , errorMsg);
			mav.setViewName("team/writeAuthenticationNumber");
		}else{
			int teamCode = this.processFindInfo(name , phone);
			String authenticationNumber = this.RandomNum();
			
			String from = "sml.korea.kosta@gmail.com";    // 메일 보내는 사람
			String to = email;   // 메일 보낼사람
			String cc = "";     // 참조
			String subject = "SML Korea 계정 정보 입니다.";// 제목
			String content = "인증번호 :" + authenticationNumber;// 내용
			
			try{
				MailSetting mt = new MailSetting();
				mt.sendEmail(from, to, cc, subject, content);
				mav.addObject("teamCode" , teamCode);
				System.out.println("메일 전송에 성공하였습니다.");
			}catch(MessagingException me){
				System.out.println("메일 전송에 실패하였습니다.");
		  		System.out.println("실패 이유 : " + me.getMessage());
		  	}catch(Exception e) {
		  		System.out.println("메일 전송에 실패하였습니다.");
		  		System.out.println("실패 이유 : " + e.getMessage());
		  	}
			mav.setViewName("team/writeAuthenticationNumber");
		}
		
	}
	
	/**
	 * @함수명:processFindInfo
	 * @작성일:2015. 7. 9.
	 * @작성자:이한빈 
	 * @설명문:디비에 관련된 정보가 있으면 인증번호를 생성하고 이메일을 보내는 메소드 
	 *
	 */
	private int processFindInfo(String name , String phone) {
		logger.info("processFindInfo");
		int teamCode = dao.findTeamCode(name,phone);
		return teamCode;
	}
	
	private String RandomNum(){
		StringBuffer buffer=new StringBuffer();
		
		for(int i=0;i<3;i++){
			int n=(int)(Math.random()*100);
			buffer.append(n);
		}
		return buffer.toString();
	}


	@Override
	public void sendEmail(ModelAndView mav) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void compareNumber(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}
	
	
}
