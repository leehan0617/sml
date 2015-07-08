package com.sml.record.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sml.record.dto.RecordDto;

@Component
public class RecordDaoImpl implements RecordDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<HashMap<String, Object>> getAllRecordList(String sport) {
		return sqlSession.selectList("dao.RecordMapper.getAllRecordList", sport);
	}
}
