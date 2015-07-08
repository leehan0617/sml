package com.sml.email.dao;

import java.util.HashMap;
import java.util.logging.Logger;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sml.email.dto.emailDto;
import com.sml.member.dto.MemberDto;

@Component
public class emailDaoImpl implements emailDao {
	final Logger logger=Logger.getLogger(this.getClass().getName());
	@Autowired
	private SqlSessionTemplate sqlSession;
	/**
	 * @함수명:search
	 * @작성일:2015. 7. 8.
	 * @작성자:조영석
	 * @설명문:팀장이름,폰번호 여부 확인을위한 데이터베이스연결
	 */
	@Override
	public MemberDto search(String memberName, String memberPhone) {
		HashMap<String,Object> Hmap=new HashMap<String,Object>();
		Hmap.put("memberName", memberName);
		Hmap.put("memberPhone", memberPhone);
		

		return sqlSession.selectOne("dao.emailMapper.search",Hmap);
	}

}
