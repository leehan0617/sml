package com.sml.team.service;

import org.springframework.web.servlet.ModelAndView;

public interface TeamService {
	public void login(ModelAndView mav);
	public void viewSchedule(ModelAndView mav);
	public void viewTeamBoard(ModelAndView mav);
	public void viewRecord(ModelAndView mav);
	public void searchMatching(ModelAndView mav);
	public void registerTeam(ModelAndView mav);
	public void idCheck(ModelAndView mav);
	public void teamIdCheck(ModelAndView mav);
	public void goTeamPage(ModelAndView mav);
	public void viewTeamMemberInfo(ModelAndView mav);
	public void readTeamBoard(ModelAndView mav);
	public void manageTeamBoard(ModelAndView mav);
	public void writeTeamBoard(ModelAndView mav);
	public void writeOkTeamBoard(ModelAndView mav);
	public void deleteTeamBoard(ModelAndView mav);
	public void updateTeamBoard(ModelAndView mav);
	public void updateOkTeamBoard(ModelAndView mav);
	public void manageTeamMember(ModelAndView mav);
	public void addMember(ModelAndView mav);
	public void deleteMember(ModelAndView mav);
	public void viewTeamRecord(ModelAndView mav);
	public void searchRegion(ModelAndView mav);
	public void matching(ModelAndView mav);
	public void deleteMatching(ModelAndView mav);
	public void searching(ModelAndView mav);
	public void updateTeamEmblem(ModelAndView mav);
	public void updateTeamEmblemOk(ModelAndView mav);
	public void addTeamLog(ModelAndView mav);
	public void teamLogDelete(ModelAndView mav);
	public void scheduleContent(ModelAndView mav);
	public void deleteSchedule(ModelAndView mav);
	public void showSchedule(ModelAndView mav);
	public void readteamSchedule(ModelAndView mav);
	public void editSchedule(ModelAndView mav);
}
