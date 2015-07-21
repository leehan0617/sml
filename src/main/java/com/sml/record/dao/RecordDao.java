package com.sml.record.dao;

import java.util.HashMap;
import java.util.List;

import com.sml.record.dto.RecordDto;
import com.sml.team.dto.TeamDto;

public interface RecordDao {
	public List<HashMap<String, Object>> getAllRecordList(String sport);
	public List<HashMap<String, Object>> getRecordList(String teamName);
	public TeamDto getTeamInfo(String teamName);
	public HashMap<String, Object> getMatchingResult(int teamCode);
}
