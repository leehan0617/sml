package com.sml.league.dao;

import java.util.List;

import com.sml.league.dto.LeagueDto;
import com.sml.record.dto.RecordDto;

public interface LeagueDao {
	public List<LeagueDto> getLeagueList(String sportType);
	public int applicate(int teamCode,int leagueCode);
	public String getJoinLeagueCode(int teamCode);
	public LeagueDto getLeagueInfo(int leagueCode);
	public int getLeagueCount(int leagueCode);
	public int getTeamCode(String teamId);
	public int getLeagueJoinSelect(int teamCode);
	public List<Integer> getLeagueJoinList(int leagueCode);
	public void insertLeagueGame(RecordDto record);
}
