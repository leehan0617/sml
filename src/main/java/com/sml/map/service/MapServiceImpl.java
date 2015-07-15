package com.sml.map.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sml.map.dao.MapDao;

@Service
public class MapServiceImpl implements MapService {

	@Autowired
	private MapDao mapDao;
	
	/**
	 * @name : startMap
	 * @date : 2015. 7. 15.
	 * @author : 이희재
	 * @description : 경기장 리스트를 가져옴
	 */
	@Override
	public void startMap(ModelAndView mav) {
		List<HashMap<String, Object>> mapList=mapDao.getTeamMapList();
//		for(int i=0;i<mapList.size();i++){
//			System.out.println(mapList.get(i).get("TEAMNAME") + "," + mapList.get(i).get("GROUND"));
//		}

		mav.addObject("mapList",mapList);
		mav.setViewName("jsonView");
	}

	/**
	 * @name : gameRecordMap
	 * @date : 2015. 7. 15.
	 * @author : 이희재
	 * @description : 진행중인 경기를 가져 옴
	 */
	@Override
	public void gameRecordMap(ModelAndView mav) {
		List<HashMap<String, Object>> recordList=mapDao.getRecordList();
		
		mav.addObject("recordList",recordList);
		mav.setViewName("jsonView");
	}

}
