package com.sml.team.dao;

import java.util.HashMap;
import java.util.List;

import com.sml.team.dto.TeamDto;
import com.sml.team.dto.TeamLogDto;

public interface TeamDao {
	public String idCheck(String teamId);
	public String teamIdCheck(String teamName);
	public TeamDto login(String id, String password);	
	public List<HashMap<String, Object>> recordList(String teamName, int startRow, int endRow);
	public int getRecordCount(String teamName);
	public List<String> getGugunList(String sido);
	public List<String> getSidoList();
	public String getTeamGround(int teamCode);
	public int updateTeamEmblem(TeamDto teamDto);
	public List<TeamLogDto> teamLogDtoList(int teamCode,int startRow,int endRow);
	public int getTeamLogCount();	
	public HashMap<String, Object> getNormalMatchInfo(int teamCode);
	public TeamDto getTeamInfo(int teamCode);	
	public int updateHomeGround(String homeGround, int teamCode);	
	public int updateTeamInfo(String teamPassword, String teamName, String sportType, int teamCode);
	public int replyWrite(TeamLogDto teamLog);
	public List<TeamLogDto> getReplyList(String teamName);
	public List<TeamLogDto> getMoreReplyList(int teamCode , int pageNumber);
	public int replyDelete(int teamCode, int replyCode);
	public TeamDto getTeamInfo(String teamName);
	public int editTeamIntro(int teamCode, String teamIntro);
	
}
