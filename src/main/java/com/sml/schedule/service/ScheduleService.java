package com.sml.schedule.service;

import org.springframework.web.servlet.ModelAndView;

public interface ScheduleService {
	public void scheduleContent(ModelAndView mav);
	public void deleteSchedule(ModelAndView mav);
	public void showSchedule(ModelAndView mav);
	public void readteamSchedule(ModelAndView mav);
	public void editSchedule(ModelAndView mav);
}	
