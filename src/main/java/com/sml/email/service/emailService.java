package com.sml.email.service;

import org.springframework.web.servlet.ModelAndView;

public interface emailService  {
	public void sendEmail(ModelAndView mav) throws Exception;

	public void compareNumber(ModelAndView mav);
}
