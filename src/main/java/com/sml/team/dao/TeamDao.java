package com.sml.team.dao;

import java.util.HashMap;
import java.util.List;

import com.sml.member.dto.MemberDto;
import com.sml.team.dto.TeamBoardDto;
import com.sml.team.dto.TeamDto;
import com.sml.team.dto.TeamLogDto;

public interface TeamDao {
	public String idCheck(String teamId);
	public String teamIdCheck(String teamName);
	public TeamDto login(String id, String password);
	public List<TeamBoardDto> viewTeamBoard(String teamName, int startRow, int endRow);
	public TeamDto getTeamInfo(String teamName);
	public List<MemberDto> getTeamMemberList(String teamName,int startRow, int endRow);
	public int getBoardCount(String teamName);
	public TeamBoardDto getBoardDto(int boardNumber);
	public int writeTeamBoard(TeamBoardDto board);
	public int deleteTeamBoard(int boardNumber);
	public int updateTeamBoard(TeamBoardDto board);
	public int getTeamMemberCount(String name);
	public int addMember(MemberDto member,int teamCode);
	public int deleteMember(int memberCode);
	public List<HashMap<String, Object>> recordList(String teamName, int startRow, int endRow);
	public int getRecordCount(String teamName);
	public List<String> getGugunList(String sido);
	public List<String> getSidoList();
	public String getTeamGround(int teamCode);
	public int updateTeamEmblem(TeamDto teamDto);
	public int selectTeamCode(String teamName);
	public List<TeamLogDto> teamLogDtoList(int teamCode);
	public int addTeamLog(TeamLogDto teamLogDto);
	public int teamLogDelete(String replyPassword,int replyCode);
	public HashMap<String, Object> getNormalMatchInfo(int teamCode);
	public TeamDto getTeamInfo(int teamCode);
}
