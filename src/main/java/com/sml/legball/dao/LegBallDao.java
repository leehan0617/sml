package com.sml.legball.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.sml.common.dto.CommonBoardDto;
import com.sml.league.dto.LeagueDto;
import com.sml.member.dto.MemberDto;
import com.sml.record.dto.RecordDto;

public interface LegBallDao {
	public int getBoardCount(int sportCode);

	public List<CommonBoardDto> getlegBallBoardList(int sportCode, int startRow,
			int endRow);

	public CommonBoardDto getBoardContent(int boardNumber);

	public List<MemberDto> showAgeChart(String sportType);

	public List<Date> showDayChart(String sportType);
	
	public List<HashMap<String,Object>> getAllTeamList(String sportType,int startRow,int endRow);

	public List<LeagueDto> showLeagueInfo(String sportType);

	public List<LeagueDto> getLeagueJoin();

	public int joinLeague(HashMap<String, Object> hMap);

	public int checkLeague(HashMap<String, Object> hMap);
	
	public int teamCount(String sportType);

	public List<RecordDto> showRecentMatch(String gameType);

	public String findMatchTeams(int parseInt);
}
