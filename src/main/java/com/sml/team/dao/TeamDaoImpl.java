package com.sml.team.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sml.matching.dto.MatchingDto;
import com.sml.member.dto.MemberDto;
import com.sml.team.dto.ScheduleDto;
import com.sml.team.dto.TeamBoardDto;
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

	@Override
	/**
	 * 
	 * @함수명 : viewTeamBoard
	 * @작성일 : 2015. 6. 23.
	 * @작성자 : 이한빈
	 * @설명   : 서비스에서 요청받은 값을 데이터베이스에 연결시켜 팀게시판 목록 리스트를 반환 받는 메소드
	 */
	public List<TeamBoardDto> viewTeamBoard(String teamName,int startRow, int endRow) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("teamName", teamName);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return sqlSession.selectList("team.dao.TeamMapper.viewTeamBoardList",map);
	}

	@Override
	/**
	 * 
	 * @함수명 : viewSchedule
	 * @작성일 : 2015. 6. 23.
	 * @작성자 : 이한빈
	 * @설명   : 서비스에서 요청받은 값을 데이터베이스에서 연결해서 스케쥴 값들을 반환 받는 메소드
	 */
	public List<ScheduleDto> viewSchedule() {
		return sqlSession.selectList("team.dao.TeamMapper.teamScheduleList");
	}

	

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 6. 25.
	 * @author : 이희재
	 * @description : 팀 정보를 갖고 오기 위한 함수
	 */
	@Override
	public TeamDto getTeamInfo(String teamName) {
		return sqlSession.selectOne("team.dao.TeamMapper.getTeamInfo",teamName);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 6. 25.
	 * @author : 이희재
	 * @description : 팀 멤버 리스트를 갖고 오기 위한 함수
	 */
	@Override
	public List<MemberDto> getTeamMemberList(String teamName, int startRow, int endRow) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("teamName", teamName);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return sqlSession.selectList("team.dao.TeamMapper.getTeamMemberList",map);
	}

	
	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 6. 25.
	 * @author : 이희재
	 * @description : 페이징 기법을 위한 전체 게시물 수 출력
	 */
	@Override
	public int getBoardCount(String teamName) {
		return sqlSession.selectOne("team.dao.TeamMapper.getBoardCount",teamName);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : boardNumber를 이용한 게시물 읽기
	 */
	@Override
	public TeamBoardDto getBoardDto(int boardNumber) {
		return sqlSession.selectOne("team.dao.TeamMapper.getBoardDto", boardNumber);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : teamName과 TeamBoardDto를 이용한 공지 작성
	 */
	@Override
	public int writeTeamBoard(TeamBoardDto board) {
		return sqlSession.insert("team.dao.TeamMapper.writeTeamBoard",board);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 게시판 공지 지우기
	 */
	
	@Override
	public int deleteTeamBoard(int boardNumber) {
		return sqlSession.delete("team.dao.TeamMapper.deleteTeamBoard", boardNumber);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 게시판 수정 완료
	 */
	@Override
	public int updateTeamBoard(TeamBoardDto board) {
		return sqlSession.update("team.dao.TeamMapper.updateTeamBoard", board);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 멤버 전체 수 출력
	 */
	
	@Override
	public int getTeamMemberCount(String name) {
		return sqlSession.selectOne("team.dao.TeamMapper.getTeamMemberCount", name);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 팀 멤버 추가
	 */
	@Override
	public int addMember(MemberDto member, int teamCode) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("member", member);
		map.put("teamCode", teamCode);
		return sqlSession.insert("team.dao.TeamMapper.addMember",map);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 팀 멤버 삭제
	 */
	@Override
	public int deleteMember(int memberCode) {
		return sqlSession.insert("team.dao.TeamMapper.deleteMember", memberCode);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 해당 팀 기록 출력 
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
	 * @함수명: selectTeamCode
	 * @작성일: 2015. 7. 3.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public int selectTeamCode(String teamName) {
		
		return sqlSession.selectOne("team.dao.TeamMapper.selectTeamCode",teamName);
	}

	/**
	 * @함수명: addTeamLog
	 * @작성일: 2015. 7. 3.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public int addTeamLog(TeamLogDto teamLogDto) {
		
		return sqlSession.insert("team.dao.TeamMapper.addTeamLog",teamLogDto);
	}

	/**
	 * @함수명: teamLogList
	 * @작성일: 2015. 7. 6.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public List<TeamLogDto> teamLogDtoList(int teamCode) {
		
		return sqlSession.selectList("team.dao.TeamMapper.teamLogDtoList",teamCode);
	}

	/**
	 * @함수명: teamLogDelete
	 * @작성일: 2015. 7. 7.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public int teamLogDelete(String replyPassword, int replyCode) {
		HashMap<String,Object> hMap=new HashMap<String,Object>();
		hMap.put("replyPassword", replyPassword);
		hMap.put("replyCode", replyCode);
		
		return sqlSession.delete("team.dao.TeamMapper.teamLogDelete",hMap);
	}
	
	/**
	 * @함수명:editSchedule
	 * @작성일:2015. 7. 6.
	 * @작성자:조영석
	 * @설명문:스케쥴일정 값을 데이터베이스에 집어넣는 메소드 
	 */
	@Override
	public int editSchedule(ScheduleDto scheduleDto,String teamId) {
		int value=0;
		int teamCode=sqlSession.selectOne("team.dao.TeamMapper.scheduleTeamid",teamId);
		scheduleDto.setTeamCode(teamCode);
		value=sqlSession.insert("team.dao.TeamMapper.insertSchedule",scheduleDto);
		return value;
	}
	
	/**
	 * @함수명:readSchedule
	 * @작성일:2015. 7. 6.
	 * @작성자:조영석
	 * @설명문:스케쥴 정보 불러오기 메소드
	 */
	@Override
	public List<ScheduleDto> readSchedule(String teamName) {
		int teamCode=sqlSession.selectOne("team.dao.TeamMapper.scheduleTeamid",teamName);
		ScheduleDto scheduleDto=new ScheduleDto();
		scheduleDto.setTeamCode(teamCode);
		
		return sqlSession.selectList("team.dao.TeamMapper.readSchedule",scheduleDto);
	}
	
	/**
	 * @함수명:readCount
	 * @작성일:2015. 7. 6.
	 * @작성자:조영석
	 * @설명문:스케쥴 총 갯수 구하는 메소드 
	 */
	@Override
	public int readCount(String teamName) {
		int teamCode=sqlSession.selectOne("team.dao.TeamMapper.scheduleTeamid",teamName);
		
		return sqlSession.selectOne("team.dao.TeamMapper.readCount",teamCode);
	}
	
	/**
	 * @함수명:scheduleContent
	 * @작성일:2015. 7. 7.
	 * @작성자:조영석
	 * @설명문:스케쥴 세부일정 내용열람을 위한 데이터베이스연결
	 */
	@Override
	public ScheduleDto scheduleContents(int scheduleNumber) {
//		HashMap<String,Object> Hmap=new HashMap<String,Object>();
//		Hmap.put("teamCode", teamCode);
//		Hmap.put("scheduleNumber", scheduleNumber);
		return sqlSession.selectOne("team.dao.TeamMapper.scheduleContent",scheduleNumber);
	}

	/**
	 * @함수명:selectMember
	 * @작성일:2015. 7. 7.
	 * @작성자:조영석
	 * @설명문:스케쥴 권한 부여를 위한 데이터베이스연결
	 */
	@Override
	public TeamDto selectMember(int scheduleNumber) {
		int teamCode=sqlSession.selectOne("team.dao.TeamMapper.scheduleNumber",scheduleNumber);
		
		TeamDto teamDto=null;
		if(teamCode>0){
			 teamDto=sqlSession.selectOne("team.dao.TeamMapper.selectTeam",teamCode);
		}
		
		return teamDto;
	}

	/**
	 * @함수명:deleteSchedule
	 * @작성일:2015. 7. 7.
	 * @작성자:조영석
	 * @설명문:스케쥴 삭제를 위한 데이터베이스연결
	 */
	@Override
	public int deleteSchedule(int scheduleNumber) {
		
		return sqlSession.delete("team.dao.TeamMapper.deleteSchedule",scheduleNumber);
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
}
