package com.sml.league.dao;

import java.util.List;

import com.sml.league.dto.LeagueDto;
import com.sml.record.dto.RecordDto;
import com.sml.schedule.dto.ScheduleDto;
import com.sml.team.dto.TeamDto;

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
	public TeamDto getTeamInfo(int teamCode);
	public void insertLeagueSchedule(ScheduleDto scheduleDto);
	public int invalidSchedule(RecordDto record, int teamCode);
	public void changeLeagueState(LeagueDto league);
	public List<LeagueDto> searchLeague(String leagueName);
	public LeagueDto getTeamLeagueInfo(String teamName);
	public List<TeamDto> getLeagueTeamList(int leagueCode);
	public List<RecordDto> getRecordList(int leagueCode);
	public int getCountWin(int teamCode, int leagueCode);
	public int getCountLose(int teamCode, int leagueCode);
	public int getCountDraw(int teamCode, int leagueCode);
	public int getCountGame(int teamCode, int leagueCode);
	public String getTeamId(String teamName);
	public String getTeamEmblem(String teamName);
}
