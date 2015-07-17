package com.sml.schedule.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sml.schedule.dao.ScheduleDao;
import com.sml.schedule.dto.ScheduleDto;
import com.sml.team.dto.TeamDto;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	private final Logger logger = Logger.getLogger(ScheduleServiceImpl.class.getName());
	@Autowired
	private ScheduleDao dao;
	/**
	 * @함수명:readteamSchedule
	 * @작성일:2015. 7. 6.
	 * @작성자:조영석
	 * @설명문:스케쥴 일정 계시용 메소드
	 */
	@Override
	public void readteamSchedule(ModelAndView mav) {
		logger.info("ScheduleService readTeamSchedule");
		Map<String , Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		List<ScheduleDto> scheduleDtoList=null;
		String teamName=request.getParameter("teamName");
		
		System.out.println("teamName : " + teamName);
		int count=dao.readCount(teamName);
		if(count>0){
			scheduleDtoList=dao.readSchedule(teamName); 
		}
		
		JSONArray jsonArray=JSONArray.fromObject(scheduleDtoList);
//		System.out.println("scheduleDtoList:"+jsonArray);
		
		Map<String,Object> Map=new HashMap<String,Object>();
		Map.put("scheduleDtoList", jsonArray);
		
		JSONObject jsonObject=JSONObject.fromObject(Map);
//		System.out.println("json-"+jsonObject);
		
		mav.addObject("jsonObject",jsonObject);
		mav.addObject("teamName",teamName);
		mav.setViewName("teamSchedule/teamSchedule");
	}
	
	/**
	 * @함수명:editSchedule
	 * @작성일:2015. 7. 6.
	 * @작성자:조영석
	 * @설명문:스케쥴일정 입력 데이터처리를 위한 메소드 
	 */
	@Override
	public void editSchedule(ModelAndView mav) {
		Map<String , Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		ScheduleDto scheduleDto=(ScheduleDto)map.get("scheduleDto");
		String teamId=request.getParameter("teamId");
		System.out.println("content:::"+scheduleDto.getscheduleContent());
		System.out.println("start:::"+scheduleDto.getStartDate());
		System.out.println("number:::"+scheduleDto.getScheduleNumber());
		System.out.println("title:::"+scheduleDto.getscheduleTitle());
		System.out.println("endDate:::"+scheduleDto.getEndDate());
		int check=dao.editSchedule(scheduleDto,teamId);
		
		
		mav.addObject("check",check);
		mav.setViewName("teamSchedule/editSchedule");
	}
	/**
	 * @함수명:showSchedule
	 * @작성일:2015. 7. 3.
	 * @작성자:조영석
	 * @설명문:스케쥴 세부일정 열람을 위한 서비스 메소드
	 */
	@Override
	public void showSchedule(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamId=request.getParameter("teamId");
		
		mav.addObject("teamId",teamId);
		mav.setViewName("teamSchedule/editSchedule");
		
	}
	
	/**
	 * @함수명:scheduleContent
	 * @작성일:2015. 7. 7.
	 * @작성자:조영석
	 * @설명문:세부일정의 해당 내용 을 보기위한 메소드  
	 */
	@Override
	public void scheduleContent(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");

		int scheduleNumber=Integer.parseInt(request.getParameter("scheduleNumber"));
		ScheduleDto scheduleDto=dao.scheduleContents(scheduleNumber);
		
		TeamDto teamDto=new TeamDto();
		if(scheduleDto!=null){
			teamDto=dao.selectMember(scheduleNumber);
		}
		mav.addObject("scheduleDto",scheduleDto);
		mav.addObject("teamDto",teamDto);
		mav.setViewName("teamSchedule/ScheduleContent");
	}

	/**
	 * @함수명:deleteSchedule
	 * @작성일:2015. 7. 7.
	 * @작성자:조영석
	 * @설명문:스케쥴 삭제용 서비스 메소드
	 */
	@Override
	public void deleteSchedule(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int scheduleNumber=Integer.parseInt(request.getParameter("scheduleNumber"));
		int check=dao.deleteSchedule(scheduleNumber);	

		mav.addObject("check",check);
		mav.setViewName("teamSchedule/ScheduleContent");
	}
}
