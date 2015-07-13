package com.sml.league.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.sml.league.dao.LeagueDao;
import com.sml.league.dto.LeagueDto;

@Component
public class LeagueServiceImpl implements LeagueService{
	@Autowired
	private LeagueDao dao;

	/**
	 * @함수명:applicate
	 * @작성일:2015. 7. 9.
	 * @작성자:조영석
	 * @설명문:리그신청관리 서비스 메소드
	 */
	@Override
	public void applicate(ModelAndView mav) {
		Map<String,Object> map=mav.getModel();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamId=request.getParameter("teamId");
		int leagueCode=Integer.parseInt(request.getParameter("leagueCode"));
		int leagueTeamNumber=Integer.parseInt(request.getParameter("leagueTeamNumber"));
		int leagueCount=dao.getLeagueCount(leagueCode);
		
		if(leagueCount>=leagueTeamNumber){
			int check=-3;
			
			mav.addObject("check",check);
			mav.setViewName("soccer/applicateOk");
			
		}else{
			int teamCode=dao.getTeamCode(teamId);
			int value=dao.getLeagueJoinSelect(teamCode);
			
			if(value==0){
				int check=dao.applicate(teamCode,leagueCode);
				
				int scheduleCount=dao.getLeagueCount(leagueCode);
				
				if(scheduleCount==leagueTeamNumber){
					leagueSchedule(leagueCode);
				}
				
				mav.addObject("check",check);
				mav.setViewName("soccer/applicateOk");
			}else{
				int check=-1;
					
				mav.addObject("check",check);
				mav.setViewName("soccer/applicateOk");
			}
		}
		
	}
	
	/**
	 * @name : leagueSchedule
	 * @date : 2015. 7. 13.
	 * @author : 이희재
	 * @description : 리그 신청 후 정원이 꽉차면 요일에 따른 날짜 구하기
	 */
	public void leagueSchedule(int leagueCode){
		LeagueDto league=dao.getLeagueInfo(leagueCode);
		int teamCount=league.getLeagueTeamNumber();
		
		// 총 경기 수
		int gameCount=(teamCount*(teamCount-1))/2;
		
		ArrayList<Date> dateList=new ArrayList<Date>();
		
		// 주말 날짜 구하기
		Date date=new Date();
		Date dateSun=new Date();
		
		Calendar cal=Calendar.getInstance();
		cal.setTime(new java.util.Date(System.currentTimeMillis()));
		
		int day=date.getDay();
		
		if(day<6){
			// 이번주 토요일
			cal.add(cal.DAY_OF_WEEK, 6-day);
			date=cal.getTime();
			
			// 이번주 일요일
			cal.add(cal.DAY_OF_WEEK, 1);
			dateSun=cal.getTime();
		}
		
		// 토요일 날짜
		cal.setTime(date);
		dateList.add(date);
		
		for(int i=0;i<10;i++){
			cal.add(Calendar.DATE, 7);
			Date tempDate=cal.getTime();
			dateList.add(tempDate);
			cal.setTime(tempDate);
		}
		
		for(int i=0;i<dateList.size();i++){
			System.out.println(dateList.get(i));
		}
		
		System.out.println("일요일------------------");
		// 일요일 날짜
		dateList=new ArrayList<Date>();
		cal.setTime(dateSun);
		dateList.add(dateSun);
		
		for(int i=0;i<10;i++){
			cal.add(Calendar.DATE, 7);
			Date tempDate=cal.getTime();
			dateList.add(tempDate);
			cal.setTime(tempDate);
		}
		
		for(int i=0;i<dateList.size();i++){
			System.out.println(dateList.get(i));
		}
	}
}
