package com.sml.league.dao;

import java.util.List;

import com.sml.league.dto.LeagueDto;

public interface LeagueDao {
	public List<LeagueDto> getLeagueList(String sportType);
}
