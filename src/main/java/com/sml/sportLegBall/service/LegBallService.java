package com.sml.sportLegBall.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface LegBallService {
	public ModelAndView viewlegBallBoard(HttpServletRequest request);

	public ModelAndView readlegBallBoard(HttpServletRequest request);

	public ModelAndView showAgeChart(HttpServletRequest request);

	public ModelAndView showCityChart(HttpServletRequest request);

	public ModelAndView showDayChart(HttpServletRequest request);
	
	public void legBallRule(ModelAndView mav);
	
	public void legBallTeamList(ModelAndView mav);

	public ModelAndView showLeagueInfo(HttpServletRequest request);

	public ModelAndView leagueTable(HttpServletRequest request);

	public ModelAndView joinLeague(HttpServletRequest request);
	
	public void legBallCommonBoard(ModelAndView mav);

	public ModelAndView showRecentMatch(HttpServletRequest request);

	public ModelAndView findMatchTeams(HttpServletRequest request);

}
