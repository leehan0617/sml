package com.sml.record.service;

import org.springframework.web.servlet.ModelAndView;

public interface RecordService {
	public void soccerGameScore(ModelAndView mav);
	public void getRecordList(ModelAndView mav);
	public void getMatchingResult(ModelAndView mav);
	public void insertMatchingResult(ModelAndView mav);
}
