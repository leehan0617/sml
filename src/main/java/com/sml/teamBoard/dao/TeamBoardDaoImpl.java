package com.sml.teamBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sml.team.dto.TeamDto;
import com.sml.teamBoard.dto.TeamBoardDto;

@Component
public class TeamBoardDaoImpl implements TeamBoardDao{
	private Logger logger = Logger.getLogger(TeamBoardDaoImpl.class.getName());
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 6. 25.
	 * @author : 이희재
	 * @description : 페이징 기법을 위한 전체 게시물 수 출력
	 */
	@Override
	public int getBoardCount(String teamName) {
		logger.info("####getBoardCount");
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
	 * @함수명:viewTeamBoard
	 * @작성일:2015. 7. 9.
	 * @작성자:이한빈 
	 * @설명문:팀게시판 보는 코드
	 */
	@Override
	public List<TeamBoardDto> viewTeamBoard(String teamName, int startRow,
			int endRow) {
		HashMap<String , Object> map = new HashMap<String , Object>();
		map.put("teamName", teamName);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return sqlSession.selectList("team.dao.TeamMapper.viewTeamBoardList" , map);
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
}
