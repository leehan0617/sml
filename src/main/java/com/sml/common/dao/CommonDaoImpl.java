package com.sml.common.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sml.common.dto.CommonBoardDto;

@Component
public class CommonDaoImpl implements CommonDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int addCommonBoard(CommonBoardDto commonBoardDto) {
		return sqlSession.insert("dao.BoardMapper.addCommonBoard",commonBoardDto);
	}

	@Override
	public int getCommonBoardCount() {
		return sqlSession.selectOne("dao.BoardMapper.getCommonBoardCount");
	}

	@Override
	public List<CommonBoardDto> getCommonBoardList(int startRow, int endRow) {
		Map<String,Integer> hMap=new HashMap<String,Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSession.selectList("dao.BoardMapper.getCommonBoardList",hMap);
	}

	@Override
	public int deleteCommonBoard(int boardNumber) {
		return sqlSession.delete("dao.BoardMapper.deleteCommonBoard",boardNumber);
	}

	@Override
	public CommonBoardDto readCommonBoard(int boardNumber) {
		return sqlSession.selectOne("dao.BoardMapper.readCommonBoard",boardNumber);
	}

	@Override
	public CommonBoardDto updateCommonBoardSelect(int boardNumber) {
		return sqlSession.selectOne("dao.BoardMapper.updateCommonBoardSelect",boardNumber);
	}

	@Override
	public int updateCommonBoardOk(CommonBoardDto commonBoard) {
		return sqlSession.update("dao.BoardMapper.updateCommonBoardOk",commonBoard);
	}

	@Override
	public List<String> autoSearch(String result) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("dao.BoardMapper.autoSearch",result);
	}

	@Override
	public List<CommonBoardDto> searchBoard(String boardName) {
		return sqlSession.selectList("dao.BoardMapper.searchBoard", boardName);
	}
	
	
}
