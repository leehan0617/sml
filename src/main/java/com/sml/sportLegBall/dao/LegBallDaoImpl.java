package com.sml.sportLegBall.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sml.common.dto.CommonBoardDto;
import com.sml.league.dto.LeagueDto;
import com.sml.member.dto.MemberDto;
import com.sml.record.dto.RecordDto;
import com.sml.referee.dto.RefereeDto;

@Repository
public class LegBallDaoImpl implements LegBallDao{
	private final Logger logger = Logger.getLogger(LegBallDaoImpl.class.getName());
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	/**
	 * @함수명:getBoardCount
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:축구페이지 게시판 총 갯수 가져오는 함수
	 */
	@Override
	public int getBoardCount(int sportCode) {
		logger.info("SDao getBoardCount");
		return sqlSession.selectOne("legBall.dao.SMapper.getBoardCount",sportCode);
	}
	/**
	 * 
	 * @함수명:getlegBallBoardList
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:게시글을 디비에서 가져오는 함수 
	 */
	@Override
	public List<CommonBoardDto> getlegBallBoardList(int sportCode, int startRow,
			int endRow) {
		logger.info("SDao getlegBallBoardList");
		HashMap<String ,Object> hMap = new HashMap<String,Object>();
		hMap.put("sportCode", sportCode);
		hMap.put("startRow",startRow);
		hMap.put("endRow", endRow);
			
		return sqlSession.selectList("legBall.dao.SMapper.getlegBallBoardList",hMap);
	}
	/**
	 * 
	 * @함수명:getBoardContent
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:게시글 내용 가져오는 함수 
	 */
	@Override
	public CommonBoardDto getBoardContent(int boardNumber) {
		return sqlSession.selectOne("legBall.dao.SMapper.getBoardContent",boardNumber);
	}
	/**
	 * 
	 * @함수명:showAgeChart
	 * @작성일:2015. 7. 17.
	 * @작성자:이한빈 
	 * @설명문:연령별 지역별 통계그래프에 쓸 데이터를 가져오는 함수 
	 */
	@Override
	public List<MemberDto> showAgeChart(String sportType) {
		// TODO Auto-generated method stub
		System.out.println("sportTypesportTypesportType"+sportType);
		return sqlSession.selectList("legBall.dao.SMapper.showAgeChart" , sportType);
	}
	/**
	 * 
	 * @함수명:showDayChart
	 * @작성일:2015. 7. 17.
	 * @작성자:이한빈 
	 * @설명문:게임발생일 데이터를 가져오는 함
	 */
	@Override
	public List<Date> showDayChart(String sportType) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("legBall.dao.SMapper.showDayChart", sportType);
	}
	
	/**
	 * 	
	 * @함수명: getAllTeamList
	 * @작성일: 2015. 7. 17.
	 * @작성자: 조영석
	 * @설명 : 족구 방영록 열람을 위한 데이터베이스 연결
	 */
	@Override
	public List<HashMap<String,Object>> getAllTeamList(String sportType,int startRow,int endRow) {
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("sportType", sportType);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sqlSession.selectList("legBall.dao.SMapper.getAllTeamSearch", hMap);
	}
	/**
	 * 
	 * @함수명:showLeagueInfo
	 * @작성일:2015. 7. 17.
	 * @작성자:이한빈 
	 * @설명문:리그정보 가져오는 함수
	 */
	@Override
	public List<LeagueDto> showLeagueInfo(String sportType) {
		return sqlSession.selectList("legBall.dao.SMapper.showLeagueInfo",sportType);
	}
	@Override
	public List<LeagueDto> getLeagueJoin() {
		return sqlSession.selectList("legBall.dao.SMapper.getLeagueJoin");
	}
	@Override
	public int joinLeague(HashMap<String, Object> hMap) {
		return sqlSession.insert("legBall.dao.SMapper.joinLeague",hMap);
	}
	@Override
	public int checkLeague(HashMap<String, Object> hMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("legBall.dao.SMapper.checkLeague" , hMap);
	}
	/**
	 * @함수명: teamCount
	 * @작성일: 2015. 7. 20.
	 * @작성자: 조영석
	 * @설명 : 팀 카운트를 위한 데이터베이스 연결
	 */
	@Override
	public int teamCount(String sportType) {
		
		return sqlSession.selectOne("legBall.dao.SMapper.teamCount",sportType);
	}
	@Override
	public List<RecordDto> showRecentMatch(String gameType) {
		return sqlSession.selectList("legBall.dao.SMapper.showRecentMatch" , gameType);
	}
	@Override
	public String findMatchTeams(int teamCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("legBall.dao.SMapper.findMatchTeam",teamCode);
	}
	
}
