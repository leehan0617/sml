package com.sml.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sml.league.dto.LeagueDto;
import com.sml.referee.dto.RefereeDto;

@Component
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getManageTeamCount() {
		return sqlSession.selectOne("dao.adminDaoMapper.getManageTeamCount");
	}

	/**
	 * @함수명: manageTeamDelete
	 * @작성일: 2015. 6. 25.
	 * @작성자: 정성남
	 * @설명 : 팀 정보 가져오기
	 */
	@Override
	public List<HashMap<String, Object>> getManageTeam(int startRow,int endRow){
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sqlSession.selectList("dao.adminDaoMapper.getManageTeam",hMap);
	}

	
	@Override
	public int manageTeamDelete(int teamCode) {
		// TODO Auto-generated method stub
		return sqlSession.delete("dao.adminDaoMapper.manageTeamDelete",teamCode);
	}	

	/**
	 * @name : refereeCount
	 * @date : 2015. 6. 25.
	 * @author : 변형린
	 * @description : 심판 명수 가져오기
	 */
	@Override
	public int refereeCount() {
		return sqlSession.selectOne("dao.adminDaoMapper.refereeCount");
	}

	/**
	 * @name : refereeList
	 * @date : 2015. 6. 25.
	 * @author : 변형린
	 * @description : 심판 db에서 리스트로 가져오기
	 */
	@Override
	public List<RefereeDto> refereeList(int startRow, int endRow) {
		Map<String, Integer> hMap=new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sqlSession.selectList("dao.adminDaoMapper.refereeList", hMap);
	}

	/**
	 * @name : refereeDelete
	 * @date : 2015. 6. 25.
	 * @author : 변형린
	 * @description : 심판 삭제 DAO
	 */
	@Override
	public int refereeDelete(int refereeNumber) {
		return sqlSession.delete("dao.adminDaoMapper.refereeDelete", refereeNumber);
	}

	/**
	 * @name : refereeAccept
	 * @date : 2015. 6. 25.
	 * @author : 변형린
	 * @description : 심판 수락 DAO
	 */
	@Override
	public int refereeAccept(int refereeNumber) {
		return sqlSession.update("dao.adminDaoMapper.refereeAccept", refereeNumber);
	}

	/**
	 * @name : refereeSearch
	 * @date : 2015. 6. 25.
	 * @author : 변형린
	 * @description : 심판 검색 중복이름일 경우를 대비 List 사용
	 */
	@Override
	public List<RefereeDto> refereeSearch(String refereeName) {
		return sqlSession.selectList("dao.adminDaoMapper.refereeSearch", refereeName);
	}

	/**
	 * @함수명: createLeague
	 * @작성일: 2015. 6. 26.
	 * @작성자: 정성남
	 * @설명 : 리그 개설 DAO
	 */
	@Override
	public int createLeague(LeagueDto leagueDto) {					
		return sqlSession.insert("dao.adminDaoMapper.createLeague",leagueDto);
	}
	
	/**
	 * @함수명: getManageLeagueCount
	 * @작성일: 2015. 7. 2.
	 * @작성자: 정성남
	 * @설명 : 개설된 리그의 숫자를 호출
	 */
	@Override
	public int getManageLeagueCount() {
		
		return sqlSession.selectOne("dao.adminDaoMapper.getManageLeagueCount");
	}
	

	/**
	 * @함수명: manageLeague
	 * @작성일: 2015. 7. 2.
	 * @작성자: 정성남
	 * @설명 : 개설된 리그 LIST DAO
	 */
	@Override
	public List<LeagueDto> manageLeagueList(int startRow,int endRow){
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return sqlSession.selectList("dao.adminDaoMapper.manageLeagueList",map);
	}

	/**
	 * @함수명: leagueDelete
	 * @작성일: 2015. 7. 2.
	 * @작성자: 정성남
	 * @설명 : 개설된 리그 삭제 DAO
	 */
	@Override
	public int leagueDelete(int leagueCode) {
		
		return sqlSession.delete("dao.adminDaoMapper.leagueDelete",leagueCode);
	}

	/**
	 * @함수명: leagueInfo
	 * @작성일: 2015. 7. 2.
	 * @작성자: 정성남
	 * @설명 : 리그 관련 정보 DAo
	 */
	@Override
	public LeagueDto leagueInfo(int leagueCode) {
		
		return sqlSession.selectOne("dao.adminDaoMapper.leagueInfo",leagueCode);
	}

	/**
	 * @함수명: leagueUpdate
	 * @작성일: 2015. 7. 2.
	 * @작성자: 정성남
	 * @설명 : 리그 수정을 위한 데이터베이스 열람
	 */
	@Override
	public LeagueDto leagueUpdate(int leagueCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("dao.adminDaoMapper.leagueUpdate",leagueCode);
	}

	/**
	 * @함수명: leagueUpdateOk
	 * @작성일: 2015. 7. 2.
	 * @작성자: 정성남
	 * @설명 : 리그 수정결과
	 */
	@Override
	public int leagueUpdateOk(LeagueDto leagueDto) {
		
		return sqlSession.update("dao.adminDaoMapper.leagueUpdateOk",leagueDto);
	}

	/**
	 * @name : leagueSwitch
	 * @date : 2015. 7. 8.
	 * @author : 변형린
	 * @description : 리그 정보 게시할지 안할지
	 */
	@Override
	public int leagueSwitch(int leagueState, int leagueCode) {
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("leagueState", leagueState);
		map.put("leagueCode", leagueCode);
		return sqlSession.update("dao.adminDaoMapper.leagueSwitch", map);
		
	}

	@Override
	public List<HashMap<String, Object>> searchTeamMember(String teamName) {
		return sqlSession.selectList("dao.adminDaoMapper.searchTeamMember",teamName);
	}

	/**
	 * @name : getRecordCount
	 * @date : 2015. 7. 17.
	 * @author : 이희재
	 * @description : 리그 기록 리스트 가져오기
	 */
	@Override
	public int getRecordCount(int leagueCode) {
		return sqlSession.selectOne("dao.adminDaoMapper.getRecordCount",leagueCode);
	}

	/**
	 * @name : getRecordList
	 * @date : 2015. 7. 17.
	 * @author : 이희재
	 * @description : 페이징 기법에 따른 레코드 리스트
	 */
	@Override
	public List<HashMap<String, Object>> getRecordList(int leagueCode,
			int startRow, int endRow) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("leagueCode", leagueCode);
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSession.selectList("dao.adminDaoMapper.getRecordList",hMap);
	}

	/**
	 * @name : getRecordInfo
	 * @date : 2015. 7. 20.
	 * @author : 이희재
	 * @description : 게임 결과를 입력하기 위한 게임 결과 정보
	 */
	@Override
	public HashMap<String, Object> getRecordInfo(int gameCode) {
		return sqlSession.selectOne("dao.adminDaoMapper.getRecordInfo",gameCode);
	}

	/**
	 * @name : insertDraw
	 * @date : 2015. 7. 20.
	 * @author : 이희재
	 * @description : 경기 결과를 입력하기 위한 mapper
	 */
	@Override
	public int insertDraw(int gameCode, String resultScore) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("gameCode", gameCode);
		hMap.put("resultScore", resultScore);
		return sqlSession.update("dao.adminDaoMapper.insertDraw",hMap);
	}
	
	/**
	 * @name : insertTeam1
	 * @date : 2015. 7. 20.
	 * @author : 이희재
	 * @description : 홈팀의 경기 결과를 입력하기 위한 mapper
	 */
	@Override
	public int insertTeam1(int gameCode, String resultScore) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("gameCode", gameCode);
		hMap.put("resultScore", resultScore);
		return sqlSession.update("dao.adminDaoMapper.insertTeam1",hMap);
	}
	/**
	 * @name : insertTeam2
	 * @date : 2015. 7. 20.
	 * @author : 이희재
	 * @description : 원정팀의 경기 결과를 입력하기 위한 mapper
	 */
	@Override
	public int insertTeam2(int gameCode, String resultScore) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("gameCode", gameCode);
		hMap.put("resultScore", resultScore);
		return sqlSession.update("dao.adminDaoMapper.insertTeam2",hMap);
	}

	

}
