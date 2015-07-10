package com.sml.teamBoard.service;

import org.springframework.web.servlet.ModelAndView;

public interface TeamBoardService {
	public void viewTeamBoard(ModelAndView mav);
	public void readTeamBoard(ModelAndView mav);
	public void manageTeamBoard(ModelAndView mav);
	public void writeTeamBoard(ModelAndView mav);
	public void writeOkTeamBoard(ModelAndView mav);
	public void deleteTeamBoard(ModelAndView mav);
	public void updateTeamBoard(ModelAndView mav);
	public void updateOkTeamBoard(ModelAndView mav);
}
