package com.sml.map.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MapDaoImpl implements MapDao {

	@Autowired
	private SqlSession sqlSession;

	/**
	 * @name : getTeamMapList
	 * @date : 2015. 7. 15.
	 * @author : 이희재
	 * @description : 시작과 동시에 현재 홈구장으로 가지고 있는 팀을 보여줌
	 */
	@Override
	public List<HashMap<String, Object>> getTeamMapList() {
		return sqlSession.selectList("map.dao.mapMapper.getTeamMapList");
	}

	/**
	 * @name : getRecordList
	 * @date : 2015. 7. 15.
	 * @author : 이희재
	 * @description : 오늘의 경기 리스트 지도에 출력
	 */
	@Override
	public List<HashMap<String, Object>> getRecordList() {
		return sqlSession.selectList("map.dao.mapMapper.getRecordList");
	}
}
