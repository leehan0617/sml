package com.sml.common.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.sml.common.dao.CommonDao;
import com.sml.common.dto.CommonBoardDto;

@Component
public class CommonServiceImpl implements CommonService {	
	final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private CommonDao commonDao;
	
	@Override
	public void addCommonBoard(ModelAndView mav) {
		mav.setViewName("/board/addCommonBoard");
		
	}
	
	/**
	 * @name : CommonServiceImpl
	 * @date : 2015. 6. 23.
	 * @author : 정성남 
	 * @description : 공통 게시판 글 작성 완료하기
	 */
	
	@Override
	public void addCommonBoardOk(ModelAndView mav) {
		logger.info("writeOk-------------");
		
		Map<String,Object> map=mav.getModelMap();		
		CommonBoardDto commonBoardDto=(CommonBoardDto) map.get("commonBoardDto");
		commonBoardDto.setBoardDate(new Date());
		int check=commonDao.addCommonBoard(commonBoardDto);
		mav.addObject("check",check);
		mav.setViewName("/board/addCommonBoardOk");		
		
	}

	/**
	 * @name : CommonServiceImpl
	 * @date : 2015. 6. 23.
	 * @author : 정성남 
	 * @description : 공통 게시판 글 목록 출력
	 */
	
	@Override
	public void adminBoard(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=10;		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=commonDao.getCommonBoardCount();
		logger.info("count:"+count);
		logger.info("currentPage"+currentPage);
		logger.info("startRow"+startRow);
		logger.info("endRow"+endRow);
		
		List<CommonBoardDto> commonBoardList=null;
		
		if(count>0){
			commonBoardList=commonDao.getCommonBoardList(startRow,endRow);
		}
		
		//logger.info("boardListSize:"+commonBoardList.size());
		
		mav.addObject("commonBoardList",commonBoardList);
		mav.addObject("count",count);		
		mav.addObject("boardSize",boardSize);
		mav.addObject("currentPage",currentPage);
		mav.setViewName("board/adminBoard");
	}

	/**
	 * @name : CommonServiceImpl
	 * @date : 2015. 6. 23.
	 * @author : 정성남 
	 * @description : 공통 게시판 글 삭제하기
	 */
	
	@Override
	public void deleteCommonBoard(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int boardNumber=Integer.parseInt(request.getParameter("boardNumber"));
		System.out.println(boardNumber);
		int check=commonDao.deleteCommonBoard(boardNumber);
		System.out.println(" " + check);
		mav.addObject("check",check);
		mav.setViewName("board/deleteCommonBoard");
	}

	/**
	 * @name : CommonServiceImpl
	 * @date : 2015. 6. 23.
	 * @author : 정성남 
	 * @description : 공통 게시판 글 읽기
	 */
	@Override
	public void readCommonBoard(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int boardNumber=Integer.parseInt(request.getParameter("boardNumber"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		CommonBoardDto commonBoard=commonDao.readCommonBoard(boardNumber);
		mav.addObject("commonBoard",commonBoard);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("boardNumber",boardNumber);
		mav.setViewName("board/readCommonBoard");
	}

	/**
	 * @name : CommonServiceImpl
	 * @date : 2015. 6. 23.
	 * @author : 정성남 
	 * @description : 공통 게시판 글 수정하기
	 */
	
	@Override
	public void updateCommonBoardSelect(ModelAndView mav) {	
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int boardNumber=Integer.parseInt(request.getParameter("boardNumber"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));	
		
		CommonBoardDto commonBoard=commonDao.updateCommonBoardSelect(boardNumber);
		mav.addObject("commonBoard",commonBoard);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("boardNumber",boardNumber);
		mav.setViewName("board/updateCommonBoard");
	}

	/**
	 * @name : CommonServiceImpl
	 * @date : 2015. 6. 23.
	 * @author : 정성남 
	 * @description : 공통 게시판 글 수정 완료하기
	 */
	
	@Override
	public void updateCommonBoardOk(ModelAndView mav) {
		logger.info("UpdateOKOKOKOKOK---------");
		Map<String,Object> map=mav.getModelMap();

		CommonBoardDto commonBoard=(CommonBoardDto) map.get("commonBoardDto");	
		logger.info("boardNumber:" +  commonBoard.getBoardNumber());
		logger.info("sportCode:" +  commonBoard.getSportCode());
		int check=commonDao.updateCommonBoardOk(commonBoard);
		
		mav.addObject("check",check);
		mav.setViewName("board/updateCommonBoardOk");
	}

	/**
	 * @name : searchBoard
	 * @date : 2015. 6. 23.
	 * @author : 변형린
	 * @description : 관리자 공지사항게시판에서 공지사항 검색
	 */
	@Override
	public void searchBoard(ModelAndView mav) {
		logger.info("searchBoardOKOKOKOKOK---------");
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String boardName=request.getParameter("boardName");
		
		System.out.println(boardName);
		List<CommonBoardDto> commonBoardList=commonDao.searchBoard(boardName);
		System.out.println(commonBoardList);
		mav.addObject("commonBoardList",commonBoardList);
		mav.setViewName("board/adminBoard");
	}	
}


