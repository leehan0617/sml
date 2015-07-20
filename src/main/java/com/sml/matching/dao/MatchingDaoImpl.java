package com.sml.matching.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sml.matching.dto.MatchingDto;
import com.sml.member.dto.MemberDto;
import com.sml.team.dto.TeamDto;

@Component
public class MatchingDaoImpl implements MatchingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 * 
	 * @함수명 : searchMatching
	 * @작성일 : 2015. 6. 23.
	 * @작성자 : 이한빈
	 * @설명   : 서비스에서 요청받은 값을 데이터베이스에 연결해서 값을 삽입하는 메소드
	 */
	@Override
	public int searchMatching(MatchingDto matchingDto) {
		return sqlSession.insert("matching.dao.matchingMapper.searchMatching" , matchingDto);
	}


	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 6.
	 * @author : 이희재
	 * @description : 해당 팀에 대한 매칭 등록 정보가 있는지 확인
	 */
	@Override
	public MatchingDto getTeamMatchingInfo(int teamCode) {
		return sqlSession.selectOne("matching.dao.matchingMapper.getTeamMatchingInfo", teamCode);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 6.
	 * @author : 이희재
	 * @description : 매칭 정보 삭제
	 */
	@Override
	public int deleteMatching(int matchingCode) {
		return sqlSession.delete("matching.dao.matchingMapper.deleteMatching", matchingCode);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 7.
	 * @author : 이희재
	 * @description : 자신의 매칭 정보를 제외한 같은 종목의 매칭 정보 가져오기
	 */
	@Override
	public List<MatchingDto> getOtherMatchingInfo(int teamCode, String sportType) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("teamCode", teamCode);
		hMap.put("sportType", sportType);
		hMap.put("matchingState", "중");
		return sqlSession.selectList("matching.dao.matchingMapper.getOtherMatchingInfo",hMap);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 8.
	 * @author : 이희재
	 * @description : 매칭이 완료되면 매칭의 상태를 전->중 으로 바꿔줌
	 */
	@Override
	public void changeMatchingState(MatchingDto matchingDto) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("matchingState", "후");
		hMap.put("matchingCode", matchingDto.getMatchingCode());
		sqlSession.update("matching.dao.matchingMapper.changeMatchingState", hMap);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 8.
	 * @author : 이희재
	 * @description : 성사된 매칭을 이용하여 경기 시작 전 상태의 친선 gameRecord 생성
	 */
	@Override
	public void createGameRecord(MatchingDto myMatchingDto,
			MatchingDto otherMatchingDto) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("teamCode", myMatchingDto.getTeamCode());
		hMap.put("teamCode2", otherMatchingDto.getTeamCode());
		hMap.put("gameType", 0);
		hMap.put("refereeNumber",1);
		hMap.put("gameState", "경기 전");
		hMap.put("sportType", myMatchingDto.getMatchingSport());
		
		sqlSession.insert("matching.dao.matchingMapper.createGameRecord", hMap);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 9.
	 * @author : 이희재
	 * @description : 매칭의 상태를 전 -> 중으로 변경
	 */
	@Override
	public void setWaitMatching(int teamCode) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("teamCode", teamCode);
		hMap.put("matchingState", "중");
		sqlSession.update("matching.dao.matchingMapper.setWaitMatching", hMap);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 6. 25.
	 * @author : 이희재
	 * @description : 팀 정보를 갖고 오기 위한 함수
	 */
	@Override
	public TeamDto getTeamInfo(String teamName) {
		System.out.println("dao : " +teamName);
		return sqlSession.selectOne("matching.dao.matchingMapper.getTeamInfo",teamName);
	}


	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 팀 코드에 따른 팀 ground 출력
	 */
	@Override
	public String getTeamGround(int teamCode) {
		return sqlSession.selectOne("matching.dao.matchingMapper.getTeamGround", teamCode);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 8.
	 * @author : 이희재
	 * @description : 경기 시작 전인 친선 경기의 매치 정보와 해당 팀의 정보를 모두 가져옴
	 */
	@Override
	public HashMap<String, Object> getNormalMatchInfo(int teamCode) {
		return sqlSession.selectOne("matching.dao.matchingMapper.getNormalMatchInfo", teamCode);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 7. 9.
	 * @author : 이희재
	 * @description : 팀 코드를 이용하여 팀의 정보를 가져 옴
	 */
	@Override
	public TeamDto getTeamInfo(int teamCode) {
		return sqlSession.selectOne("matching.dao.matchingMapper.getTeamCodeInfo",teamCode);
	}


	/**
	 * @name : getTeamLeaderInfo
	 * @date : 2015. 7. 10.
	 * @author : 이희재
	 * @description : 팀 코드와 팀 리더이름을 이용하여 팀장 정보를 가져 옴
	 */
	@Override
	public MemberDto getTeamLeaderInfo(int teamCode, String leaderName) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("teamCode", teamCode);
		hMap.put("leaderName", leaderName);
		return sqlSession.selectOne("matching.dao.matchingMapper.getTeamLeaderInfo", hMap);
	}
}
