package com.sml.legball.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LegballController {
	
	@RequestMapping(value="/scMain",method=RequestMethod.GET)
	public ModelAndView test(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("sc/soccerMain");
		
		return mav;
	}
}
