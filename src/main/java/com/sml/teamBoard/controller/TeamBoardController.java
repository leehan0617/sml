package com.sml.teamBoard.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sml.teamBoard.dto.TeamBoardDto;
import com.sml.teamBoard.service.TeamBoardService;

@Controller
public class TeamBoardController {
	private Logger logger = Logger.getLogger(TeamBoardController.class.getName());
	@Autowired
	private TeamBoardService service;
	
	
	/**
	 * @함수명:viewTeamBoard
	 * @작성일:2015. 7. 10.
	 * @작성자:이한빈 
	 * @설명문:팀공지사항 이동함수 
	 */
	@RequestMapping(value="/teamPage/viewTeamBoard.do" , method=RequestMethod.GET)
	public ModelAndView viewTeamBoard(HttpServletRequest request , HttpServletResponse response){
		logger.info("TeamController viewTeamBoard");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = service.viewTeamBoard(request);
		
		return mav;
	}
	
	/**
	 * @name : TeamController
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 게시판 읽기 페이지
	 */
	@RequestMapping(value="/teamPage/readTeamBoard.do",method=RequestMethod.GET)
	 public ModelAndView readTeamBoard(HttpServletRequest request,HttpServletResponse response){
		logger.info("TeamBoardController readTeamBoard");
		ModelAndView mav=new ModelAndView();
		response.setCharacterEncoding("UTF-8");
		mav=service.readTeamBoard(request);
		
		return mav;
	}
	
	/**
	 * @name : TeamController
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 게시판 공지 관리 페이지
	 */
	
	@RequestMapping(value="/teamPage/manageTeamBoard.do",method=RequestMethod.GET)
	 public ModelAndView manageTeamBoard(HttpServletRequest request){
		logger.info("TeamController viewTeamBoard");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		service.manageTeamBoard(mav);
		
		return mav;
	}
		
	/**
	 * @name : TeamController
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 게시판 공지사항 삭제
	 */
	
	@RequestMapping(value="/teamPage/deleteTeamBoard.do",method=RequestMethod.GET)
	 public ModelAndView deleteTeamBoard(HttpServletRequest request){
		logger.info("TeamController deleteTeamBoard");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		service.deleteTeamBoard(mav);
		
		return mav;
	}
	
	/**
	 * @name : TeamController
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 게시판 공지사항 수정
	 */
	@RequestMapping(value="/teamPage/updateTeamBoard.do",method=RequestMethod.GET)
	 public ModelAndView updateTeamBoard(HttpServletRequest request){
		logger.info("TeamController updateTeamBoard");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		service.updateTeamBoard(mav);
		
		return mav;
	}
	
	/**
	 * @name : TeamController
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 게시판 공지사항 수정
	 */
	@RequestMapping(value="/teamPage/updateTeamBoard.do",method=RequestMethod.POST)
	 public ModelAndView updateTeamBoard(HttpServletRequest request, TeamBoardDto board){
		logger.info("TeamController updateTeamBoard");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("board", board);
		service.updateOkTeamBoard(mav);
		
		return mav;
	}
	
	/**
	 * @함수명:paging
	 * @작성일:2015. 7. 15.
	 * @작성자:이한빈 
	 *@설명문: 팀공지사항 게시판 페이징.
	 *
	 */
	@RequestMapping(value="/paging" , method=RequestMethod.GET)
	public ModelAndView paging(HttpServletRequest request,HttpServletResponse response){
		logger.info("TeamController updateTeamBoard");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = service.viewTeamBoard(request);
		
		return mav;
	}
	
	@RequestMapping(value="/writeTeamBoard" , method=RequestMethod.GET)
	public ModelAndView writeTeamBoard(HttpServletRequest request,HttpServletResponse response){
		logger.info("TeamController writeTeamBoard");
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mav = service.writeTeamBoard(request);
		
		return mav;
	}
}
