package com.sml.team.service;


import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import java.util.logging.Logger;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sml.member.dto.MemberDto;
import com.sml.team.dao.TeamDao;
import com.sml.team.dto.MatchingDto;
import com.sml.team.dto.ScheduleDto;
import com.sml.team.dto.TeamBoardDto;
import com.sml.team.dto.TeamDto;
import com.sml.team.dto.TeamLogDto;


@Service
public class TeamServiceImpl implements TeamService{
	private Logger logger = Logger.getLogger(TeamServiceImpl.class.getName());
	@Autowired
	private TeamDao dao;
	

	/**
	 * @함수명:registerTeam
	 * @작성일:2015. 6. 23.
	 * @작성자:조영석
	 * @설명문:팀만들기를 위한 서비스메소드
	 */
	@Override
	public void registerTeam(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String teamId=request.getParameter("teamId");
		String teamPassword=request.getParameter("teamPassword");
		String teamName=request.getParameter("teamName");
		String sportType=request.getParameter("sportType");
		String homeGround=request.getParameter("homeGround");
		
		mav.addObject("teamId",teamId);
		mav.addObject("teamPassword",teamPassword);
		mav.addObject("teamName",teamName);
		mav.addObject("sportType",sportType);
		mav.addObject("homeGround", homeGround);
		mav.setViewName("member/registerMember");
		}
	
	/**
	 * @함수명:idCheck
	 * @작성일:2015. 6. 23.
	 * @작성자:조영석
	 * @설명문:아이디 중복체크를 위한 서비스메소드
	 */
	@Override
	public void idCheck(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String teamId=request.getParameter("teamId");
		
		String check=dao.idCheck(teamId);
		
		mav.addObject("teamId",teamId);
		mav.addObject("check",check);
		mav.setViewName("member/idCheck");
		
	}

	/**
	 * @함수명:teamIdCheck
	 * @작성일:2015. 6. 23.
	 * @작성자:조영석
	 * @설명문:팀이름 중복체크를 위한 서비스메소드
	 */
	@Override
	public void teamIdCheck(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String teamName=request.getParameter("teamName");
		
		String teamCheck=dao.teamIdCheck(teamName);
		
		mav.addObject("teamName",teamName);
		mav.addObject("teamCheck",teamCheck);
		mav.setViewName("member/teamIdCheck");
	}
	

	/**
	 * @함수명:login
	 * @작성일:2015. 6. 25.
	 * @작성자:조영석
	 * @설명문:로그인 을위한 서비스 메소드
	 */
	public void login(ModelAndView mav) {
		logger.info("Service Login");
		
		Map<String , Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		TeamDto team = dao.login(id,password);
		
		if(team!=null){
			System.out.println("teamteamteamteamteam!!!"+team);
			String teamGrade = team.getTeamGrade();
			String teamId = team.getTeamId();
			String teamName= team.getTeamName();
			
			mav.addObject("teamGrade" , teamGrade);
			mav.addObject("teamId" , teamId);
			mav.addObject("teamName" , teamName);
		}
		
		mav.setViewName("teamPage/loginOk");
	}

	@Override
	/**
	 * 
	 * @함수명 : viewSchedule
	 * @작성일 : 2015. 6. 25.
	 * @작성자 : 이희재
	 * @설명   : 팀 게시판에서 팀 공지사항 보기
	 */
	public void viewTeamBoard(ModelAndView mav) {
		logger.info("Service viewTeamBoard");
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		System.out.println(teamName);
		
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
		System.out.println(teamBoardList.size());
		
		mav.addObject("blockCount", blockCount);
		mav.addObject("teamName",teamName);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("blockSize", blockSize);
		mav.addObject("currentPage",currentPage);
		mav.addObject("teamBoardList" , teamBoardList);
		mav.setViewName("teamPage/teamBoard");
	}
	
	@Override
	/**
	 * 
	 * @함수명 : viewSchedule
	 * @작성일 : 2015. 6. 23.
	 * @작성자 : 이한빈
	 * @설명   : 팀컨트롤러에서 팀스케쥴보기 요청이 오면 실행되는 메소드
	 */
	public void viewSchedule(ModelAndView mav) {
		logger.info("Service viewSchedule");
		
		List<ScheduleDto> scheduleList = dao.viewSchedule();
		mav.addObject("scheduleList" , scheduleList);
	}

	@Override
	/**
	 * 
	 * @함수명 : viewRecord
	 * @작성일 : 2015. 6. 23.
	 * @작성자 : 이한빈
	 * @설명   : 희재가 기록에 관한 패키지 만든후에 만들기로함 
	 */
	public void viewRecord(ModelAndView mav) {
		logger.info("Service viewRecord");
	}

	/**
	 * @name : teamPage
	 * @date : 2015. 6. 25.
	 * @author : 이희재
	 * @description : 팀 페이지로 이동하는 함수
	 * 					팀 명에 따라 페이지가 달라지는 함수
	 */
	@Override
	public void goTeamPage(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		logger.info(request.getParameter("teamName"));
		TeamDto team=dao.getTeamInfo(teamName);
		
		int teamCode=team.getTeamCode();				
		List<TeamLogDto> teamLogDtoList=dao.teamLogDtoList(teamCode);
		
		mav.addObject("teamLogDtoList",teamLogDtoList);	
		mav.addObject("team",team);
		mav.setViewName("team/teamMain");
	}

	/**
	 * @name : teamPage
	 * @date : 2015. 6. 25.
	 * @author : 이희재
	 * @description : 팀 멤버 페이지를 볼 수 있는 함수
	 */
	@Override
	public void viewTeamMemberInfo(ModelAndView mav) {
		logger.info("Service manageTeamMember");
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		
		int count=dao.getTeamMemberCount(teamName);
		// 팀 멤버 전체 수 출력
		
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
		
		List<MemberDto> teamMemberList = dao.getTeamMemberList(teamName,startRow,endRow);
		
		mav.addObject("blockCount", blockCount);
		mav.addObject("teamName",teamName);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("blockSize", blockSize);
		mav.addObject("currentPage",currentPage);
		mav.addObject("teamMemberList" , teamMemberList);
		mav.setViewName("teamPage/teamMemberInfo");
	}

	/**
	 * @name : teamPage
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 게시판 읽기 함수
	 */
	@Override
	public void readTeamBoard(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String teamName=request.getParameter("teamName");
		int currentPage=Integer.parseInt(request.getParameter("currentPage"));
		int boardNumber=Integer.parseInt(request.getParameter("boardNumber"));
		
		TeamBoardDto board=dao.getBoardDto(boardNumber);
		
		mav.addObject("board",board);
		mav.addObject("teamName", teamName);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("teamPage/readTeamBoard");
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
		mav.setViewName("teamPage/manageTeamBoard");
	}

	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 게시판에서 공지 쓰기
	 */
	@Override
	public void writeTeamBoard(ModelAndView mav) {
		logger.info("Service viewTeamBoard");
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		int currentPage=Integer.parseInt(request.getParameter("currentPage"));
		TeamDto dto=dao.getTeamInfo(teamName);
		
		mav.addObject("writer",dto.getTeamLeaderName());
		mav.addObject("teamName",teamName);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("teamPage/writeTeamBoard");
	}
	
	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 게시판에서 공지 쓰기 완료
	 */
	@Override
	public void writeOkTeamBoard(ModelAndView mav) {
		logger.info("Service writeOkTeamBoard");
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		int currentPage=Integer.parseInt(request.getParameter("currentPage"));
		
		int teamCode=dao.getTeamInfo(teamName).getTeamCode();
		
		TeamBoardDto board=(TeamBoardDto) map.get("teamBoardDto");
		board.setTeamCode(teamCode);
		board.setBoardDate(new Date());
		int value=dao.writeTeamBoard(board);
		System.out.println(value);
		
		mav.addObject("writeValue",value);
		mav.addObject("teamName",teamName);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("teamPage/okTeamBoard");
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
		mav.setViewName("teamPage/okTeamBoard");
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
		mav.setViewName("teamPage/writeTeamBoard");
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
		mav.setViewName("teamPage/okTeamBoard");
	}

	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 6. 26.
	 * @author : 이희재
	 * @description : 팀 멤버 페이지로 이동
	 */
	
	@Override
	public void manageTeamMember(ModelAndView mav) {
		logger.info("Service manageTeamMember");
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		
		int count=dao.getTeamMemberCount(teamName);
		// 팀 멤버 전체 수 출력
		
		int boardSize=3;
		// 한 블록 당 출력될 멤버 수
		
		int blockSize=2;
		// 한 페이지당 들어갈 블록
		
		int currentPage=1;
		if(request.getParameter("currentPage")!=null){
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int blockCount=count/boardSize + (count%boardSize==0? 0:1);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=startRow+boardSize-1;
		
		List<MemberDto> teamMemberList = dao.getTeamMemberList(teamName,startRow,endRow);
		// 팀 멤버 해당 순으로 가져오기
		
		mav.addObject("blockCount", blockCount);
		mav.addObject("teamName",teamName);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("blockSize", blockSize);
		mav.addObject("currentPage",currentPage);
		mav.addObject("teamMemberList" , teamMemberList);
		mav.setViewName("teamPage/manageTeamMember");
	}

	
	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 팀 멤버 페이지로 이동
	 */
	
	@Override
	public void addMember(ModelAndView mav) {
		HashMap<String, Object> hMap=mav.getModelMap();
		MemberDto member=(MemberDto) hMap.get("member");
		HttpServletRequest request=(HttpServletRequest) hMap.get("request");
		int currentPage=Integer.parseInt(request.getParameter("currentPage"));
		String teamName=request.getParameter("teamName");
		
		int teamCode=dao.getTeamInfo(teamName).getTeamCode();
		int memberValue=dao.addMember(member,teamCode);
		
		mav.addObject("currentPage",currentPage);
		mav.addObject("memberValue",memberValue);
		mav.setViewName("teamPage/okTeamBoard");
	}

	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 팀 멤버 삭제 서비스
	 */
	@Override
	public void deleteMember(ModelAndView mav) {
		HashMap<String, Object> hMap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hMap.get("request");
		int currentPage=Integer.parseInt(request.getParameter("currentPage"));
		int memberCode=Integer.parseInt(request.getParameter("memberCode"));
		
		int deleteValue=dao.deleteMember(memberCode);
		
		mav.addObject("currentPage",currentPage);
		mav.addObject("deleteMemberValue",deleteValue);
		mav.setViewName("teamPage/okTeamBoard");
	}

	
	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 팀 기록 출력하기
	 */
	@Override
	public void viewTeamRecord(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		
		int count=dao.getRecordCount(teamName);
		// 팀 멤버 전체 수 출력
		
		int boardSize=5;
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
		
		List<HashMap<String, Object>> recordList = dao.recordList(teamName,startRow,endRow);
		
		mav.addObject("blockCount", blockCount);
		mav.addObject("teamName",teamName);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("blockSize", blockSize);
		mav.addObject("currentPage",currentPage);
		mav.addObject("recordList" , recordList);
		mav.setViewName("teamPage/teamRecord");
	}

	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 멤버 등록을 위한 지역 추출
	 */
	@Override
	public void searchRegion(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String sido=null;
		List<String> list=null;
		if(request.getParameter("sido")==null){
			list=dao.getSidoList();
		}else{
			sido=request.getParameter("sido");
			list=dao.getGugunList(sido);
		}
		
		mav.addObject("list",list);
		mav.setViewName("member/regionOption");
	}

	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 매칭을 위한 페이지 이동
	 */
	
	@Override
	public void matching(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		int teamCode=dao.getTeamInfo(teamName).getTeamCode();
		
		MatchingDto matchingDto=dao.getTeamMatchingInfo(teamCode);
		
		if(matchingDto==null){
			String homeGround=dao.getTeamGround(teamCode);
			
			mav.addObject("teamCode", teamCode);
			mav.addObject("homeGround", homeGround);
			mav.addObject("teamName",teamName);
			mav.setViewName("teamPage/matching");
		}else if(matchingDto!=null){
			mav.addObject("matchingDto", matchingDto);
			mav.addObject("teamCode", teamCode);
			mav.addObject("teamName",teamName);
			mav.setViewName("teamPage/matching");
		}
		
	}
	
	
	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 7. 6.
	 * @author : 이희재
	 * @description : 매칭과 동시에 매칭 정보를 매칭 테이블에 입력.
	 */
	@Override
	public void searchMatching(ModelAndView mav) {
		Map<String , Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MatchingDto matchingDto = (MatchingDto) map.get("matchingDto");
		String teamName=request.getParameter("teamName");
		
		matchingDto.setMatchingSport(dao.getTeamInfo(teamName).getSportType());
		matchingDto.setMatchingState("전");
//		System.out.println(matchingDto.getMatchingLatlng());
		
		int check = dao.searchMatching(matchingDto);
		mav.addObject("teamName",teamName);
		mav.addObject("matchingCheck" , check);
		mav.setViewName("teamPage/okTeamBoard");
	}

	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 7. 6.
	 * @author : 이희재
	 * @description : 해당 매칭 정보 삭제
	 */
	@Override
	public void deleteMatching(ModelAndView mav) {
		Map<String , Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		int matchingCode=Integer.parseInt(request.getParameter("matchingCode"));
		
		int matchingDelete=dao.deleteMatching(matchingCode);
		
		mav.addObject("teamName", teamName);
		mav.addObject("matchingDelete",matchingDelete);
		mav.setViewName("teamPage/okTeamBoard");
	}

	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 7. 6.
	 * @author : 이희재
	 * @description : 매칭 정보를 기반으로 서칭하기
	 */
	@Override
	public void searching(ModelAndView mav) {
		Map<String , Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int teamCode=Integer.parseInt(request.getParameter("teamCode"));
//		System.out.println(teamCode);
//		for(int i=0; i<3;i++){
//			System.out.println(i);
//			try {
//				Thread.sleep(5000);
//			} catch (InterruptedException e) {
//				
//				e.printStackTrace();
//			}
//		}
		
		matchingTeam(teamCode);
		int check=1;
		mav.addObject("check",check);
		mav.addObject("teamCode", teamCode);
		mav.setViewName("teamPage/matchingResult");
	}
	
	/**
	 * @name : matchingDistance
	 * @date : 2015. 7. 7.
	 * @author : 이희재
	 * @description : teamCode를 이용하여 자신의 matching 정보와 다른 팀 매칭 정보와 비교하여 매칭하는 함수
	 */
	public void matchingTeam(int teamCode){		
		MatchingDto myMatchingDto=dao.getTeamMatchingInfo(teamCode);
		List<MatchingDto> otherMatchingInfo=dao.getOtherMatchingInfo(teamCode,myMatchingDto.getMatchingSport());
		HashMap<Integer, Integer> resultMap=new HashMap<Integer, Integer>();
		
		if(otherMatchingInfo!=null){
			for(int i=0;i<otherMatchingInfo.size();i++){
				int myDistance=myMatchingDto.getMatchingDistance();
				int otherDistance=otherMatchingInfo.get(i).getMatchingDistance();
				
				int distance=calcDistance(myMatchingDto,otherMatchingInfo.get(i));
				// 두 매칭 지역간의 거리를 비교 한다.
				
				String matchingDay=compareDay(myMatchingDto,otherMatchingInfo.get(i));
				// 두 매칭 정보간의 요일 정보를 비교 (공통 부분 출력)
				
				String matchingTime=compareTime(myMatchingDto,otherMatchingInfo.get(i));
				// 두 매칭 정보간의 시간 정보 비교 (공통 부분 출력)
				
				if((distance<myDistance+otherDistance)&&(!matchingDay.equals(""))&&(!matchingTime.equals(""))){
					resultMap.put(i, distance);
				}
				// 매칭이 가능한 상태인 정보들을 hashMap에 거리와 인덱스를 저장.
				
				System.out.println("매칭 코드 : " + otherMatchingInfo.get(i).getMatchingCode());
				System.out.println("실제 측정 거리 : " +distance);
				System.out.println("매칭 거리 : "+ (myDistance + otherDistance));
				System.out.println("매칭 요일 : " + matchingDay);
				System.out.println("매칭 시간 : " + matchingTime);
				System.out.println();
			}
		}
		
		int resultIdx=getResultIdx(resultMap);
	}
	
	/**
	 * @name : calcDistance
	 * @date : 2015. 7. 7.
	 * @author : 이희재
	 * @description : 위도와 경도를 이용한 거리 측정 함수 
	 */
	public int calcDistance(MatchingDto myMatchingDto,MatchingDto otherMatchingInfo){
		
		StringTokenizer myToken=new StringTokenizer(myMatchingDto.getMatchingLatlng(),",");
		double myLat=Double.parseDouble(myToken.nextToken());
		double myLng=Double.parseDouble(myToken.nextToken());
		
		String latLng=otherMatchingInfo.getMatchingLatlng();
		StringTokenizer token=new StringTokenizer(latLng,",");
		
		double otherLat=Double.parseDouble(token.nextToken());
		double otherLng=Double.parseDouble(token.nextToken());
		
		int result=(int) (Math.sqrt(Math.pow(otherLat-myLat,2)+Math.pow(otherLng-myLng, 2))*100000);
		return result;
	}
	
	/**
	 * @name : compareDay
	 * @date : 2015. 7. 8.
	 * @author : 이희재
	 * @description : 두 매칭 정보간의 요일을 비교한다.
	 */
	public String compareDay(MatchingDto myMatchingDto,MatchingDto otherMatchingInfo){
		StringTokenizer myToken=new StringTokenizer(myMatchingDto.getMatchingTime(),",");
		String otherTime=otherMatchingInfo.getMatchingTime();
		String result="";
		while(myToken.hasMoreTokens()){
			String temp=myToken.nextToken();
			if(otherTime!=null){
				if(otherTime.contains(temp)){
					result+=temp + ",";
				}
			}
		}
		return result;
	}
	
	/**
	 * @name : compareTime
	 * @date : 2015. 7. 8.
	 * @author : 이희재
	 * @description : 두 매칭 정보간의 시간 정보를 비교한다.
	 */
	public String compareTime(MatchingDto myMatchingDto,MatchingDto otherMatchingInfo){
		StringTokenizer myToken=new StringTokenizer(myMatchingDto.getMatchingDay(),",");
		String otherDay=otherMatchingInfo.getMatchingDay();
		String result="";
		while(myToken.hasMoreTokens()){
			String temp=myToken.nextToken();
			if(otherDay!=null){
				if(otherDay.contains(temp)){
					result+=temp + ",";
				}
			}
		}
		return result;
	}
	
	/**
	 * @name : getResultIdx
	 * @date : 2015. 7. 8.
	 * @author : 이희재
	 * @description : index인 key값을 이용하여 value인 거리를 출력하고 최소의 거리를 이용하여 해당 key값을 반환
	 */
	public int getResultIdx(HashMap<Integer, Integer> resultMap){
		Set<Integer> keySet=resultMap.keySet();
		Iterator<Integer> iter=keySet.iterator();
		int key=0;
		int tempDistance=-1;
		while(iter.hasNext()){
			int tempKey=iter.next();
//			System.out.println(key + ","+resultMap.get(key));
			if(tempDistance==-1){
				tempDistance=resultMap.get(tempKey);
				key=tempKey;
			}else{
				if(tempDistance>resultMap.get(tempKey)){
					tempDistance=resultMap.get(tempKey);
					key=tempKey;
				}
			}
		}
//		System.out.println("매칭 키 : " + key);
//		System.out.println("tempDistance : "+ tempDistance);
//		System.out.println("매칭 될 거리 : " + resultMap.get(key));
		return key;
	}
	
	/**
	 * @name : changeTeamEmblem
	 * @date : 2015. 7. 7.
	 * @author : 변형린
	 * @description : 팀 로고 변경
	 */
	@Override
	public void updateTeamEmblem(ModelAndView mav) {
		HashMap<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		logger.info("teamName : " + teamName);
		TeamDto team=dao.getTeamInfo(teamName);
		
		mav.addObject("team", team);
		mav.setViewName("teamPage/updateTeamEmblem");
	}

	/**
	 * @name : updateTeamEmblemOk
	 * @date : 2015. 7. 7.
	 * @author : 변형린
	 * @description : 팀 로고 변경 OK
	 */
	@Override
	public void updateTeamEmblemOk(ModelAndView mav) {
		HashMap<String, Object> hMap=mav.getModelMap();
		MultipartHttpServletRequest request=(MultipartHttpServletRequest)hMap.get("request");
		
		String teamName=request.getParameter("teamName");
		TeamDto teamDto=dao.getTeamInfo(teamName);
		logger.info("teamName2345 : " + teamName);
		MultipartFile upFile=request.getFile("teamImage");		
		
		String fileName=upFile.getOriginalFilename();
		String timeName=Long.toString(System.currentTimeMillis()) + "_" +  fileName ;
		long fileSize=upFile.getSize();
	
		if(fileSize!=0){
			try{
				//절대경로
				String dir="C:\\Users\\kosta\\git\\sml\\src\\main\\webapp\\img\\teamImg";
				//상대경로				
				//String dir=request.getSession().getServletContext().getRealPath("/fileUp");
				
				File file=new File(dir, timeName);			
				
				upFile.transferTo(file);
				
				teamDto.setPath(file.getAbsolutePath());
				teamDto.setEmblem(timeName);				
			}catch(Exception e){
				logger.info("파일 입출력 에러:" + e);
			}
			
			TeamDto prevTeamDto=dao.getTeamInfo(teamName);
			if(prevTeamDto.getEmblem()!=null){
				File file=new File(prevTeamDto.getPath());
				if(file.exists() && file.isFile()) file.delete();
			}					
		}
		
		int check=dao.updateTeamEmblem(teamDto);
		logger.info("check:" + check);
		
		mav.addObject("check", check);
		mav.setViewName("teamPage/teamPageMain");
	}
	
	/**
	 * @함수명: addTeamLog
	 * @작성일: 2015. 7. 7.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public void addTeamLog(ModelAndView mav) {
		logger.info("TeamLog-SErvice");
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		TeamLogDto teamLogDto=(TeamLogDto) map.get("teamLogDto");
		String teamName=request.getParameter("teamName");		
		//System.out.println("teamName:"+teamName);
		
		int teamCode=dao.selectTeamCode(teamName);
		
		teamLogDto.setReplyDate(new Date());
		teamLogDto.setTeamCode(teamCode);
		
		String replyNickName=request.getParameter("replyNickName");
		String replyContent=request.getParameter("replyContent");
		String replyPassword=request.getParameter("replyPassword");
		
		int check=dao.addTeamLog(teamLogDto);		
		int replyCode=teamLogDto.getReplyCode();
		//System.out.println("replyCodeWrite:"+replyCode);		
		
		mav.addObject("replyCode",replyCode);
		mav.addObject("teamName",teamName);
		mav.addObject("replyNickName",replyNickName);
		mav.addObject("replyPassword",replyPassword);		
		mav.addObject("replyContent",replyContent);
		
		if(check>0){
			logger.info("작성완료");
		}		
		mav.setViewName("team/teamMain");
	}
	/**
	 * @함수명: teamLogDelete
	 * @작성일: 2015. 7. 7.
	 * @작성자: 정성남
	 * @설명 :
	 */
	
	@Override
	public void teamLogDelete(ModelAndView mav) {
		logger.info("teamLogDelete-SErvice");
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		
		String replyPassword=request.getParameter("replyPassword");		
		//System.out.println("replyPassword:"+replyPassword);		
		int replyCode=Integer.parseInt(request.getParameter("replyCode"));		
		//System.out.println("replyCodeService:"+replyCode);		
		int check=dao.teamLogDelete(replyPassword,replyCode);		
		
		if(check>0){
			logger.info("삭제완료");
		}		
		mav.addObject("replyCode",replyCode);
		mav.addObject("replyPassword",replyPassword);
		mav.setViewName("team/teamMain");
	}
	
	/**
	 * @함수명:readteamSchedule
	 * @작성일:2015. 7. 6.
	 * @작성자:조영석
	 * @설명문:스케쥴 일정 계시용 메소드
	 */
	@Override
	public void readteamSchedule(ModelAndView mav) {
		Map<String , Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		List<ScheduleDto> scheduleDtoList=null;
		String teamName=request.getParameter("teamName");
		int count=dao.readCount(teamName);
		if(count>0){
			scheduleDtoList=dao.readSchedule(teamName); 
		}
		
		JSONArray jsonArray=JSONArray.fromObject(scheduleDtoList);
//		System.out.println("scheduleDtoList:"+jsonArray);
		
		Map<String,Object> Map=new HashMap<String,Object>();
		Map.put("scheduleDtoList", jsonArray);
		
		JSONObject jsonObject=JSONObject.fromObject(Map);
//		System.out.println("json-"+jsonObject);
		
		mav.addObject("jsonObject",jsonObject);
		mav.addObject("teamName",teamName);
		mav.setViewName("teamPage/teamSchedule");
	}
	
	/**
	 * @함수명:editSchedule
	 * @작성일:2015. 7. 6.
	 * @작성자:조영석
	 * @설명문:스케쥴일정 입력 데이터처리를 위한 메소드 
	 */
	@Override
	public void editSchedule(ModelAndView mav) {
		Map<String , Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		ScheduleDto scheduleDto=(ScheduleDto)map.get("scheduleDto");
		String teamId=request.getParameter("teamId");
		
		int check=dao.editSchedule(scheduleDto,teamId);
		
		
		mav.addObject("check",check);
		mav.setViewName("teamPage/teamSchedule");
	}
	/**
	 * @함수명:showSchedule
	 * @작성일:2015. 7. 3.
	 * @작성자:조영석
	 * @설명문:스케쥴 세부일정 열람을 위한 서비스 메소드
	 */
	@Override
	public void showSchedule(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamId=request.getParameter("teamId");
		
		mav.setViewName("teamPage/editSchedule");
		
	}
	
	/**
	 * @함수명:scheduleContent
	 * @작성일:2015. 7. 7.
	 * @작성자:조영석
	 * @설명문:세부일정의 해당 내용 을 보기위한 메소드  
	 */
	@Override
	public void scheduleContent(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");

		int scheduleNumber=Integer.parseInt(request.getParameter("scheduleNumber"));
		ScheduleDto scheduleDto=dao.scheduleContents(scheduleNumber);
		
		TeamDto teamDto=new TeamDto();
		if(scheduleDto!=null){
			teamDto=dao.selectMember(scheduleNumber);
		}
		mav.addObject("scheduleDto",scheduleDto);
		mav.addObject("teamDto",teamDto);
		mav.setViewName("teamPage/ScheduleContent");
	}

	/**
	 * @함수명:deleteSchedule
	 * @작성일:2015. 7. 7.
	 * @작성자:조영석
	 * @설명문:스케쥴 삭제용 서비스 메소드
	 */
	@Override
	public void deleteSchedule(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int scheduleNumber=Integer.parseInt(request.getParameter("scheduleNumber"));
		int check=dao.deleteSchedule(scheduleNumber);	

		mav.addObject("check",check);
		mav.setViewName("teamPage/ScheduleContent");
	}
}
