package com.sml.team.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sml.matching.dto.MatchingDto;
import com.sml.member.dto.MemberDto;
import com.sml.team.dto.ScheduleDto;
import com.sml.team.dto.TeamBoardDto;
import com.sml.team.dto.TeamDto;
import com.sml.team.dto.TeamLogDto;
import com.sml.team.service.TeamService;


@Controller
public class TeamController {
	private Logger logger = Logger.getLogger(TeamController.class.getName());
	@Autowired
	private TeamService service;
	
	/**
	 * @함수명:registerTeam
	 * @작성일:2015. 6. 23.
	 * @작성자:조영석
	 * @설명문:팀등록 페이지로 이동하는 이동 메소드
	 */
	@RequestMapping(value="/member/registerTeam.do",method=RequestMethod.GET)
		public String registerTeam(){
			return "member/registerTeam";
		}

	/**
	 * @함수명:registerTeamOK
	 * @작성일:2015. 6. 23.
	 * @작성자:조영석
	 * @설명문:팀등록을 위한 이동 메소드 
	 */
	@RequestMapping(value="/member/registerTeam.do",method=RequestMethod.POST)
		public ModelAndView registerTeamOK(HttpServletRequest request,HttpServletResponse response){
		
			ModelAndView mav=new ModelAndView();
			mav.addObject("request",request);
			service.registerTeam(mav);
			return mav;
		}

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
	 * 
	 * @함수명 : teamPage
	 * @작성일 : 2015. 6. 23.
	 * @작성자 : 이한빈
	 * @설명   :  스타트페이지에서 메인페이지로 이동하는 메소드
	 */
//	@RequestMapping(value="/teamPage.do" , method=RequestMethod.GET)
//	public String teamPage(HttpServletRequest request){
//		logger.info("TeamController teamPage");
//		return "teamPage/teamPageMain";
//	}
	
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
	 * 
	 * @함수명 : viewTeamBoard
	 * @작성일 : 2015. 6. 23.
	 * @작성자 : 이한빈
	 * @설명   :  팀게시판 보는 메소드 (팀장이랑 비회원 구분은  JSP페이지에서 JSTL로 구분 해야할듯)
	 */
	@RequestMapping(value="/teamPage/viewTeamBoard.do" , method=RequestMethod.GET)
	public ModelAndView viewTeamBoard(HttpServletRequest request){
		logger.info("TeamController viewTeamBoard");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		service.viewTeamBoard(mav);
		
		return mav;
	}
	
	/**
	 * @함수명 : viewSchedule
	 * @작성일 : 2015. 6. 23.
	 * @작성자 : 이한빈
	 * @설명   :  팀스케쥴 보는 메소드 (팀장이랑 비회원 구분은 JSP페이지에서 JSTL로 구분 해야할듯)
	 */
	@RequestMapping(value="/viewSchedule.do" , method=RequestMethod.GET)
	public ModelAndView viewSchedule(){
		logger.info("TeamController viewSchedule");
		ModelAndView mav = new ModelAndView("teamPage/teamSchedule");
		
		service.viewSchedule(mav);
		return mav;
	}
	
	/**
	 * 
	 * @함수명 : gameRecord
	 * @작성일 : 2015. 6. 23.
	 * @작성자 : 이한빈
	 * @설명   : 팀페이지에서 경기기록을 보는 메소드
	 */
	@RequestMapping(value="/viewRecord.do", method=RequestMethod.GET)
	public ModelAndView viewRecord(){
		logger.info("TeamController viewRecord");
		ModelAndView mav = new ModelAndView("teamPage/teamRecord");
		
		service.viewRecord(mav);
		return mav;
	}
		
	/**
	 * 
	 * @함수명 : startMatching
	 * @작성일 : 2015. 6. 23.
	 * @작성자 : 이한빈
	 * @설명   :  매칭관리 페이지이동하는 메소드
	 */
	@RequestMapping(value="/startMatching.do" , method=RequestMethod.GET)
	public String startMatching(){
		logger.info("TeamController startMatching");
		return "teamPage/matching";
	}
	
	
	
	/**
	 * @함수명:teamSchedule
	 * @작성일:2015. 6. 25.
	 * @작성자:조영석
	 * @설명문:스케쥴관리용 달력 jsp페이지 이동 메소드
	 */
	@RequestMapping(value="/teamPage/teamScheduleEdit.do",method=RequestMethod.GET)	
	public ModelAndView teamSchedule(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		service.readteamSchedule(mav);
		return mav;
	}
	
	/**
	 * @함수명:editScheduleView
	 * @작성일:2015. 7. 3.
	 * @작성자:조영석
	 * @설명문:스케쥴 세부일정 페이지 이동 메소드
	 */
	@RequestMapping(value="/teamPage/Schedule.do",method=RequestMethod.GET)
	public ModelAndView editScheduleView(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		service.showSchedule(mav);
		return mav;
	}
	
	/**
	 * @함수명:ScheduleContent
	 * @작성일:2015. 7. 7.
	 * @작성자:조영석
	 * @설명문:스케쥴 내용 이동 메소드 
	 */
	@RequestMapping(value="/teamPage/ScheduleContent.do",method=RequestMethod.GET)
	public ModelAndView ScheduleContent(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		service.scheduleContent(mav);
		return mav;
	}
	/**
	 * @함수명:editSchedule
	 * @작성일:2015. 7. 6
	 * @작성자:조영석
	 * @설명문:스케쥴 일정 입력용 서비스 이동 메소드
	 */
	@RequestMapping(value="/teamPage/editSchedule.do",method=RequestMethod.GET)
	public ModelAndView editSchedule(HttpServletRequest request,HttpServletResponse response,ScheduleDto scheduleDto){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		mav.addObject("scheduleDto",scheduleDto);
		service.editSchedule(mav);
		
		return mav;
	}
	
	/**
	 * @함수명:deleteSchedule
	 * @작성일:2015. 7. 7.
	 * @작성자:조영석
	 * @설명문:스케쥴 삭제 이동 메소드
	 */
	@RequestMapping(value="/teamPage/deleteSchedule.do", method=RequestMethod.GET)
	public ModelAndView deleteSchedule(HttpServletRequest request,HttpServletResponse response){
		System.out.println("deleteScheduledeleteScheduledeleteScheduledeleteScheduledeleteSchedule");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		service.deleteSchedule(mav);
		return mav;
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
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		service.goTeamPage(mav);
		
		return mav;
	}
	
	/**
	 * @name : teamPage
	 * @date : 2015. 6. 25.
	 * @author : 이희재
	 * @description : 팀 멤버를 볼 수 있는 페이지로 이동
	 */
	@RequestMapping(value="/teamPage/teamMemberInfo.do",method=RequestMethod.GET)
	 public ModelAndView teamMemberInfo(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		service.viewTeamMemberInfo(mav);
		
		return mav;
	}
	
	/**
	 * @name : TeamController
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 게시판 읽기 페이지
	 */
	@RequestMapping(value="/teamPage/readTeamBoard.do",method=RequestMethod.GET)
	 public ModelAndView readTeamBoard(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request",request);
		service.readTeamBoard(mav);
		
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
	 * @description : 팀 게시판 공지 쓰기 페이지
	 */
	
	@RequestMapping(value="/teamPage/writeTeamBoard.do",method=RequestMethod.GET)
	 public ModelAndView writeTeamBoard(HttpServletRequest request){
		logger.info("TeamController writeTeamBoard");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		service.writeTeamBoard(mav);
		
		return mav;
	}
	
	/**
	 * @name : TeamController
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 게시판 공지 쓰기 완료 페이지
	 */
	
	@RequestMapping(value="/teamPage/writeTeamBoard.do",method=RequestMethod.POST)
	 public ModelAndView writeTeamBoard(HttpServletRequest request, TeamBoardDto teamBoardDto){
		logger.info("TeamController writeTeamBoard");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("teamBoardDto", teamBoardDto);
		service.writeOkTeamBoard(mav);
		
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
	 * @name : TeamController
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 멤버 관리 페이지
	 */
	
	@RequestMapping(value="/teamPage/manageTeamMember.do",method=RequestMethod.GET)
	 public ModelAndView manageTeamMember(HttpServletRequest request){
		logger.info("TeamController manageTeamMember");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		service.manageTeamMember(mav);
		
		return mav;
	}
	

	/**
	 * @name : TeamController
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 팀원 추가 페이지
	 */
	@RequestMapping(value="/teamPage/addMember.do",method=RequestMethod.POST)
	 public ModelAndView addMember(HttpServletRequest request, MemberDto member){
		logger.info("TeamController addMember");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("member",member);
		mav.addObject("request",request);
		service.addMember(mav);
		
		return mav;
	}
	
	/**
	 * @name : TeamController
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 팀원 삭제 페이지
	 */
	@RequestMapping(value="/teamPage/deleteMember.do",method=RequestMethod.GET)
	 public ModelAndView deleteMember(HttpServletRequest request){
		logger.info("TeamController addMember");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		service.deleteMember(mav);
		
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
	 * @name : TeamLog
	 * @date : 2015. 7. 3.
	 * @author : 정성남
	 * @description : 팀 방명록(LOG)
	 */	
	
	@RequestMapping(value="/teamPage/teamLog.do", method=RequestMethod.GET)
	 public ModelAndView addTeamLog(HttpServletRequest request,TeamLogDto teamLogDto){
		ModelAndView mav=new ModelAndView();		
		mav.addObject("request",request);	
		mav.addObject("teamLogDto",teamLogDto);		
		service.addTeamLog(mav);		
		return mav;
	}
	
	@RequestMapping(value="/teamPage/teamLogDelete.do", method=RequestMethod.GET)
	 public ModelAndView teamLogDelete(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);	
		int replyCode=Integer.parseInt(request.getParameter("replyCode"));		
		System.out.println(replyCode+"replyCode---------");		
		mav.addObject("replyCode",replyCode);
		service.teamLogDelete(mav);		
		return mav;
	}
	
	
	
	
}
