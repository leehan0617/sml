package com.sml.admin.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sml.admin.dao.AdminDao;
import com.sml.league.dto.LeagueDto;
import com.sml.member.dto.MemberDto;
import com.sml.referee.dto.RefereeDto;
import com.sml.team.dto.TeamDto;

@Component
public class AdminServiceImpl implements AdminService{
	final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private AdminDao adminDao;
	
	/**
	 * @name : AdminServiceImpl
	 * @date : 2015. 6. 26.
	 * @author : 정성남
	 * @description : 팀 관리 페이지
	 */
	
	@Override	
	public void manageTeam(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=5;		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=adminDao.getManageTeamCount();
		logger.info("count:"+count);
		logger.info("currentPage"+currentPage);
		logger.info("startRow"+startRow);
		logger.info("endRow"+endRow);		
		
		List<TeamDto> manageTeamList=null;	
		List<MemberDto> manageMemberList=null;	
		HashMap<String,Object> manageMap=new HashMap<String,Object>();
		manageMap.put("manageTeamList", manageTeamList);
		manageMap.put("manageMemberList", manageMemberList);
		manageMap.put("startRow", startRow);
		manageMap.put("endRow", endRow);
		
		List<HashMap<String,Object>> containerList=new ArrayList<HashMap<String,Object>>();
		containerList.add(manageMap);
		
		containerList=adminDao.getManageTeam(startRow,endRow);
			
		mav.addObject("containerList",containerList);
		mav.addObject("manageMap",manageMap);		
		mav.addObject("count",count);		
		mav.addObject("boardSize",boardSize);
		mav.addObject("currentPage",currentPage);
		mav.setViewName("admin/manageTeam");
	}

	/**
	 * @name : AdminServiceImpl
	 * @date : 2015. 6. 26.
	 * @author : 정성남
	 * @description : 팀 삭제 기능 하는 함수
	 */
	
	@Override
	public void manageTeamDelete(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int teamCode=Integer.parseInt(request.getParameter("teamCode"));
		int check=adminDao.manageTeamDelete(teamCode);
		
		mav.addObject("check",check);
		mav.setViewName("admin/manageTeamDelete");
	}

	
	/**
	 * @name : manageReferee
	 * @date : 2015. 6. 25.
	 * @author : 변형린
	 * @description : 심판 관리 페이지 이동
	 */
	@Override
	public void manageReferee(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null)pageNumber="1";
		
		int boardSize=10;
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=adminDao.refereeCount();
		logger.info("count:" + count);
		
		List<RefereeDto> refereeList=null;
		if(count>0){
			refereeList=adminDao.refereeList(startRow, endRow);
		}
		logger.info("boardSize:" + refereeList.size());
		
		mav.addObject("refereeList", refereeList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		
		mav.setViewName("admin/manageReferee");		
	}

	/**
	 * @name : deleteReferee
	 * @date : 2015. 6. 25.
	 * @author : 변형린
	 * @description : 심판 관리목록에서 삭제시
	 */
	@Override
	public void refereeDelete(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int refereeNumber=Integer.parseInt(request.getParameter("refereeNumber"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		int check=adminDao.refereeDelete(refereeNumber);
		
		logger.info("delectcheck:" + check);
		
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("referee/refereeDelete");
	}

	/**
	 * @name : refereeAccept
	 * @date : 2015. 6. 25.
	 * @author : 변형린
	 * @description : 심판 신청 수락
	 */
	@Override
	public void refereeAccept(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int refereeNumber=Integer.parseInt(request.getParameter("refereeNumber"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		int check=adminDao.refereeAccept(refereeNumber);
		
		logger.info("delectcheck:" + check);
		
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("referee/refereeAccept");		
	}

	/**
	 * @name : refereeSearch
	 * @date : 2015. 6. 25.
	 * @author : 변형린
	 * @description : 심판 관리페이지에서 심판 검색
	 */
	@Override
	public void refereeSearch(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String refereeName=(String)request.getParameter("refereeName");
		logger.info("refereename:" + refereeName);
		
		List<RefereeDto> refereeList=adminDao.refereeSearch(refereeName);
		logger.info("refereeList:" + refereeList);
		
		mav.addObject("refereeList", refereeList);
		mav.setViewName("admin/manageReferee");	
	}

	/**
	 * @함수명: createLeague
	 * @작성일: 2015. 7. 8.
	 * @작성자: 정성남, 변형린
	 * @설명 : 리그개설 정보를 db로 보내는 서비스 클래스
	 */
	public void createLeague(ModelAndView mav){
		Map<String , Object> map = mav.getModelMap();	
		MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request");
		LeagueDto leagueDto = (LeagueDto) map.get("leagueDto");
		leagueDto.setLeagueState(-1);//1일때 리그정보를 각 종목 페이지에 게시 -1일때 게시 안함
		
		logger.info("createLeague---------------------");
		
		MultipartFile upFile=request.getFile("file");
		String fileName=upFile.getOriginalFilename();
		long fileSize=upFile.getSize();
		logger.info("fileName"+fileName);
		logger.info("fileSize"+fileSize);
		
		if(fileSize!=0){
			try{
				String dir="C:\\Users\\kosta\\git\\sml\\src\\main\\webapp\\img\\leagueImg";
				//String dir=request.getSession().getServletContext().getRealPath("/resources");
				
				File file=new File(dir, fileName);
				upFile.transferTo(file);
				
				leagueDto.setLeagueImage(fileName);
			}catch(Exception e){
				logger.info("파일 입출력 에러");
				e.printStackTrace();
			}
		}
		int check = adminDao.createLeague(leagueDto);
		logger.info("check : " + check);
		
		mav.addObject("check" , check);
		mav.setViewName("admin/createLeagueOk");
	}

	/**
	 * @함수명: manageLeague
	 * @작성일: 2015. 7. 2.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public void manageLeague(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");			
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=5;		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=adminDao.getManageLeagueCount();
		logger.info("count:"+count);
		logger.info("currentPage"+currentPage);
		logger.info("startRow"+startRow);
		logger.info("endRow"+endRow);		
		
		List<LeagueDto> manageLeagueList=null;	
		
		manageLeagueList=adminDao.manageLeagueList(startRow,endRow);
		
		mav.addObject("count",count);
		mav.addObject("manageLeagueList",manageLeagueList);		
		mav.addObject("boardSize",boardSize);
		mav.addObject("currentPage",currentPage);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("admin/manageLeague");		
	}

	/**
	 * @함수명: leagueDelete
	 * @작성일: 2015. 7. 2.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public void leagueDelete(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int leagueCode=Integer.parseInt(request.getParameter("leagueCode"));
		int check=adminDao.leagueDelete(leagueCode);
		
		mav.addObject("check",check);
		mav.setViewName("admin/leagueDelete");
		
	}

	/**
	 * @함수명: leagueInfo
	 * @작성일: 2015. 7. 2.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public void leagueInfo(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int leagueCode=Integer.parseInt(request.getParameter("leagueCode"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		
		LeagueDto leagueDto=adminDao.leagueInfo(leagueCode);
		mav.addObject("leagueDto",leagueDto);
		
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("leagueCode",leagueCode);
		mav.setViewName("admin/leagueInfo");
		
	}

	/**
	 * @함수명: leagueUpdate
	 * @작성일: 2015. 7. 2.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public void leagueUpdate(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int leagueCode=Integer.parseInt(request.getParameter("leagueCode"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		LeagueDto leagueDto=adminDao.leagueUpdate(leagueCode);
		
		mav.addObject("leagueDto",leagueDto);		
		mav.addObject("leagueCode",leagueCode);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("admin/leagueUpdate");
		
	}

	/**
	 * @함수명: leagueUpdateOk
	 * @작성일: 2015. 7. 2.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public void leagueUpdateOk(ModelAndView mav) {
		logger.info("UpdateOKOKOKOKOK---------");
		Map<String,Object> map=mav.getModelMap();

		LeagueDto leagueDto=(LeagueDto) map.get("leagueDto");	
		System.out.println(leagueDto.getLeagueImage()+"|"+leagueDto);
		int check=adminDao.leagueUpdateOk(leagueDto);
		
		mav.addObject("check",check);
		mav.setViewName("admin/leagueUpdateOk");
		
	}

	/**
	 * @name : leagueSwitch
	 * @date : 2015. 7. 8.
	 * @author : 변형린
	 * @description : 리그 각 종목 게시 상태 변경하기
	 */
	@Override
	public void leagueSwitch(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		int leagueState=Integer.parseInt(request.getParameter("leagueState"))*-1;		
		int leagueCode=Integer.parseInt(request.getParameter("leagueCode"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		int check=adminDao.leagueSwitch(leagueState, leagueCode);
		logger.info("switch check:" + check);
		
		mav.addObject("check", check);
		mav.addObject("leagueState", leagueState);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("admin/leagueSwitchOk");
	}
}
