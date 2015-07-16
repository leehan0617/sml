package com.sml.team.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface TeamService {
	public void login(ModelAndView mav);

	public void idCheck(ModelAndView mav);
	public void teamIdCheck(ModelAndView mav);
	public void goTeamPage(ModelAndView mav);
	
	public void viewTeamRecord(ModelAndView mav);
	public void searchRegion(ModelAndView mav);
	public void updateTeamEmblem(ModelAndView mav);
	public void updateTeamEmblemOk(ModelAndView mav);
	
	public void updateTeamInfo(ModelAndView mav);
	public void updateTeamInfoOk(ModelAndView mav);

	public void replyWrite(ModelAndView mav);

	public void getReplyList(ModelAndView mav);

	public void replyMoreRead(ModelAndView mav);

	public void replyDelete(ModelAndView mav);

	public ModelAndView editTeamIntro(HttpServletRequest request);
}
