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
	
	@Override
	public void startMap(ModelAndView mav) {
		List<HashMap<String, Object>> mapList=mapDao.getTeamMapList();
//		for(int i=0;i<mapList.size();i++){
//			System.out.println(mapList.get(i).get("TEAMNAME") + "," + mapList.get(i).get("GROUND"));
//		}

		mav.addObject("mapList",mapList);
		mav.setViewName("jsonView");
	}

}
