package com.sml.league.service;

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
	
	public void leagueSchedule(int leagueCode){
		LeagueDto league=dao.getLeagueInfo(leagueCode);
		
	}
}
