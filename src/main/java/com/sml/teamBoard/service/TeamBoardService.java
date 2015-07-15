package com.sml.teamBoard.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface TeamBoardService {
	public ModelAndView viewTeamBoard(HttpServletRequest request);
	public ModelAndView readTeamBoard(HttpServletRequest mav);
	public void manageTeamBoard(ModelAndView mav);
	public void deleteTeamBoard(ModelAndView mav);
	public void updateTeamBoard(ModelAndView mav);
	public void updateOkTeamBoard(ModelAndView mav);
	public ModelAndView writeTeamBoard(HttpServletRequest request);
	public void viewTeamBoardTemplate(ModelAndView mav);
}
