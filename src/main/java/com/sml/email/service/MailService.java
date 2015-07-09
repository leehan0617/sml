package com.sml.email.service;

import org.springframework.web.servlet.ModelAndView;

public interface MailService  {
	public void sendEmail(ModelAndView mav) throws Exception;

	public void compareNumber(ModelAndView mav);

	public void requestKey(ModelAndView mav);
}
