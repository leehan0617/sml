package com.sml.referee.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sml.referee.dto.RefereeDto;

@Component
public class RefereeDaoImpl implements RefereeDao{

	@Autowired
	private SqlSession sqlSession;

	/**
	 * @name : refereeRegister
	 * @date : 2015. 6. 23.
	 * @author : 변형린
	 * @description : 심판등록 신청하는 DAO
	 */
	@Override
	public int refereeRegister(RefereeDto refereeDto) {
		return sqlSession.insert("dao.RefereeMapper.refereeRegister", refereeDto);
	}

	@Override
	public int refereeCount() {
		return sqlSession.selectOne("dao.RefereeMapper.refereeCount");
	}

	@Override
	public List<RefereeDto> refereeList(int startRow, int endRow, String sportType, String regionSido) {
		Map<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		hMap.put("sportType", sportType);
		hMap.put("regionSido", regionSido);
		return sqlSession.selectList("dao.RefereeMapper.refereeList", hMap);
	}

	@Override
	public List<String> sidoList(String regionSido) {
		return sqlSession.selectList("dao.RefereeMapper.sidoList", regionSido);
	}

}
