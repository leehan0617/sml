package com.sml.teamBoard.dao;

import java.util.List;

import com.sml.team.dto.TeamDto;
import com.sml.teamBoard.dto.TeamBoardDto;

public interface TeamBoardDao {
	public List<TeamBoardDto> viewTeamBoard(String teamName, int startRow, int endRow);
	public int getBoardCount(String teamName);
	public TeamBoardDto getBoardDto(int boardNumber);
	public int deleteTeamBoard(int boardNumber);
	public int updateTeamBoard(TeamBoardDto board);
	public TeamDto getTeamInfo(String teamName);
}
