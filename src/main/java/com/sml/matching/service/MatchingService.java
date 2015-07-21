package com.sml.matching.service;

import org.springframework.web.servlet.ModelAndView;

public interface MatchingService {
	public void searchMatching(ModelAndView mav);
	public void matching(ModelAndView mav);
	public void deleteMatching(ModelAndView mav);
	public void searching(ModelAndView mav);
	public void viewMatchingPlace(ModelAndView mav);
	public void viewOtherTeamInfo(ModelAndView mav);
	public void getMatchingInfo(ModelAndView mav);
}
