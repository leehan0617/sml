package com.sml.baseball.dao;

import java.util.logging.Logger;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BaseballDaoImpl implements BaseballDao{
	private final Logger logger = Logger.getLogger(BaseballDaoImpl.class.getName());
	@Autowired
	private SqlSessionTemplate sqlSession;

}
