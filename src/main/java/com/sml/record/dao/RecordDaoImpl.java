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
}
