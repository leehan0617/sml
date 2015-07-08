package com.sml.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sml.member.dto.MemberDto;

@Component
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * @함수명:insertMember
	 * @작성일:2015. 6. 23.
	 * @작성자:조영석
	 * @설명문:팀생성을위한 데이터베이스 연결
	 */
	@Override
	public int insertMember(MemberDto memberDto, String teamId,
							String teamPassword, String teamName, String sportType,
							String teamGrade,String teamReaderName,String emblem, String homeGround, String path){

		HashMap<String,Object> Hmap=new HashMap<String,Object>();
		Hmap.put("teamId",teamId);
		Hmap.put("teamPassword",teamPassword);
		Hmap.put("teamName",teamName);
		Hmap.put("sportType",sportType);
		Hmap.put("teamGrade",teamGrade);
		Hmap.put("teamReaderName",teamReaderName);
		Hmap.put("emblem",emblem);
		Hmap.put("homeGround", homeGround);
		Hmap.put("path",	path);
		
	    int value=0;
	   
	    sqlSession.insert("member.dao.MemberMapper.TeamInsert",Hmap);
	    int team=sqlSession.selectOne("member.dao.MemberMapper.TeamCodeSelect",teamId);
	    memberDto.setTeamCode(team);	
	    value=sqlSession.insert("member.dao.MemberMapper.memberInsert",memberDto);
	   
	   
	    if(value==0){
	    	sqlSession.delete("member.dao.MemberMapper.Teamdelete",memberDto);
	    }else{
//	    	String teamLeaderName= sqlSession.selectOne("member.dao.MemberMapper.teamReader",team);
	 	    
	 	    Hmap.put("team", team);
	 	    Hmap.put("teamLeaderName", memberDto.getMemberName());
	 	    sqlSession.update("member.dao.MemberMapper.updateTeamReader",Hmap);
	 	    sqlSession.insert("member.dao.MemberMapper.insertHomeGround",Hmap);
	    }
	    
	    return value;
	   
	}
	
	@Override
	/**
	 * 
	 * @함수명 : teamMemberInfo
	 * @작성일 : 2015. 6. 23.
	 * @작성자 : 이한빈
	 * @설명   : 데이터베이스에 연결해서 팀맴버 목록을 반환받는 메소드
	 */
	public List<MemberDto> teamMemberInfo() {
		return sqlSession.selectList("teamMemberList");
	}

}
