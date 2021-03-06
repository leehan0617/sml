package com.sml.team.service;


import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sml.league.dao.LeagueDao;
import com.sml.league.dto.LeagueDto;
import com.sml.referee.dto.RefereeDto;
import com.sml.team.dao.TeamDao;
import com.sml.team.dto.TeamDto;
import com.sml.team.dto.TeamLogDto;
import com.sml.weather.WeatherDTO;
import com.sml.weather.WeatherParser;


@Service
public class TeamServiceImpl implements TeamService{
	private Logger logger = Logger.getLogger(TeamServiceImpl.class.getName());
	@Autowired
	private TeamDao dao;
	
	@Autowired
	private LeagueDao leagueDao;
	
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
			String teamGrade = team.getTeamGrade();
			String teamId = team.getTeamId();
			String teamName= team.getTeamName();
			String teamLeaderName = team.getTeamLeaderName();
			
			mav.addObject("teamGrade" , teamGrade);
			mav.addObject("teamId" , teamId);
			mav.addObject("teamName" , teamName);
			mav.addObject("teamLeaderName" , teamLeaderName);
			mav.addObject("team",team);
		}
		
		mav.setViewName("teamPage/loginOk");
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
		logger.info("TeamService goTeamPage");
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");	
		String searchTeamName=request.getParameter("searchTeamName");		
		String teamName=request.getParameter("teamName");	
		if(searchTeamName!=null){
			teamName=searchTeamName;
		}
		String pageNumber=request.getParameter("pageNumber");
		
		if(pageNumber==null) pageNumber="1";
		int boardSize=5;		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=dao.getTeamLogCount();
		logger.info("count:"+count);
		logger.info("currentPage"+currentPage);
		logger.info("startRow"+startRow);
		logger.info("endRow"+endRow);
		
		TeamDto team=dao.getTeamInfo(teamName);
		String emblem="";
		List<TeamLogDto> teamLogDtoList=null;
		String getLeagueCode=null;
		LeagueDto leagueDto=null;
		
		if(team!=null){
			int teamCode=team.getTeamCode();
			
			emblem=team.getEmblem();

			if(count>0){
				teamLogDtoList=dao.teamLogDtoList(teamCode,startRow,endRow);
			}		
			getLeagueCode=(leagueDao.getJoinLeagueCode(teamCode));
			
			if(getLeagueCode==null){
				getLeagueCode="0";
			}
			int leagueCode=Integer.parseInt(getLeagueCode);
			

			if(leagueCode>0){
				leagueDto=leagueDao.getLeagueInfo(leagueCode);
			}
		}
		
		//System.out.println("leagueDtoNAme: " + leagueDto.getLeagueName());
		//System.out.println("leagueCode:" + leagueCode);	
		
		
		//날씨 파싱 정보 가져오기		
		ArrayList<WeatherDTO> weatherList=null;
		try {
			WeatherParser weatherParser = new WeatherParser();
			weatherList=weatherParser.xmlRssParser();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		for(WeatherDTO weather:weatherList){
			/*01 맑음
			02 구름 조금
			03 구름 많음
			04 흐림
			05 비
			06 눈/비
			07 눈*/			
			if(weather.getWfKor().equals("맑음")){
				weather.setWfKor("01.png");
			}else if(weather.getWfKor().equals("구름 조금")){
				weather.setWfKor("02.png");
			}else if(weather.getWfKor().equals("구름 많음")){
				weather.setWfKor("03.png");
			}else if(weather.getWfKor().equals("흐림")){
				weather.setWfKor("04.png");
			}else if(weather.getWfKor().equals("비")){
				weather.setWfKor("05.png");
			}else if(weather.getWfKor().equals("눈/비")){
				weather.setWfKor("06.png");
			}else if(weather.getWfKor().equals("눈")){
				weather.setWfKor("07.png");
			}
		}
		
		mav.addObject("weatherList", weatherList);
		mav.addObject("emblem",emblem);
		mav.addObject("count",count);		
		mav.addObject("boardSize",boardSize);
		mav.addObject("currentPage",currentPage);
		mav.addObject("teamLogDtoList",teamLogDtoList);	
		mav.addObject("team",team);
		mav.addObject("startRow",startRow);
		mav.addObject("endRow",endRow);
		mav.addObject("boardSize",boardSize);			
		mav.addObject("teamName" , teamName);
		mav.addObject("leagueDto" , leagueDto);		
		mav.setViewName("team/teamMain");
		}
	
	/**
	 * 
	 * @함수명: viewTeamRecord
	 * @작성일: 2015. 7. 16.
	 * @작성자: 정성남
	 * @설명 : 각 팀의 기록을 출력하기 위한 서비스함수
	 */
	
	@Override
	public void viewTeamRecord(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");		
		String teamName=request.getParameter("teamName");		
		String teamGrade=request.getParameter("teamGrade");
		
		TeamDto team=dao.getTeamInfo(teamName);
		String emblem=team.getEmblem();
		
		int count=dao.getRecordCount(teamName);	// 팀 멤버 전체 수 출력		
		
		String pageNumber=request.getParameter("pageNumber");
		//System.out.println("pageNumber"+pageNumber);
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=5;		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		List<HashMap<String, Object>> recordList = dao.recordList(teamName,startRow,endRow);
		
		//날씨 파싱 정보 가져오기		
		ArrayList<WeatherDTO> weatherList=null;
		try {
			WeatherParser weatherParser = new WeatherParser();
			weatherList=weatherParser.xmlRssParser();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		for(WeatherDTO weather:weatherList){
			/*01 맑음
			02 구름 조금
			03 구름 많음
			04 흐림
			05 비
			06 눈/비
			07 눈*/			
			if(weather.getWfKor().equals("맑음")){
				weather.setWfKor("01.png");
			}else if(weather.getWfKor().equals("구름 조금")){
				weather.setWfKor("02.png");
			}else if(weather.getWfKor().equals("구름 많음")){
				weather.setWfKor("03.png");
			}else if(weather.getWfKor().equals("흐림")){
				weather.setWfKor("04.png");
			}else if(weather.getWfKor().equals("비")){
				weather.setWfKor("05.png");
			}else if(weather.getWfKor().equals("눈/비")){
				weather.setWfKor("06.png");
			}else if(weather.getWfKor().equals("눈")){
				weather.setWfKor("07.png");
			}
		}
		
		mav.addObject("weatherList", weatherList);
		mav.addObject("team", team);
		mav.addObject("emblem",emblem);
		mav.addObject("teamGrade",teamGrade);		
		mav.addObject("teamName",teamName);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);		
		mav.addObject("currentPage",currentPage);
		mav.addObject("recordList" , recordList);
		mav.setViewName("teamPage/teamRecord");
	}
	
	/**
	 * @함수명: searchRecord
	 * @작성일: 2015. 7. 16.
	 * @작성자: 정성남
	 * @설명 : 검색을 통해 팀 별 기록을 출력하기 위한 함수
	 */
	@Override
	public void searchRecord(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String searchBoxName=request.getParameter("searchBoxName");
		
		String teamName=request.getParameter("teamName");		
		int count=dao.getRecordCount(searchBoxName);
		// 팀 멤버 전체 수 출력		
		
		String pageNumber=request.getParameter("pageNumber");
		System.out.println("pageNumber"+pageNumber);
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=5;		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		List<HashMap<String, Object>> recordList = dao.searchRecordList(searchBoxName,startRow,endRow);		
		
		//System.out.println("recordList:"+recordList);	
		
		mav.addObject("searchBoxName",searchBoxName);		
		mav.addObject("teamName",teamName);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);		
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
	 * @name : changeTeamEmblem
	 * @date : 2015. 7. 7.
	 * @author : 변형린
	 * @description : 팀 로고 변경 페이지로 이동
	 */
	@Override
	public void updateTeamEmblem(ModelAndView mav) {
		HashMap<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		System.out.println("updateEmblem: "+ teamName);
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
		//String timeName=Long.toString(System.currentTimeMillis()) + "_" +  fileName ;
		long fileSize=upFile.getSize();
	
		if(fileSize!=0){
			try{
				//절대경로
				//String dir="C:\\Users\\kosta\\git\\sml\\src\\main\\webapp\\img\\teamImg";
				//상대경로				
//				String dir=request.getSession().getServletContext().getRealPath("/img/teamImg");
//				/Users/ihanbin/Documents/stsworkspace/smlProject/src/main/webapp/img
				String dir="/Users/ihanbin/Documents/stsworkspace/smlProject/src/main/webapp/img/teamImg";
				File file=new File(dir, fileName);			
				
				upFile.transferTo(file);
				
				teamDto.setPath(file.getAbsolutePath());
				teamDto.setEmblem(fileName);				
			}catch(Exception e){
				logger.info("파일 입출력 에러:" + e);
			}
			
			TeamDto prevTeamDto=dao.getTeamInfo(teamName);
			if(prevTeamDto.getPath()!=null){				
				File file=new File(prevTeamDto.getPath());
				if(file.exists() && file.isFile()) file.delete();
			}					
		}
		
		int check=dao.updateTeamEmblem(teamDto);
		logger.info("check:" + check);
		
		mav.addObject("teamName",teamName);
		mav.addObject("check", check);
		mav.setViewName("teamPage/updateTeamEmblemOk");
	}
	
	
	/**
	 * @name : updateTeamInfo
	 * @date : 2015. 7. 10.
	 * @author : 변형린
	 * @description : 팀 정보 수정 페이지로 이동
	 */
	@Override
	public void updateTeamInfo(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		TeamDto teamDto=dao.getTeamInfo(teamName);
		//팀 홈그라운드 가져오기
		String homeGround=dao.getTeamGround(teamDto.getTeamCode());
		if(homeGround==null){
			homeGround="연고지 없음";
		}
		
		mav.addObject("homeGround",homeGround);
		mav.addObject("teamDto",teamDto);
		mav.setViewName("member/updateTeam");
		
	}

	@Override
	public void updateTeamInfoOk(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String homeGround=request.getParameter("homeGround");
		String teamPassword=request.getParameter("teamPassword");
		String teamName=request.getParameter("teamName");
		String sportType=request.getParameter("sportType");
				
		TeamDto teamDto=dao.getTeamInfo(teamName);
		int checkHome=dao.updateHomeGround(homeGround, teamDto.getTeamCode());		
		System.out.println(checkHome);		
			
		int checkTeam=dao.updateTeamInfo(teamPassword, teamName, sportType, teamDto.getTeamCode());		
		System.out.println(checkTeam);
		
		mav.addObject("check",checkHome*checkTeam);
		mav.addObject("teamName", teamDto.getTeamName());
		mav.setViewName("member/updateTeamOk");
		
	}
	/**
	 * 
	 * @함수명:replyWrite
	 * @작성일:2015. 7. 23.
	 * @작성자:이한빈 
	 * @설명문:댓글쓰는기능 
	 */
	@Override
	public void replyWrite(ModelAndView mav) {
		Map<String , Object> map = mav.getModelMap();
		TeamLogDto teamLog = (TeamLogDto) map.get("teamLog");
		teamLog.setReplyDate(new Date());
		int check = dao.replyWrite(teamLog);
		mav.addObject("teamLog" , teamLog);
		System.out.println("check : " + check);
	}
	/**
	 * 
	 * @함수명:getReplyList
	 * @작성일:2015. 7. 23.
	 * @작성자:이한빈 
	 * @설명문:댓글리스트 가져오는 기능
	 */
	@Override
	public void getReplyList(ModelAndView mav) {
		Map<String , Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String teamName = request.getParameter("teamName");
		
		List<TeamLogDto> replyList = dao.getReplyList(teamName);
		//System.out.println(replyList.size());
		mav.addObject("replyList" ,replyList);
	}
	/**
	 * 
	 * @함수명:replyMoreRead
	 * @작성일:2015. 7. 23.
	 * @작성자:이한빈 
	 * @설명문:댓글 더보기 기
	 */
	@Override
	public void replyMoreRead(ModelAndView mav) {
		Map<String , Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int teamCode = Integer.parseInt(request.getParameter("teamCode"));
		String pageNumber = request.getParameter("replyPageNumber");
		
		if(pageNumber.equals("")) pageNumber = "1";
		
		int pn = Integer.parseInt(pageNumber);
		mav.addObject("replyPageNumber" , pn+1);
		mav.addObject("teamCode" , teamCode);
		
		List<TeamLogDto> replyList = dao.getMoreReplyList(teamCode , pn*5);
		mav.addObject("replyList" , replyList);
	}
	/**
	 * 
	 * @함수명:replyDelete
	 * @작성일:2015. 7. 23.
	 * @작성자:이한빈 
	 * @설명문:댓글 삭제기능
	 */
	@Override
	public void replyDelete(ModelAndView mav) {
		logger.info("TeamService replyDelete");
		Map<String ,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int teamCode = Integer.parseInt(request.getParameter("teamCode"));
		int replyCode = Integer.parseInt(request.getParameter("replyCode"));
		
		int check = dao.replyDelete(teamCode,replyCode);
		mav.addObject("check" , check);
	}
	/**
	 * 
	 * @함수명:editTeamIntro
	 * @작성일:2015. 7. 23.
	 * @작성자:이한빈 
	 * @설명문:팀소개 변경 메소드 
	 */
	@Override
	public ModelAndView editTeamIntro(HttpServletRequest request) {
		logger.info("TeamService editTeamIntro");
		int teamCode = Integer.parseInt(request.getParameter("teamCode"));
		String teamIntro = request.getParameter("teamIntro");
		ModelAndView mav = new ModelAndView();
		
		dao.editTeamIntro(teamCode,teamIntro);
		
		mav.addObject("teamIntro" , teamIntro);
		mav.setViewName("jsonView");
		return mav;
	}



}
