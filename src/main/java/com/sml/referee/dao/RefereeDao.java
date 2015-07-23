package com.sml.referee.dao;

import java.util.List;

import com.sml.referee.dto.RefereeDto;

public interface RefereeDao {	
	public int refereeRegister(RefereeDto refereeDto);
	public int refereeCount(String sportType);
	public List<RefereeDto> refereeList(int startRow, int endRow, String sportType, String regionSido);
	public List<RefereeDto> refereeAllList(int startRow, int endRow, String sportType);
	public List<String> sidoList(String regionSido);
}
