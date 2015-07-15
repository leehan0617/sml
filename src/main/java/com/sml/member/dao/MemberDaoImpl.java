package com.sml.member.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sml.member.dto.MemberDto;
import com.sml.team.dto.TeamDto;

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

	/**
	 * @name : getMemberInfo
	 * @date : 2015. 7. 10.
	 * @author : 변형린
	 * @description : 멤버 정보 가져오기
	 */
	@Override
	public MemberDto getMemberInfo(int teamCode) {
		return sqlSession.selectOne("member.dao.MemberMapper.getMemberInfo", teamCode);
	}

	/**
	 * @name : updateMemberInfoOk
	 * @date : 2015. 7. 10.
	 * @author : 변형린
	 * @description :멤버 정보 수정
	 */
	@Override
	public int updateMemberInfoOk(MemberDto memberDto, int teamCode) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("memberName", memberDto.getMemberName());
		map.put("memberBirth", memberDto.getMemberBirth());
		map.put("memberRegion", memberDto.getMemberRegion());
		map.put("memberEmail", memberDto.getMemberEmail());
		map.put("memberPhone", memberDto.getMemberPhone());
		map.put("memberGender", memberDto.getMemberGender());
		map.put("teamCode", teamCode);
		return sqlSession.update("member.dao.MemberMapper.updateMemberInfoOk", map);
	}
	
	/**
	 * 
	 * @함수명: getTeamInfo
	 * @작성일: 2015. 7. 15.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public TeamDto getTeamInfo(String teamName) {
		return sqlSession.selectOne("member.dao.MemberMapper.getTeamInfo",teamName);
	}

	/**
	 * 
	 * @함수명: getTeamMemberList
	 * @작성일: 2015. 7. 15.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public List<MemberDto> getTeamMemberList(String teamName, int startRow, int endRow) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("teamName", teamName);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return sqlSession.selectList("member.dao.MemberMapper.getTeamMemberList",map);
	}

	/**
	 * 
	 * @함수명: getTeamMemberCount
	 * @작성일: 2015. 7. 15.
	 * @작성자: 정성남
	 * @설명 :
	 */
	
	@Override
	public int getTeamMemberCount(int teamCode) {
		return sqlSession.selectOne("member.dao.MemberMapper.getTeamMemberCount", teamCode);
	}

	/**
	 * 
	 * @함수명: addMember
	 * @작성일: 2015. 7. 15.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public int addMember(MemberDto member) {		
		
		return sqlSession.insert("member.dao.MemberMapper.addMember",member);
	}

	/**
	 * 
	 * @함수명: deleteMember
	 * @작성일: 2015. 7. 15.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public int deleteMember(int memberCode) {
		return sqlSession.insert("member.dao.MemberMapper.deleteMember", memberCode);
	}

	/**
	 * @함수명: getMemberSearchList
	 * @작성일: 2015. 7. 15.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public List<MemberDto> getMemberSearchList(String teamName,String searchBoxValue,int startRow,int endRow) {
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("teamName", teamName);
		hMap.put("searchBoxValue", searchBoxValue);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSession.selectList("member.dao.MemberMapper.getMemberSearchList", hMap);
	}
}
