package com.sml.team.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sml.team.dto.TeamDto;
import com.sml.team.dto.TeamLogDto;

@Component
public class TeamDaoImpl implements TeamDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private HashMap<String , Object> hMap;
	
	/**
	 * @함수명:idCheck
	 * @작성일:2015. 6. 23.
	 * @작성자:조영석
	 * @설명문:아이디 중복체크를 위한 데이터베이스연결
	 */
	@Override
	public String idCheck(String teamId) {
		return sqlSession.selectOne("team.dao.TeamMapper.idCheckSelect",teamId);
	}

	/**
	 * @함수명:teamIdCheck
	 * @작성일:2015. 6. 23.
	 * @작성자:조영석
	 * @설명문:팀원명 중복체크를 위한 데이터베이스연결
	 */
	@Override
	public String teamIdCheck(String teamName) {
		return sqlSession.selectOne("team.dao.TeamMapper.teamIdCheck",teamName);
	}

	@Override
	/**
	 * 
	 * @함수명 : login
	 * @작성일 : 2015. 6. 23.
	 * @작성자 : 이한빈
	 * @설명   :  서비스에서 요청받은 값을 데이터베이스에 연결시켜 값을 반환받는 메소드
	 */
	public TeamDto login(String id, String password) {
		hMap = new HashMap<String , Object>();
		hMap.put("id", id);
		hMap.put("password", password);
		
		TeamDto srt=sqlSession.selectOne("team.dao.TeamMapper.loginOk", hMap);
		
		return srt;
	}

	
	/**
	 * 
	 * @함수명: recordList
	 * @작성일: 2015. 7. 16.
	 * @작성자: 정성남
	 * @설명 : 각 팀의 경기기록 DB를 가져오기 위한 함수
	 */
	@Override
	public List<HashMap<String, Object>> recordList(String teamName, int startRow, int endRow) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("teamName", teamName);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sqlSession.selectList("team.dao.TeamMapper.recordList",hMap);
	}
	
	/**
	 * @함수명: searchRecordList
	 * @작성일: 2015. 7. 16.
	 * @작성자: 정성남
	 * @설명 : 팀검색을 통한 경기기록을 확인하기 위한 DB를 호출
	 */
	@Override
	public List<HashMap<String, Object>> searchRecordList(String searchBoxName, int startRow, int endRow) {
		
		HashMap<String, Object> hMap=new HashMap<String, Object>();		
		hMap.put("searchBoxName", searchBoxName);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sqlSession.selectList("team.dao.TeamMapper.searchRecordList",hMap);
		
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 해당 팀 전체 기록 수 출력 
	 */
	@Override
	public int getRecordCount(String teamName) {
		return sqlSession.selectOne("team.dao.TeamMapper.getRecordCount",teamName);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 시/도 에 따른 구/군 출력
	 */
	@Override
	public List<String> getGugunList(String sido) {
		return sqlSession.selectList("team.dao.TeamMapper.getGugunList",sido);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 시/도 출력
	 */
	@Override
	public List<String> getSidoList() {
		return sqlSession.selectList("team.dao.TeamMapper.getSidoList");
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 팀 코드에 따른 팀 ground 출력
	 */
	@Override
	public String getTeamGround(int teamCode) {
		return sqlSession.selectOne("team.dao.TeamMapper.getTeamGround", teamCode);
	}

	
	
	/**
	 * @name : updateTeamEmblem
	 * @date : 2015. 7. 8.
	 * @author : 변형린
	 * @description : 팀 로고 변경
	 */
	@Override
	public int updateTeamEmblem(TeamDto teamDto) {
		return sqlSession.update("team.dao.TeamMapper.updateTeamEmblem", teamDto);
	}
	
	
	
	/**
	 * @함수명: getTeamLogCount
	 * @작성일: 2015. 7. 9.
	 * @작성자: 정성남
	 * @설명 : 팀페이지 게시판 댓글의 수를 가져오기 위한 함수
	 */
	@Override
	public int getTeamLogCount() {		
		return sqlSession.selectOne("team.dao.TeamMapper.getTeamLogCount");
	}

	/**
	 * @함수명: teamLogList
	 * @작성일: 2015. 7. 6.
	 * @작성자: 정성남
	 * @설명 : 팀페이지 게시판 댓글을 출력하기 위한 DB호출
	 */
	@Override
	public List<TeamLogDto> teamLogDtoList(int teamCode,int startRow,int endRow) {
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("teamCode", teamCode);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSession.selectList("team.dao.TeamMapper.teamLogDtoList",hMap);
	}


	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 8.
	 * @author : 이희재
	 * @description : 경기 시작 전인 친선 경기의 매치 정보와 해당 팀의 정보를 모두 가져옴
	 */
	@Override
	public HashMap<String, Object> getNormalMatchInfo(int teamCode) {
		return sqlSession.selectOne("team.dao.TeamMapper.getNormalMatchInfo", teamCode);
	}


	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 9.
	 * @author : 이희재
	 * @description : 팀 코드를 이용하여 팀의 정보를 가져 옴
	 */
	@Override
	public TeamDto getTeamInfo(int teamCode) {
		return sqlSession.selectOne("team.dao.TeamMapper.getTeamCodeInfo",teamCode);
	}

	/**
	 * @name : updateHomeGround
	 * @date : 2015. 7. 10.
	 * @author : 변형린
	 * @description : 홈구장 수정
	 */
	@Override
	public int updateHomeGround(String homeGround, int teamCode) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("homeGround", homeGround);
		map.put("teamCode", teamCode);
		
		return sqlSession.update("team.dao.TeamMapper.updateHomeGround", map);
	}

	/**
	 * @name : updateTeamInfo
	 * @date : 2015. 7. 10.
	 * @author : 변형린
	 * @description : 팀정보 수정
	 */
	@Override
	public int updateTeamInfo(String teamPassword, String teamName, String sportType, int teamCode) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("teamPassword", teamPassword);
		map.put("teamName", teamName);
		map.put("sportType", sportType);
		map.put("teamCode", teamCode);
		return sqlSession.update("team.dao.TeamMapper.updateTeamInfo", map);
	}

	@Override
	public int replyWrite(TeamLogDto teamLog) {		
		return sqlSession.insert("team.dao.TeamMapper.replyWrite" , teamLog);
	}

	@Override
	public List<TeamLogDto> getReplyList(String teamName) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("team.dao.TeamMapper.getReplyList" , teamName);
	}

	@Override
	public List<TeamLogDto> getMoreReplyList(int teamCode , int pageNumber) {
		HashMap<String , Integer> hMap = new HashMap<String,Integer>();
		hMap.put("teamCode", teamCode);
		hMap.put("endRow" , pageNumber);
		int startRow = pageNumber-4;
		hMap.put("startRow", startRow);
		
		return sqlSession.selectList("team.dao.TeamMapper.getMoreReplyList" , hMap);
	}

	@Override
	public int replyDelete(int teamCode, int replyCode) {
		HashMap<String, Integer> hMap = new HashMap<String , Integer>();
		hMap.put("teamCode" , teamCode);
		hMap.put("replyCode" , replyCode);
		return sqlSession.delete("team.dao.TeamMapper.replyDelete" , hMap);
	}
	
	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 6. 25.
	 * @author : 이희재
	 * @description : 팀 정보를 갖고 오기 위한 함수
	 */
	@Override
	public TeamDto getTeamInfo(String teamName) {
		System.out.println("teanNameDaoImpl555555555555555:"+teamName);
		return sqlSession.selectOne("team.dao.TeamMapper.getTeamInfo",teamName);
		
	}

	@Override
	public int editTeamIntro(int teamCode, String teamIntro) {
		HashMap<String , Object>hMap = new HashMap<String , Object>();
		hMap.put("teamCode", teamCode);
		hMap.put("teamIntro", teamIntro);
		return sqlSession.update("team.dao.TeamMapper.editTeamIntro" , hMap);
	}



	
		
}
