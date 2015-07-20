package com.sml.soccer.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.sml.common.dto.CommonBoardDto;
import com.sml.league.dto.LeagueDto;
import com.sml.member.dto.MemberDto;
import com.sml.team.dto.TeamDto;

public interface SDao {

	public int getBoardCount(int sportCode);

	public List<CommonBoardDto> getSoccerBoardList(int sportCode, int startRow,
			int endRow);

	public CommonBoardDto getBoardContent(int boardNumber);

	public List<MemberDto> showAgeChart(String sportType);

	public List<Date> showDayChart(String sportType);
	
	public List<TeamDto> getAllTeamList(String sportType);

	public List<LeagueDto> showLeagueInfo(String sportType);

	public List<LeagueDto> getLeagueJoin();

	public int joinLeague(HashMap<String, Object> hMap);

}
