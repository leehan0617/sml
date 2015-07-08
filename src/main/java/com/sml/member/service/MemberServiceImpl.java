package com.sml.member.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sml.member.dao.MemberDao;
import com.sml.member.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{
	private Logger logger = Logger.getLogger(MemberServiceImpl.class.getName());
	@Autowired
	private MemberDao dao;
	
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
		MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request");
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		
		
		//
		MultipartFile upFile=request.getFile("teamImage");
		String fileName=upFile.getOriginalFilename();
		String timeName=Long.toString(System.currentTimeMillis()) + "_" + fileName;
		long fileSize=upFile.getSize();		
		logger.info("fileName:" + fileName);
		logger.info("timeName:" + timeName);
		
		String path=null;		
		if(fileSize!=0){
			try{
				String dir=request.getSession().getServletContext().getRealPath("/") + File.separator + "img/teamImg";
				
				logger.info("dir:" + dir);
				
				File file=new File(dir, timeName);	
				upFile.transferTo(file);
				path=file.getAbsolutePath();
				//logger.info("file.getPath() : " + file.getPath());
			}catch(Exception e){
				logger.info("파일 입출력 에러:" + e);
			}
		}
				
		
		
		String teamId=request.getParameter("teamId");
		String teamPassword=request.getParameter("teamPassword");
		String teamName=request.getParameter("teamName");
		String sportType=request.getParameter("sportType");
		String homeGround=request.getParameter("homeGround");
		String teamReaderName="";
		String emblem=timeName;
		
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
}
