package com.sml.teamBoard.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sml.teamBoard.dao.TeamBoardDao;
import com.sml.teamBoard.dto.TeamBoardDto;

@Service
public class TeamBoardServiceImpl implements TeamBoardService{
	private Logger logger = Logger.getLogger(TeamBoardServiceImpl.class.getName());
	@Autowired
	private TeamBoardDao dao;
	
	@Override
	/**
	 * 
	 * @함수명 : viewTeamBoard
	 * @작성일 : 2015. 6. 25.
	 * @작성자 : 이희재
	 * @설명   : 팀 게시판에서 팀 공지사항 보기
	 */
	public ModelAndView viewTeamBoard(HttpServletRequest request) {
		logger.info("Service viewTeamBoard");
		
		String teamName=request.getParameter("teamName");
		
		// 팀 전체 게시물 수
		int count=dao.getBoardCount(teamName);
		// 한 블록 당 출력될 게시물 수
		int boardSize=8;
		// 한 페이지당 들어갈 블록
		int blockSize=5;
		
		int currentPage;
		if(request.getParameter("currentPage")==null){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int blockCount=count/boardSize + (count%boardSize==0? 0:1);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=startRow+boardSize-1;
		
		System.out.println("teamName"+teamName+",count:"+count+",currentPage:"+currentPage+",blockCount:"+blockCount+",startRow:"+startRow);
		
		List<TeamBoardDto> teamBoardList = dao.viewTeamBoard(teamName,startRow,endRow);
		// 팀 게시물 전체 가져오기

		ModelAndView mav = new ModelAndView();
		mav.addObject("blockCount", blockCount);
		mav.addObject("teamName",teamName);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("blockSize", blockSize);
		mav.addObject("currentPage",currentPage);
		mav.addObject("teamBoardList" , teamBoardList);
		mav.setViewName("jsonView");
		
		return mav;
	}
	/**
	 * 
	 * @함수명:viewTeamBoardTemplate
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:팀메인페이지 게시판 띄우는함수 
	 */
	public void viewTeamBoardTemplate(ModelAndView mav) {
		logger.info("Service viewTeamBoard");
		Map <String , Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String teamName=request.getParameter("teamName");
		
		// 팀 전체 게시물 수
		int count=dao.getBoardCount(teamName);
		// 한 블록 당 출력될 게시물 수
		int boardSize=8;
		// 한 페이지당 들어갈 블록
		int blockSize=2;
		
		int currentPage;
		if(request.getParameter("currentPage")==null){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int blockCount=count/boardSize + (count%boardSize==0? 0:1);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=startRow+boardSize-1;
		
		System.out.println("teamName"+teamName+",count:"+count+",currentPage:"+currentPage+",blockCount:"+blockCount+",startRow:"+startRow);
		
		List<TeamBoardDto> teamBoardList = dao.viewTeamBoard(teamName,startRow,endRow);
		// 팀 게시물 전체 가져오기

		mav.addObject("blockCount", blockCount);
		mav.addObject("teamName",teamName);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("blockSize", blockSize);
		mav.addObject("currentPage",currentPage);
		mav.addObject("teamBoardList" , teamBoardList);
		mav.setViewName("teamTemplate/teamBoardTemplate");
		
	}

	
	
	
	/**
	 * @name : teamPage
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 게시판 읽기 함수
	 */
	@Override
	public ModelAndView readTeamBoard(HttpServletRequest request) {
		int boardNumber=Integer.parseInt(request.getParameter("boardNumber"));
		
		TeamBoardDto board=dao.getBoardDto(boardNumber);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("board" , board);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 게시판에서 팀 관리 페이지로 이동
	 */
	public void manageTeamBoard(ModelAndView mav) {
		logger.info("Service viewTeamBoard");
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		
		int count=dao.getBoardCount(teamName);
		// 팀 전체 게시물 수
		
		int boardSize=3;
		// 한 블록 당 출력될 게시물 수
		
		int blockSize=2;
		// 한 페이지당 들어갈 블록
		
		int currentPage=1;
		if(request.getParameter("currentPage")!=null){
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int blockCount=count/boardSize + (count%boardSize==0? 0:1);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=startRow+boardSize-1;
		
		List<TeamBoardDto> teamBoardList = dao.viewTeamBoard(teamName,startRow,endRow);
		// 팀 게시물 전체 가져오기
		
		mav.addObject("blockCount", blockCount);
		mav.addObject("teamName",teamName);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("blockSize", blockSize);
		mav.addObject("currentPage",currentPage);
		mav.addObject("teamBoardList" , teamBoardList);
		mav.setViewName("teamBoard/manageTeamBoard");
	}

	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 게시판에서 공지 삭제
	 */
	
	@Override
	public void deleteTeamBoard(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		int currentPage=Integer.parseInt(request.getParameter("currentPage"));
		int boardNumber=Integer.parseInt(request.getParameter("boardNumber"));
		
		int deleteValue=dao.deleteTeamBoard(boardNumber);
		
		mav.addObject("teamName", teamName);
		mav.addObject("deleteValue", deleteValue);
		mav.addObject("currentPage",currentPage);
		mav.setViewName("teamBoard/okTeamBoard");
	}

	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 게시판에서 공지 수정을 위한 불러오기
	 */
	
	@Override
	public void updateTeamBoard(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		int currentPage=Integer.parseInt(request.getParameter("currentPage"));
		int boardNumber=Integer.parseInt(request.getParameter("boardNumber"));
		
		TeamBoardDto board=dao.getBoardDto(boardNumber);
		mav.addObject("teamName", teamName);
		mav.addObject("board", board);
		mav.addObject("currentPage",currentPage);
		mav.setViewName("teamBoard/writeTeamBoard");
	}

	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 게시판에서 공지 수정완료
	 */
	@Override
	public void updateOkTeamBoard(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String teamName=request.getParameter("teamName");
		int currentPage=Integer.parseInt(request.getParameter("currentPage"));
		TeamBoardDto board=(TeamBoardDto) map.get("board");
		board.setBoardDate(new Date());
		
		int updateValue=dao.updateTeamBoard(board);
		mav.addObject("teamName", teamName);
		mav.addObject("updateValue", updateValue);
		mav.addObject("currentPage",currentPage);
		mav.setViewName("teamBoard/okTeamBoard");
	}
	
	/**
	 * 
	 * @함수명:writeTeamBoard
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:팀게시판 게시글 작성 함수 
	 */
	@Override
	public ModelAndView writeTeamBoard(HttpServletRequest request) {
		//String teamName = request.getParameter("teamName");
		int teamCode =Integer.parseInt(request.getParameter("teamCode"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = dao.getLeaderName(teamCode);
		
		TeamBoardDto teamBoard = new TeamBoardDto();
		teamBoard.setBoardWriter(writer);
		teamBoard.setBoardContent(content);
		teamBoard.setBoardTitle(title);
		teamBoard.setTeamCode(teamCode);
		teamBoard.setBoardDate(new Date());
		
		dao.insertTeamBoard(teamBoard);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
}
