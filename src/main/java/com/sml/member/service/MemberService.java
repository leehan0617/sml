package com.sml.member.service;

import org.springframework.web.servlet.ModelAndView;

public interface MemberService {
	public void teamMemberInfo(ModelAndView mav);
	public void teamMember(ModelAndView mav);
	public void myInfoPage(ModelAndView mav);
	public void updateMemberInfo(ModelAndView mav);
	public void updateMemberInfoOk(ModelAndView mav);
	public void viewTeamMemberInfo(ModelAndView mav);
	public void manageTeamMember(ModelAndView mav);
	public void addMember(ModelAndView mav);	
	public void deleteMember(ModelAndView mav);
	public void searchMember(ModelAndView mav);
}
