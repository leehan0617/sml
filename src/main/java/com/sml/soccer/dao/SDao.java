package com.sml.soccer.dao;

import java.util.List;

import com.sml.common.dto.CommonBoardDto;

public interface SDao {

	public int getBoardCount(int sportCode);

	public List<CommonBoardDto> getSoccerBoardList(int sportCode, int startRow,
			int endRow);

}
