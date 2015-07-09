package com.sml.email.dao;

import java.util.HashMap;
import java.util.logging.Logger;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MailDaoImpl implements MailDao {
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int checkInfo(String name, String phone) {
		logger.info("##############checkInfo################");
		HashMap<String , Object> hMap = new HashMap<String ,Object>();
		hMap.put("number", name);
		hMap.put("phone", phone);
		return sqlSession.selectOne("dao.MailMapper.checkInfo" , hMap);
	}

	@Override
	public int findTeamCode(String name, String phone) {
		logger.info("############findTeamCode################");
		HashMap<String , Object> hMap = new HashMap<String ,Object>();
		hMap.put("number", name);
		hMap.put("phone", phone);
		return sqlSession.selectOne("dao.MailMapper.findTeamCode" , hMap);
	}

	@Override
	public String findEmail(String name, String phone) {
		logger.info("#############findEmail############");
		HashMap<String , Object> hMap = new HashMap<String ,Object>();
		hMap.put("number", name);
		hMap.put("phone", phone);
		return sqlSession.selectOne("dao.MailMapper.findEmail" , hMap);
	}

}
