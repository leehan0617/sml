package com.sml.baseball.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface BaseballService {
	
	public void baseBallRule(ModelAndView mav);
	
	public ModelAndView viewSoccerBoard(HttpServletRequest request);

	public ModelAndView readSoccerBoard(HttpServletRequest request);

	public ModelAndView showAgeChart(HttpServletRequest request);

	public ModelAndView showCityChart(HttpServletRequest request);

	public ModelAndView showDayChart(HttpServletRequest request);	
	
	public void soccerTeamList(ModelAndView mav);

	public ModelAndView showLeagueInfo(HttpServletRequest request);

	public ModelAndView leagueTable(HttpServletRequest request);

	public ModelAndView joinLeague(HttpServletRequest request);
	
	public void soccerCommonBoard(ModelAndView mav);

	public ModelAndView showRecentMatch(HttpServletRequest request);

	public ModelAndView findMatchTeams(HttpServletRequest request);
}
