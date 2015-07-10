package com.sml.matching.dao;

import java.util.HashMap;
import java.util.List;

import com.sml.matching.dto.MatchingDto;
import com.sml.member.dto.MemberDto;
import com.sml.team.dto.TeamDto;

public interface MatchingDao {
	public int searchMatching(MatchingDto matchingDto);
	public MatchingDto getTeamMatchingInfo(int teamCode);
	public int deleteMatching(int matchingCode);
	public List<MatchingDto> getOtherMatchingInfo(int teamCode, String sportType);
	public void changeMatchingState(MatchingDto matchingDto);
	public void createGameRecord(MatchingDto myMatchingDto, MatchingDto otherMatchingDto);
	public void setWaitMatching(int teamCode);
	public TeamDto getTeamInfo(String teamName);
	public String getTeamGround(int teamCode);
	public HashMap<String, Object> getNormalMatchInfo(int teamCode);
	public TeamDto getTeamInfo(int myTeamCode);
	public MemberDto getTeamLeaderInfo(int teamCode, String leaderName);
	
}
