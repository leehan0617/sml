package com.sml.team.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sml.member.dto.MemberDto;
import com.sml.schedule.service.ScheduleService;
import com.sml.team.dto.TeamDto;
import com.sml.team.dto.TeamLogDto;
import com.sml.team.service.TeamService;
import com.sml.teamBoard.service.TeamBoardService;


@Controller
public class TeamController {
	private Logger logger = Logger.getLogger(TeamController.class.getName());
	@Autowired
	private TeamService service;
	@Autowired 
	private ScheduleService scheduleService;
	@Autowired
	private TeamBoardService teamBoardService;
	
	/**
	 * @함수명:idCheck
	 * @작성일:2015. 6. 23.
	 * @작성자:조영석
	 * @설명문:아이디 중복체크를 위한 이동 메소드
	 */
	@RequestMapping(value="/member/idCheck.do",method=RequestMethod.GET)
	 	public ModelAndView idCheck(HttpServletRequest request,HttpServletResponse response){
			ModelAndView mav=new ModelAndView();
			
			mav.addObject("request",request);
			
			service.idCheck(mav);
			return mav;
		}
	
	/**
	 * @함수명:teamIdCheck
	 * @작성일:2015. 6. 23.
	 * @작성자:조영석
	 * @설명문:팀원명 중복체크를 위한 이동 메소드 
	 */
	
	@RequestMapping(value="/member/idCheckName.do",method=RequestMethod.GET)
	 	public ModelAndView teamIdCheck(HttpServletRequest request,HttpServletResponse response){
			ModelAndView mav=new ModelAndView();
			
			mav.addObject("request",request);
			
			service.teamIdCheck(mav);
			return mav;
	}
	
	/**
	 * @함수명:login
	 * @작성일:2015. 6. 25.
	 * @작성자:조영석
	 * @설명문:로그인 이동 메소드 
	 */
	@RequestMapping(value="/teamPage/login.do" , method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response,TeamDto teamDto,TeamLogDto teamLogDto){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("teamLogDto",teamLogDto);
		mav.addObject("teamDto",teamDto);
		service.login(mav);
		return mav;
	}
	
	@RequestMapping(value="/teamPage/login.do" , method=RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request,TeamDto teamDto,TeamLogDto teamLogDto){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("teamLogDto",teamLogDto);
		mav.addObject("teamDto",teamDto);
		service.login(mav);
		return mav;
	}
	
	
	/**
	 * @함수명:logout
	 * @작성일:2015. 6. 25.
	 * @작성자:조영석
	 * @설명문:로그아웃 이동 메소드
	 */
	@RequestMapping(value="/teamPage/logout.do" , method=RequestMethod.GET)
	public String logout(){
		logger.info("TeamController logout");
		return "teamPage/logout";
	}
	
	/**
	 * @name : teamPage
	 * @date : 2015. 6. 25.
	 * @author : 이희재
	 * @description : 팀 페이지로 이동하는 함수
	 * 					팀 명에 따라 달라지는 함수
	 */
	@RequestMapping(value="/team/teamMain.do",method=RequestMethod.GET)
	 public ModelAndView teamPage(HttpServletRequest request){
		logger.info("controller : teamPage/teamMemberInfo");
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		service.goTeamPage(mav);
		teamBoardService.viewTeamBoard(mav);
		scheduleService.readteamSchedule(mav);
		service.getReplyList(mav);
			
		mav.setViewName("team/teamMain");
		
		return mav;
	}
	
	
	
	
	/**
	 * @name : TeamController
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 팀원 삭제 페이지
	 */
	@RequestMapping(value="/teamPage/viewTeamRecord.do", method=RequestMethod.GET)
	 public ModelAndView viewTeamRecord(HttpServletRequest request){
		logger.info("TeamController viewTeamRecord");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		service.viewTeamRecord(mav);
		
		return mav;
	}
	
	/**
	 * @name : TeamController
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 연고지 설정창 띄우기
	 */
	@RequestMapping(value="/member/searchHomeGround.do", method=RequestMethod.GET)
	 public ModelAndView searchHomeGround(HttpServletRequest request){
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/searchHomeGround");
		
		return mav;
	}
	
	/**
	 * @name : TeamController
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 시/도에 따른 하위 주소 변경
	 */
	@RequestMapping(value="/member/searchRegion.do", method=RequestMethod.GET)
	 public ModelAndView searchRegion(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		service.searchRegion(mav);
		
		return mav;
	}	
	
	/**
	 * @name : manageTeamEmblem
	 * @date : 2015. 7. 7.
	 * @author : 변형린
	 * @description : 팀 로고 변경 창 이동
	 */
	@RequestMapping(value="/teamPage/manageTeamEmblem.do", method=RequestMethod.GET)
	 public ModelAndView updateTeamEmblem(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		service.updateTeamEmblem(mav);
		
		return mav;
	}
	
	/**
	 * @name : updateTeamEmblemOk
	 * @date : 2015. 7. 8.
	 * @author : 변형린
	 * @description : 팀 로고 변경 
	 */
	@RequestMapping(value="/teamPage/manageTeamEmblem.do", method=RequestMethod.POST)
	public ModelAndView updateTeamEmblemOk(MultipartHttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		service.updateTeamEmblemOk(mav);
		
		return mav;
	}
	
	
	/**
	 * @name : updateTeamInfo
	 * @date : 2015. 7. 10.
	 * @author : 변형린
	 * @description : 팀 정보 수정 페이지로 이동
	 */
	@RequestMapping(value="/team/updateTeamInfo.do", method=RequestMethod.GET)
	public ModelAndView updateTeamInfo(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		service.updateTeamInfo(mav);
		
		return mav;
	}	
	
	
	/**
	 * @name : updateTeamInfoOk
	 * @date : 2015. 7. 10.
	 * @author : 변형린
	 * @description : 팀 정보 수정 
	 */
	@RequestMapping(value="/team/updateTeamInfoOk.do", method=RequestMethod.POST)
	public ModelAndView updateTeamInfoOk(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		service.updateTeamInfoOk(mav);
		
		return mav;
	}
	/**
	 * @함수명:replyWrite
	 * @작성일:2015. 7. 13.
	 * @작성자:이한빈 
	 * @설명문:팀메인페이지 댓글달기
	 */
	@RequestMapping(value="/replyWrite" , method=RequestMethod.GET)
	public ModelAndView replyWrite(HttpServletRequest request , TeamLogDto teamLog){
		logger.info("TeamController replyWrite");
		ModelAndView mav = new ModelAndView("teamTemplate/teamReplyTemplate");
		mav.addObject("teamLog" , teamLog);
		
		service.replyWrite(mav);
		return mav;
	}
	
	/**
	 * @함수명:replyMoreRead
	 * @작성일:2015. 7. 14.
	 * @작성자:이한빈 
	 * @설명문:팀메인페이지 댓글 더보기 기능.
	 *
	 */
	@RequestMapping(value="/replyMoreRead" , method=RequestMethod.GET)
	public ModelAndView replyMoreRead(HttpServletRequest request){
		logger.info("TeamController replyMoreRead");
		ModelAndView mav = new ModelAndView("teamTemplate/teamReplyReadTemplate");
		mav.addObject("request" , request);
		
		service.replyMoreRead(mav);
		return mav;
	}
	
	@RequestMapping(value="/replyDelete" , method=RequestMethod.GET)
	public ModelAndView replyDelete(HttpServletRequest request){
		logger.info("TeamController replyDelete");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request" , request);
		
		service.replyDelete(mav);
		
		return null;
	}
}
