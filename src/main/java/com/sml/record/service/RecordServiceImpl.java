package com.sml.record.service;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sml.member.service.MemberServiceImpl;
import com.sml.record.dao.RecordDao;
import com.sml.record.dto.RecordDto;


@Service
public class RecordServiceImpl implements RecordService {
	private Logger logger = Logger.getLogger(MemberServiceImpl.class.getName());
	@Autowired
	private RecordDao recordDao;
	
	/**
	 * @name : RecordServiceImpl
	 * @date : 2015. 6. 25.
	 * @author : 이희재
	 * @description : 축구에 대한 전체 기록을 출력해오기 위함
	 * 					하나의 dao의 함수를 이용하여 종목만 다르게하여 출력.
	 */
	@Override
	public void soccerGameScore(ModelAndView mav) {
		HashMap<String, Object> hMap=mav.getModelMap();
		
		List<HashMap<String, Object>> recordList=recordDao.getAllRecordList("축구");
		logger.info("RecordList : " + recordList.size());
		mav.addObject("recordList",recordList);
		mav.setViewName("soccer/soccerGameScore");
	}
}
