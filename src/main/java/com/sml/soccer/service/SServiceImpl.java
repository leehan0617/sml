package com.sml.soccer.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sml.common.dto.CommonBoardDto;
import com.sml.soccer.dao.SDao;

@Service
public class SServiceImpl implements SService{
	private Logger logger = Logger.getLogger(SServiceImpl.class.getName());
	@Autowired
	private SDao dao;
	
	/**
	 * @함수명:viewSoccerBoard
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:축구페이지에서 공지사항 게시판 보는 함수 
	 */
	@Override
	public ModelAndView viewSoccerBoard(HttpServletRequest request) {
		logger.info("SService viewSoccerBoard");
		//축구페이지 스포츠코드는 0 
		int sportCode = Integer.parseInt(request.getParameter("sportCode"));
		
		//축구페이지인 공지사항 총갯수 가져오기.
		int count=dao.getBoardCount(sportCode);
		
		//System.out.println("축구페이지 공지사항 총갯수:" + count);
		
		// 한 블록 당 출력될 게시물 수
		int boardSize=8;
		// 한 페이지당 들어갈 블록
		int blockSize=2;
		
		String cp = request.getParameter("currentPage");
		int currentPage;
		if(cp.equals("") || cp == null){
			currentPage = 1;
		}else{
			currentPage = Integer.parseInt(cp);
		}
		
		int blockCount=count/boardSize + (count%boardSize==0? 0:1);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=startRow+boardSize-1;
		
		//System.out.println("sportCode"+sportCode+",count:"+count+",currentPage:"+currentPage+",blockCount:"+blockCount+",startRow:"+startRow);
		
		//축구페이지 게시물 가져오기 
		List<CommonBoardDto> soccerBoardList = dao.getSoccerBoardList(sportCode,startRow,endRow);

		ModelAndView mav = new ModelAndView();
		mav.addObject("blockCount", blockCount);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("blockSize", blockSize);
		mav.addObject("currentPage",currentPage);
		mav.addObject("soccerBoardList" , soccerBoardList);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	/**
	 * 
	 * @함수명:readSoccerBoard
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:축구페이지 공지사항 읽는 함수 
	 */
	@Override
	public ModelAndView readSoccerBoard(HttpServletRequest request) {
		int boardNumber=Integer.parseInt(request.getParameter("boardNumber"));
		
		CommonBoardDto board = dao.getBoardContent(boardNumber);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("board" , board);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
}
