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
		hMap.put("name", name);
		hMap.put("phone", phone);
		return sqlSession.selectOne("dao.MailMapper.checkInfo" , hMap);
	}

	@Override
	public String findEmail(String name, String phone) {
		logger.info("#############findEmail############");
		HashMap<String , Object> hMap = new HashMap<String ,Object>();
		hMap.put("name", name);
		hMap.put("phone", phone);
		return sqlSession.selectOne("dao.MailMapper.findEmail" , hMap);
	}
	
	@Override
	public int findTeamCode(String name, String phone) {
		logger.info("############findTeamCode################");
		HashMap<String , Object> hMap = new HashMap<String ,Object>();
		hMap.put("name", name);
		hMap.put("phone", phone);
		return sqlSession.selectOne("dao.MailMapper.findTeamCode" , hMap);
	}

	@Override
	public void insertAuthenticationInfo(String authenticationNumber , int teamCode) {
		logger.info("########insertAuthenticationInfo############");
		HashMap<String , Object> hMap = new HashMap<String , Object>();
		hMap.put("teamCode" , teamCode);
		hMap.put("number" , authenticationNumber);
		int check = sqlSession.insert("dao.MailMapper.insertAuthenticationInfo" , hMap);
		
		if(check > 0) logger.info("######인증테이블 데이터 추가 완료!!##########");
	}

	@Override
	public String findMyAccount(int teamCode, String userNumber) {
		logger.info("########findMyAccount###########");
		HashMap<String , Object> hMap = new HashMap<String , Object>();
		hMap.put("teamCode" , teamCode);
		hMap.put("userNumber" , userNumber);
		
		String userId = sqlSession.selectOne("dao.MailMapper.findMyAccount" , hMap);
		logger.info("#### id : " + userId);
		
		return userId;
	}

	@Override
	public void deleteAuthenticationData(int teamCode, String userNumber) {
		logger.info("########deleteAuthenticationData###########");
		HashMap<String , Object> hMap = new HashMap<String , Object>();
		hMap.put("teamCode" , teamCode);
		hMap.put("userNumber" , userNumber);
		
		int check = sqlSession.delete("dao.MailMapper.deleteAuthenticationData" , hMap);
		logger.info("########delete  완료######## check : " + check);
	}

	@Override
	public int updateInfo(String teamId, String teamPassword) {
		logger.info("#######updateInfo##########");
		HashMap<String , Object> hMap = new HashMap<String , Object>();
		hMap.put("id" , teamId);
		hMap.put("password" , teamPassword);
		
		return sqlSession.update("dao.MailMapper.updateInfo" , hMap);
	}
	
}
