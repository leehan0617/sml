package com.sml.soccer.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import com.sml.common.dto.CommonBoardDto;
import com.sml.team.dto.TeamDto;

public interface SoccerDao {
	public int teamSearch(String teamName);
	public List<HashMap<String, Object>> todayMatch(String matchDay);
	public List<TeamDto> getAllTeamList(String sportType);
	public List<CommonBoardDto> commonBoard(int startRow, int endRow, int sportCode);
	public Date moveMatchDay(String matchDay, String moveMatchDay);	
}
