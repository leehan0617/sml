package com.sml.soccer.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import com.sml.common.dto.CommonBoardDto;
import com.sml.league.dto.LeagueDto;
import com.sml.team.dto.TeamDto;

public interface SoccerDao {
	public int teamSearch(String teamName);
	public List<HashMap<String, Object>> todayMatch(String matchDay);
	public List<TeamDto> getAllTeamList(String sportType);
	public List<CommonBoardDto> commonBoard(int startRow, int endRow, int sportCode);
	public Date moveMatchDay(String matchDay, String moveMatchDay);	
	public int LeagueCount(String leagueSport);
	public List<LeagueDto> LeagueList(int startRow,int endRow,String leagueSport);
	public int remitCount(int leagueCode);
}
