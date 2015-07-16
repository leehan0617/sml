package com.sml.common.dao;

import java.util.List;

import com.sml.common.dto.CommonBoardDto;

public interface CommonDao {
	public int addCommonBoard(CommonBoardDto commonBoardDto);
	public int getCommonBoardCount();
	public List<CommonBoardDto> getCommonBoardList(int startRow,int endRow);
	public int deleteCommonBoard(int boardNumber);
	public CommonBoardDto readCommonBoard(int boardNumber);
	public CommonBoardDto updateCommonBoardSelect(int boardNumber);
	public int updateCommonBoardOk(CommonBoardDto commonBoard);
	public List<String> autoSearch(String result);
	public List<CommonBoardDto> searchBoard(String boardName);
}
