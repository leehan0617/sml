package com.sml.record.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sml.record.dto.RecordDto;
import com.sml.team.dto.TeamDto;

@Component
public class RecordDaoImpl implements RecordDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<HashMap<String, Object>> getAllRecordList(String sport) {
		return sqlSession.selectList("dao.RecordMapper.getAllRecordList", sport);
	}

	/**
	 * @name : getRecordList
	 * @date : 2015. 7. 16.
	 * @author : 이희재
	 * @description : 해당 팀에 관한 경기 기록 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> getRecordList(String teamName) {
		return sqlSession.selectList("dao.RecordMapper.getRecordList",teamName);
	}

	@Override
	public TeamDto getTeamInfo(String teamName) {
		return sqlSession.selectOne("dao.RecordMapper.getTeamInfo",teamName);
	}

	@Override
	public HashMap<String, Object> getMatchingResult(int teamCode) {
		return sqlSession.selectOne("dao.RecordMapper.getMatchingResult",teamCode);
	}

	@Override
	public HashMap<String, Object> getRecordInfo(int gameCode) {
		return sqlSession.selectOne("dao.RecordMapper.getRecordInfo",gameCode);
	}

	@Override
	public int insertDraw(int gameCode, String resultScore) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("gameCode", gameCode);
		hMap.put("resultScore", resultScore);
		
		return sqlSession.insert("dao.RecordMapper.insertDraw",hMap);
	}

	@Override
	public int insertTeam1(int gameCode, String resultScore) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("gameCode", gameCode);
		hMap.put("resultScore", resultScore);
		
		return sqlSession.insert("dao.RecordMapper.insertTeam1",hMap);
	}

	@Override
	public int insertTeam2(int gameCode, String resultScore) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("gameCode", gameCode);
		hMap.put("resultScore", resultScore);
		
		return sqlSession.insert("dao.RecordMapper.insertTeam2",hMap);
	}

	/**
	 * @name : deleteMatching
	 * @date : 2015. 7. 22.
	 * @author : 이희재
	 * @description : 매칭 상태 삭제
	 */
	@Override
	public int deleteMatching(int teamCode) {
		return sqlSession.delete("dao.RecordMapper.deleteMatching",teamCode);
	}
}
