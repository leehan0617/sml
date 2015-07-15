package com.sml.map.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sml.map.service.MapService;

@Controller
public class MapController {
	@Autowired
	private MapService mapService;
	/**
	 * @name : startMap
	 * @date : 2015. 7. 15.
	 * @author : 이희재
	 * @description : 시작과 동시에 지도에 경기장들의 정보를 보여줌
	 */
	@RequestMapping(value="/map/startMap.do",method=RequestMethod.GET)
	public ModelAndView startMap(HttpServletRequest req, HttpServletResponse res){
		ModelAndView mav=new ModelAndView();
		res.setCharacterEncoding("utf-8");
		mapService.startMap(mav);
		
		return mav;
	}
	
	/**
	 * @name : gameRecordMap
	 * @date : 2015. 7. 15.
	 * @author : 이희재
	 * @description : 시작과 동시에 지도에 진행중인 경기에 대해서 정보를 나타 냄
	 */
	@RequestMapping(value="/map/gameRecordMap.do",method=RequestMethod.GET)
	public ModelAndView gameRecordMap(HttpServletRequest req, HttpServletResponse res){
		ModelAndView mav=new ModelAndView();
		res.setCharacterEncoding("utf-8");
		mapService.gameRecordMap(mav);
		
		return mav;
	}
}
