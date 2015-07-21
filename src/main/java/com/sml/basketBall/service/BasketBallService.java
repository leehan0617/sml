package com.sml.basketBall.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface BasketBallService {
	public ModelAndView viewbasketBallBoard(HttpServletRequest request);

	public ModelAndView readbasketBallBoard(HttpServletRequest request);

	public ModelAndView showAgeChart(HttpServletRequest request);

	public ModelAndView showCityChart(HttpServletRequest request);

	public ModelAndView showDayChart(HttpServletRequest request);
	
	public void basketBallRule(ModelAndView mav);
	
	public void basketBallTeamList(ModelAndView mav);

	public ModelAndView showLeagueInfo(HttpServletRequest request);

	public ModelAndView leagueTable(HttpServletRequest request);

	public ModelAndView joinLeague(HttpServletRequest request);
	
	public void basketBallCommonBoard(ModelAndView mav);

	public ModelAndView showRecentMatch(HttpServletRequest request);

	public ModelAndView findMatchTeams(HttpServletRequest request);

}
