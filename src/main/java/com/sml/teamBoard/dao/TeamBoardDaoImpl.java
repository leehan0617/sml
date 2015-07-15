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
		return sqlSession.selectOne("teamBoard.dao.TeamBoardMapper.getBoardCount",teamName);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : boardNumber를 이용한 게시물 읽기
	 */
	@Override
	public TeamBoardDto getBoardDto(int boardNumber) {
		return sqlSession.selectOne("teamBoard.dao.TeamBoardMapper.getBoardDto", boardNumber);
	}


	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 게시판 공지 지우기
	 */
	
	@Override
	public int deleteTeamBoard(int boardNumber) {
		return sqlSession.delete("teamBoard.dao.TeamBoardMapper.deleteTeamBoard", boardNumber);
	}

	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 게시판 수정 완료
	 */
	@Override
	public int updateTeamBoard(TeamBoardDto board) {
		return sqlSession.update("teamBoard.dao.TeamBoardMapper.updateTeamBoard", board);
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
		
		return sqlSession.selectList("teamBoard.dao.TeamBoardMapper.viewTeamBoardList" , map);
	}
	
	/**
	 * @name : TeamDaoImpl
	 * @date : 2015. 6. 25.
	 * @author : 이희재
	 * @description : 팀 정보를 갖고 오기 위한 함수
	 */
	@Override
	public TeamDto getTeamInfo(String teamName) {
		return sqlSession.selectOne("teamBoard.dao.TeamBoardMapper.getTeamInfo",teamName);
	}
}
