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
	public MemberDto getMemberInfo(int teamCode, String teamLeaderName) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("teamCode", teamCode);
		map.put("teamLeaderName", teamLeaderName);
		return sqlSession.selectOne("member.dao.MemberMapper.getMemberInfo", map);
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
	 * @설명 : 팀원의 정보를 열람하기 위한 DB를 호출
	 */
	@Override
	public TeamDto getTeamInfo(String teamName) {
		System.out.println("dao:"+teamName);
		return sqlSession.selectOne("member.dao.MemberMapper.getTeamInfo",teamName);
	}

	/**
	 * 
	 * @함수명: getTeamMemberList
	 * @작성일: 2015. 7. 15.
	 * @작성자: 정성남
	 * @설명 : 팀원의 리스트를 호출하기 위한 DB호출
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
	 * @설명 : 팀원의 수를 확인하기 위한 DB호출
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
	 * @설명 : 팀원 등록을 위한 DB호출
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
	 * @설명 : 팀원 삭제를 위한 DB호출
	 */
	@Override
	public int deleteMember(int memberCode,String teamLeaderName){
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("memberCode", memberCode);
		hMap.put("teamLeaderName",teamLeaderName);
		
		return sqlSession.insert("member.dao.MemberMapper.deleteMember", hMap);
	}

	/**
	 * @함수명: getMemberSearchList
	 * @작성일: 2015. 7. 15.
	 * @작성자: 정성남
	 * @설명 : 팀원의 검색을 위한 DB를 호출
	 */
	@Override
	public List<MemberDto> getMemberSearchList(String teamName,String searchBoxName,int startRow,int endRow) {
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("teamName", teamName);
		hMap.put("searchBoxName", searchBoxName);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSession.selectList("member.dao.MemberMapper.getMemberSearchList", hMap);
	}

	/**
	 * @함수명: getSearchTeamMemberCount
	 * @작성일: 2015. 7. 16.
	 * @작성자: 정성남
	 * @설명 : 검색된 팀원의 수를 확인하기 위한 DB호출 
	 */
	@Override
	public int getSearchTeamMemberCount(int teamCode,String searchBoxName) {
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("teamCode", teamCode);
		hMap.put("searchBoxName", searchBoxName);				
		return sqlSession.selectOne("member.dao.MemberMapper.getSearchTeamMemberCount", hMap);
	}

	/**
	 * @함수명: getTeamLeaderName
	 * @작성일: 2015. 7. 23.
	 * @작성자: 정성남
	 * @설명 : 팀장의 이름을 확인하기 위한 DB호출
	 */
	@Override
	public String getTeamLeaderName(String teamName) {
		
		return sqlSession.selectOne("member.dao.MemberMapper.getTeamLeaderName", teamName);
	}

	@Override
	public MemberDto getLeaderName(int teamCode, String teamLeaderName) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		System.out.println(teamLeaderName);
		hMap.put("teamCode", teamCode);
		hMap.put("teamLeaderName", teamLeaderName);
		return sqlSession.selectOne("member.dao.MemberMapper.getLeaderName", hMap);
	}
}
