package com.sml.soccer.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface SService {

	public ModelAndView viewSoccerBoard(HttpServletRequest request);

	public ModelAndView readSoccerBoard(HttpServletRequest request);

	public ModelAndView showAgeChart(HttpServletRequest request);

	public ModelAndView showCityChart(HttpServletRequest request);

	public ModelAndView showDayChart(HttpServletRequest request);
	
	public void soccerRule(ModelAndView mav);
	
	public void soccerTeamList(ModelAndView mav);

}
