package com.sml.soccer.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface SoccerService {
	public void soccerMain(ModelAndView mav);
	public void teamSearch(ModelAndView mav);	
	public void soccerRule(ModelAndView mav);
	public void soccerTeamList(ModelAndView mav);
	public void soccerGameScore(ModelAndView mav);
	public void soccerRefereeList(ModelAndView mav);
	public void commonBoard(ModelAndView mav);
	public ModelAndView readCommonBoard(HttpServletRequest request);
	public void soccerLeague(ModelAndView mav);
	public ModelAndView cards(HttpServletRequest mav);
}
