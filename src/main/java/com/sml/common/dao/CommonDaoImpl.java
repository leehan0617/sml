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
	
	/**
	 * 
	 * @함수명: addCommonBoard
	 * @작성일: 2015. 7. 20.
	 * @작성자: 정성남
	 * @설명 : 공지사항 글쓰기를 위한 DB호출
	 */
	@Override
	public int addCommonBoard(CommonBoardDto commonBoardDto) {
		return sqlSession.insert("dao.BoardMapper.addCommonBoard",commonBoardDto);
	}
	
	/**
	 * 
	 * @함수명: getCommonBoardCount
	 * @작성일: 2015. 7. 20.
	 * @작성자: 정성남
	 * @설명 : 게시판 페이징을 위한 총게시물수 확인을 위한 DB 호출
	 */
	@Override
	public int getCommonBoardCount() {
		return sqlSession.selectOne("dao.BoardMapper.getCommonBoardCount");
	}
	
	/**
	 * 
	 * @함수명: getCommonBoardList
	 * @작성일: 2015. 7. 20.
	 * @작성자: 정성남
	 * @설명 : 게시판 페이지를 호출하기 위한 DB호출
	 */
	@Override
	public List<CommonBoardDto> getCommonBoardList(int startRow, int endRow) {
		Map<String,Integer> hMap=new HashMap<String,Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSession.selectList("dao.BoardMapper.getCommonBoardList",hMap);
	}
	
	/**
	 * 
	 * @함수명: getCommonBoardList
	 * @작성일: 2015. 7. 20.
	 * @작성자: 정성남
	 * @설명 : 게시판을 삭제하기 위한  DB호출
	 */
	@Override
	public int deleteCommonBoard(int boardNumber) {
		return sqlSession.delete("dao.BoardMapper.deleteCommonBoard",boardNumber);
	}
	
	/**
	 * 
	 * @함수명: readCommonBoard
	 * @작성일: 2015. 7. 20.
	 * @작성자: 정성남
	 * @설명 : 게시판을 읽기 위한  DB호출
	 */
	@Override
	public CommonBoardDto readCommonBoard(int boardNumber) {
		return sqlSession.selectOne("dao.BoardMapper.readCommonBoard",boardNumber);
	}
	
	/**
	 * 
	 * @함수명: updateCommonBoardSelect
	 * @작성일: 2015. 7. 20.
	 * @작성자: 정성남
	 * @설명 : 게시판을 수정하기 위한 데이터  DB호출
	 */

	@Override
	public CommonBoardDto updateCommonBoardSelect(int boardNumber) {
		return sqlSession.selectOne("dao.BoardMapper.updateCommonBoardSelect",boardNumber);
	}
	
	/**
	 * 
	 * @함수명: updateCommonBoardOk
	 * @작성일: 2015. 7. 20.
	 * @작성자: 정성남
	 * @설명 : 게시판을 수정하기 위한  DB호출
	 */
	@Override
	public int updateCommonBoardOk(CommonBoardDto commonBoard) {
		System.out.println("commonBoard"+commonBoard.getSportCode());
		return sqlSession.update("dao.BoardMapper.updateCommonBoardOk",commonBoard);
	}
	
	/**
	 * 
	 * @함수명: autoSearch
	 * @작성일: 2015. 7. 20.
	 * @작성자: 정성남
	 * @설명 : 게시판 검색을 위한 DB호출
	 */
	
	@Override
	public List<String> autoSearch(String result) {
		return sqlSession.selectList("dao.BoardMapper.autoSearch",result);
	}
	
	/**
	 * 
	 * @함수명: searchBoard
	 * @작성일: 2015. 7. 20.
	 * @작성자: 정성남
	 * @설명 : 게시판 검색을 위한 DB호출
	 */

	@Override
	public List<CommonBoardDto> searchBoard(String boardName) {
		return sqlSession.selectList("dao.BoardMapper.searchBoard", boardName);
	}
	
	
}
