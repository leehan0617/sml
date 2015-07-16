package com.sml.soccer.dao;

import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sml.common.dto.CommonBoardDto;

@Repository
public class SDaoImpl implements SDao{
	private final Logger logger = Logger.getLogger(SDaoImpl.class.getName());
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * @함수명:getBoardCount
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:축구페이지 게시판 총 갯수 가져오는 함수
	 */
	@Override
	public int getBoardCount(int sportCode) {
		logger.info("SDao getBoardCount");
		return sqlSession.selectOne("soccer.dao.SMapper.getBoardCount",sportCode);
	}

	@Override
	public List<CommonBoardDto> getSoccerBoardList(int sportCode, int startRow,
			int endRow) {
		logger.info("SDao getSoccerBoardList");
		HashMap<String ,Object> hMap = new HashMap<String,Object>();
		hMap.put("sportCode", sportCode);
		hMap.put("startRow",startRow);
		hMap.put("endRow", endRow);
			
		return sqlSession.selectList("soccer.dao.SMapper.getSoccerBoardList",hMap);
	}
	
	
	
}