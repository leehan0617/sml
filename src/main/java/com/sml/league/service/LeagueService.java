package com.sml.league.service;

import org.springframework.web.servlet.ModelAndView;

public interface LeagueService {
	public void applicate(ModelAndView mav);
	public void searchLeague(ModelAndView mav);
	public void viewLeagueInfo(ModelAndView mav);
	public void getLeagueInfo(ModelAndView mav);
}
