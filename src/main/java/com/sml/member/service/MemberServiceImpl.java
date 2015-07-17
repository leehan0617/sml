package com.sml.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sml.member.dao.MemberDao;
import com.sml.member.dto.MemberDto;
import com.sml.team.dao.TeamDao;
import com.sml.team.dto.TeamDto;

@Service
public class MemberServiceImpl implements MemberService{
	private Logger logger = Logger.getLogger(MemberServiceImpl.class.getName());
	@Autowired
	private MemberDao dao;
	@Autowired
	private TeamDao teamDao;
	/**
	 * @함수명:teamMemberInfo
	 * @작성일:2015. 6. 23.
	 * @작성자:조영석
	 * @설명문:팀생성을 위한 서비스메소드
	 */
	@Override
	public void teamMember(ModelAndView mav) {	
		logger.info("MemberService teamMemberInfo");
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		
	
		/*//MultipartFile upFile=request.getFile("teamImage");
		//String fileName=upFile.getOriginalFilename();
		String timeName=Long.toString(System.currentTimeMillis()) + "_" + fileName;
		long fileSize=upFile.getSize();		
		logger.info("fileName:" + fileName);
		logger.info("timeName:" + timeName);
		*/
		String path="";	
		/*
		if(fileSize!=0){
			try{
				//String dir=request.getSession().getServletContext().getRealPath("/") + File.separator + "img/teamImg";
				String dir="C:\\Users\\kosta\\git\\sml\\src\\main\\webapp\\img\\teamImg";
				logger.info("dir:" + dir);
				
				File file=new File(dir, timeName);	
				upFile.transferTo(file);
				path=file.getAbsolutePath();
				//logger.info("file.getPath() : " + file.getPath());
			}catch(Exception e){
				logger.info("파일 입출력 에러:" + e);
			}
		}*/
						
		String teamId=request.getParameter("teamId");
		String teamPassword=request.getParameter("teamPassword");
		String teamName=request.getParameter("teamName");
		String sportType=request.getParameter("sportType");
		String homeGround=request.getParameter("homeGround");
		String teamReaderName="";
		String emblem="";//timename
		
		String teamGrade="AA";
		
		int check=dao.insertMember(memberDto,teamId,teamPassword,teamName,sportType,teamGrade,teamReaderName,emblem,homeGround, path);
		logger.info("REGISTER CHECK: " + check);
		mav.addObject("check",check);
		mav.setViewName("member/registerResult");
	}
	
	@Override
	/**
	 * 
	 * @함수명 : teamMemberInfo
	 * @작성일 : 2015. 6. 23.
	 * @작성자 : 이한빈
	 * @설명   :  팀컨트롤러에서 팀게시판에서 팀맴버소개 및 관리 요청이 오면 실행되는 메소드
	 */
	public void teamMemberInfo(ModelAndView mav) {	
		logger.info("MemberService teamMemberInfo");
		
		List<MemberDto> member = dao.teamMemberInfo();
		mav.addObject("member" , member);
	}

	/**
	 * @name : myInfoPage
	 * @date : 2015. 7. 10.
	 * @author : 변형린
	 * @description : 회원수정 페이지로 이동
	 */
	@Override
	public void myInfoPage(ModelAndView mav) {
		logger.info("MemberService myInfoPage");
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		//팀 정보 가져오기
		String teamName=request.getParameter("teamName");
		TeamDto teamDto=dao.getTeamInfo(teamName);
		
		//팀 홈그라운드 가져오기
		String homeGround=teamDao.getTeamGround(teamDto.getTeamCode());
		if(homeGround==null){
			homeGround="연고지 없음";
		}
		//멤버 정보 가져오기
		int teamCode=teamDto.getTeamCode();
		MemberDto memberDto=dao.getMemberInfo(teamCode);
			
		mav.addObject("homeGround", homeGround);
		mav.addObject("teamDto", teamDto);
		mav.addObject("memberDto", memberDto);
		mav.setViewName("member/myInfoPage");
	}

	/**
	 * @name : updateMemberInfo
	 * @date : 2015. 7. 01.
	 * @author : 변형린
	 * @description : 회원수정 페이지로 이동
	 */
	@Override
	public void updateMemberInfo(ModelAndView mav) {
		logger.info("MemberService updateMemberInfo");
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String teamName=request.getParameter("teamName");
		TeamDto teamDto=dao.getTeamInfo(teamName);
		
		int teamCode=teamDto.getTeamCode();
		MemberDto memberDto=dao.getMemberInfo(teamCode);
		
		mav.addObject("teamCode", teamCode);
		mav.addObject("memberDto", memberDto);
		mav.setViewName("member/updateMember");
	}

	/**
	 * @name : updateMemberInfoOk
	 * @date : 2015. 7. 10
	 * @author : 변형린
	 * @description : 회원 수정
	 */
	@Override
	public void updateMemberInfoOk(ModelAndView mav) {
		logger.info("MemberService updateMemberInfoOk");
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		
		int teamCode=Integer.parseInt(request.getParameter("teamCode"));		
		int check=dao.updateMemberInfoOk(memberDto, teamCode);
		System.out.println(check);
		
		mav.addObject("check", check);
		mav.setViewName("member/updateMemberOk");
	}	
	
	/**
	 * 
	 * @함수명: viewTeamMemberInfo
	 * @작성일: 2015. 7. 14.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public void viewTeamMemberInfo(ModelAndView mav) {
		logger.info("Service manageTeamMember");
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		//System.out.println("teamName:"+teamName);
		String teamGrade=request.getParameter("teamGrade");
		//System.out.println("teamGrade:"+teamGrade);
		
		int teamCode=Integer.parseInt(request.getParameter("teamCode"));
		System.out.println("teamCode-------:"+teamCode);
		
		TeamDto team=dao.getTeamInfo(teamName);
		String emblem=team.getEmblem();
		
		String pageNumber=request.getParameter("pageNumber");
		//System.out.println("pageNumber"+pageNumber);
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=5;		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=dao.getTeamMemberCount(teamCode);
				
		
		List<MemberDto> teamMemberList=null;
		if(count>0){
			teamMemberList = dao.getTeamMemberList(teamName,startRow,endRow);
		}			
		
		mav.addObject("emblem",emblem);
		mav.addObject("teamMemberList",teamMemberList);
		mav.addObject("count",count);		
		mav.addObject("boardSize",boardSize);
		mav.addObject("teamCode",teamCode);
		mav.addObject("currentPage",currentPage);			
		mav.addObject("teamName",teamName);	
		mav.addObject("teamGrade",teamGrade);
		mav.setViewName("teamPage/teamMemberInfo");
		
	}	
	/**
	 * 
	 * @함수명: addMember
	 * @작성일: 2015. 7. 15.
	 * @작성자: 정성남
	 * @설명 :
	 */
	
	@Override
	public void addMember(ModelAndView mav) {
		HashMap<String, Object> hMap=mav.getModelMap();
		MemberDto member=(MemberDto) hMap.get("member");
		
		HttpServletRequest request=(HttpServletRequest) hMap.get("request");
		int currentPage=Integer.parseInt(request.getParameter("currentPage"));
		
		String teamName=request.getParameter("teamName");		
		String teamGrade=request.getParameter("teamGrade");
		String pageNumber=request.getParameter("pageNumber");
		
		int teamCode=dao.getTeamInfo(teamName).getTeamCode();		
		member.setTeamCode(teamCode);
		
		int check=dao.addMember(member);		
		
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("teamGrade",teamGrade);
		mav.addObject("teamCode",teamCode);
		mav.addObject("teamName",teamName);
		mav.addObject("currentPage",currentPage);
		mav.addObject("check",check);
		mav.setViewName("teamPage/addMemberOk");
	}

	/**
	 * 
	 * @함수명: deleteMember
	 * @작성일: 2015. 7. 15.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public void deleteMember(ModelAndView mav) {
		HashMap<String, Object> hMap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hMap.get("request");
		MemberDto member=(MemberDto) hMap.get("member");
		
		int memberCode=Integer.parseInt(request.getParameter("memberCode"));		
		String teamName=request.getParameter("teamName");		
		String teamGrade=request.getParameter("teamGrade");		
		String pageNumber=request.getParameter("pageNumber");
		int teamCode=dao.getTeamInfo(teamName).getTeamCode();		
		member.setTeamCode(teamCode);		
		
		int check=dao.deleteMember(memberCode);	
		
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("teamGrade",teamGrade);
		mav.addObject("teamCode",teamCode);
		mav.addObject("teamName",teamName);
		mav.addObject("check",check);
		mav.setViewName("teamPage/memberDeleteOk");
	}

	/**
	 * @함수명: searchMember
	 * @작성일: 2015. 7. 15.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public void searchMember(ModelAndView mav) {
		logger.info("searchMemberSERVICE");
		HashMap<String, Object> hMap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hMap.get("request");
		MemberDto member=(MemberDto) hMap.get("member");				
		String searchBoxName=request.getParameter("searchBoxName");
		//System.out.println("22:"+searchBoxName);
		String teamName=request.getParameter("teamName");	
		//System.out.println("33:"+teamName);
		String teamGrade=request.getParameter("teamGrade");	
		//System.out.println("44:"+teamGrade);
		int teamCode=dao.getTeamInfo(teamName).getTeamCode();		
		member.setTeamCode(teamCode);
		//System.out.println("55:"+teamCode);
		
		int boardSize=5;
		int currentPage=Integer.parseInt(request.getParameter("currentPage"));
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=dao.getSearchTeamMemberCount(teamCode,searchBoxName);
		logger.info("count:"+count);
		logger.info("currentPage"+currentPage);
		logger.info("startRow"+startRow);
		logger.info("endRow"+endRow);
		
		List<MemberDto> teamMemberList=null;
		if(count>0){		
		 teamMemberList = dao.getMemberSearchList(teamName,searchBoxName,startRow,endRow);
		}
		
		mav.addObject("teamMemberList",teamMemberList);
		mav.addObject("searchBoxName",searchBoxName);
		mav.addObject("teamName",teamName);
		mav.addObject("teamGrade",teamGrade);
		mav.addObject("teamCode",teamCode);	
		mav.addObject("count",count);		
		mav.addObject("boardSize",boardSize);		
		mav.addObject("currentPage",currentPage);	
		mav.setViewName("teamPage/teamMemberInfo");
		}	
	
}
