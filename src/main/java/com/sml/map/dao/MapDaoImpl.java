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

	@Override
	public List<HashMap<String, Object>> getTeamMapList() {
		return sqlSession.selectList("map.dao.mapMapper.getTeamMapList");
	}
}
