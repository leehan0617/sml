package com.sml.referee.service;

import org.springframework.web.servlet.ModelAndView;

public interface RefereeService {
	public void refereeList(ModelAndView mav);
	public void registerReferee(ModelAndView mav);
	public void registerRefereeOk(ModelAndView mav);
}
