package com.sml.email.service;

import org.springframework.web.servlet.ModelAndView;

public interface MailService  {
	public void requestKey(ModelAndView mav);

	public void checkAuthentication(ModelAndView mav);

	public void changeTeamAccount(ModelAndView mav);
}
