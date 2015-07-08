package com.sml.common.service;

import org.springframework.web.servlet.ModelAndView;

public interface CommonService {
	public void addCommonBoard(ModelAndView mav);
	public void addCommonBoardOk(ModelAndView mav);
	public void adminBoard(ModelAndView mav);
	public void deleteCommonBoard(ModelAndView mav);
	public void readCommonBoard(ModelAndView mav);
	public void updateCommonBoardSelect(ModelAndView mav);
	public void updateCommonBoardOk(ModelAndView mav);
}
