package com.sml.soccer.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface SService {

	public ModelAndView viewSoccerBoard(HttpServletRequest request);

	public ModelAndView readSoccerBoard(HttpServletRequest request);

}
