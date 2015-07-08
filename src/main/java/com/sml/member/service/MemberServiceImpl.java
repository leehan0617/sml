package com.sml.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sml.member.dao.MemberDao;
import com.sml.member.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{
	private Logger logger = Logger.getLogger(MemberServiceImpl.class.getName());
	@Autowired
	private MemberDao dao;
	
	/**
	 * @함수명:teamMemberInfo
	 * @작성일:2015. 6. 23.
	 * @작성자:조영석
	 * @설명문:팀생성을 위한 서비스메소드
	 */
	@Override
	public void teamMember(ModelAndView mav) {	
		logger.info("MemberService teamMemberInfo");
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		MemberDto memberDto=(MemberDto)map.get("memberDto");

		String teamId=request.getParameter("teamId");
		String teamPassword=request.getParameter("teamPassword");
		String teamName=request.getParameter("teamName");
		String sportType=request.getParameter("sportType");
		String homeGround=request.getParameter("homeGround");
		String teamReaderName="";
		String emblem="";
		String teamGrade="AA";
		
		int check=dao.insertMember(memberDto,teamId,teamPassword,teamName,sportType,teamGrade,teamReaderName,emblem,homeGround);
		mav.addObject("check",check);
		mav.setViewName("member/registerResult");
	}
	
	@Override
	/**
	 * 
	 * @함수명 : teamMemberInfo
	 * @작성일 : 2015. 6. 23.
	 * @작성자 : 이한빈
	 * @설명   :  팀컨트롤러에서 팀게시판에서 팀맴버소개 및 관리 요청이 오면 실행되는 메소드
	 */
	public void teamMemberInfo(ModelAndView mav) {	
		logger.info("MemberService teamMemberInfo");
		
		List<MemberDto> member = dao.teamMemberInfo();
		mav.addObject("member" , member);
	}	
}
