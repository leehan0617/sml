package com.sml.league.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sml.league.dto.LeagueDto;

@Component
public class LeagueDaoImpl implements LeagueDao{

	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * @함수명:getLeagueList
	 * @작성일:2015. 7. 9.
	 * @작성자:변형린
	 * @설명문:개설 된 리그정보 열람용 데이터베이스연결
	 */
	@Override
	public List<LeagueDto> getLeagueList(String sportType) {				
		return sqlSession.selectList("dao.LeagueMapper.getLeagueList", sportType);
	}

	/**
	 * @name : checkLeagueJoin
	 * @date : 2015. 7. 10.
	 * @author : 변형린
	 * @description : 리그 참가 여부
	 */
	@Override
	public String getJoinLeagueCode(int teamCode) {
		return sqlSession.selectOne("dao.LeagueMapper.getJoinLeagueCode",teamCode);
	}

	@Override
	public LeagueDto getLeagueInfo(int leagueCode) {
		return sqlSession.selectOne("dao.LeagueMapper.getLeagueInfo",leagueCode);
	}

	/**
	 * @name : getLeagueCount
	 * @date : 2015. 7. 13.
	 * @author : 이희재
	 * @description : 현재 참여하고 있는 league의 팀 수 출력
	 */
	@Override
	public int getLeagueCount(int leagueCode) {
		return sqlSession.selectOne("dao.LeagueMapper.count",leagueCode);
	}

	/**
	 * @name : getTeamCode
	 * @date : 2015. 7. 13.
	 * @author : 이희재
	 * @description : 팀 id에 따른 팀 코드 출력
	 */
	@Override
	public int getTeamCode(String teamId) {
		return sqlSession.selectOne("dao.LeagueMapper.teamSelect",teamId);
	}

	/**
	 * @name : getLeagueJoinSelect
	 * @date : 2015. 7. 13.
	 * @author : 이희재
	 * @description : 참가하고 있는 리그가 있는지 확인
	 */
	@Override
	public int getLeagueJoinSelect(int teamCode) {
		return sqlSession.selectOne("dao.LeagueMapper.leagueJoinSelect",teamCode);
	}

	/**
	 * @name : applicate
	 * @date : 2015. 7. 13.
	 * @author : 이희재
	 * @description : 리그 참가
	 */
	@Override
	public int applicate(int teamCode, int leagueCode) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("teamCode", teamCode);
		hMap.put("leagueCode", leagueCode);
		return sqlSession.insert("dao.LeagueMapper.applicate",hMap);
	}

	/**
	 * @name : getLeagueJoinList
	 * @date : 2015. 7. 14.
	 * @author : 이희재
	 * @description : 현재 리그에 참여하는 팀 코드 리스트를 가져옴
	 */
	@Override
	public List<Integer> getLeagueJoinList(int leagueCode) {
		return sqlSession.selectList("dao.LeagueMapper.getLeagueJoinList", leagueCode);
	}
}
