package com.sml.referee.service;

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

import com.sml.referee.dao.RefereeDao;
import com.sml.referee.dto.RefereeDto;
import com.sml.team.dao.TeamDao;

@Component
public class RefereeServiceImpl implements RefereeService{
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private RefereeDao refereeDao;
	@Autowired
	private TeamDao teamDao;
	
	/**
	 * @name : refereeList
	 * @date : 2015. 6. 23.
	 * @author : 변형린
	 * @description : 심판 현황 페이지로 이동시키는 Service 메소드
	 */
	@Override
	public void refereeList(ModelAndView mav) {	
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		//각 종목 메인 페이지의 심판리스트 불러올 종목변수 (예) "축구", "족구", "야구", 
		String sportType=request.getParameter("sportType");
		
		//심판 리스트로 넘어갈때 맨 처음 보여줄 심판들의 지역 , 초기값은 "서울"
		String regionSido=request.getParameter("regionSido");		
		if(regionSido==null){
			regionSido="서울";
		}
		logger.info("regionSido:" + regionSido);
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null)pageNumber="1";
		
		int boardSize=10;
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=refereeDao.refereeCount();
		logger.info("count:" + count);
		
		//심판 리스트
		List<RefereeDto> refereeList=null;
		if(count>0){
			refereeList=refereeDao.refereeList(startRow, endRow, sportType, regionSido);//sportType="축구"
		}
		logger.info("boardSize:" + refereeList.size());
		
		//심판 지역 리스트
		List<String> sidoList=refereeDao.sidoList(regionSido);
		sidoList.add(0, regionSido);
		
		mav.addObject("sportType", sportType);
		mav.addObject("refereeList", refereeList);
		mav.addObject("sidoList", sidoList);		
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		
		mav.setViewName("referee/refereeList");
		//mav.setViewName("referee/refereeListOption");
	}

	/**
	 * @name : registerReferee
	 * @date : 2015. 6. 23.
	 * @author : 변형린
	 * @description : 심판 신청 등록 페이지로 이동시키는 Service 메소드
	 */
	@Override
	public void registerReferee(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String sportType=request.getParameter("sportType");
		logger.info("sportType : " + sportType );
		mav.addObject("sportType", sportType);
		mav.setViewName("referee/refereeRegister");		
	}

	/**
	 * @name : registerRefereeOk
	 * @date : 2015. 6. 23.
	 * @author : 변형린
	 * @description : 심판 신청 등록 정보를 DB로 넘기는 Service 메소드
	 */
	@Override
	public void registerRefereeOk(ModelAndView mav) {
		Map <String, Object> map= mav.getModelMap();
		MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request");
		
		String birthYear=(String) request.getParameter("birthYear");
		String birthMonth=(String) request.getParameter("birthMonth");
		String birthDay=(String) request.getParameter("birthDay");		
		String sportType=request.getParameter("sportType");
		
		RefereeDto refereeDto=(RefereeDto)map.get("refereeDto");		
		refereeDto.setRefereeSport(sportType);
		refereeDto.setRefereeYes(1);//default=0; 수락거부
		refereeDto.setRefereeBirth(birthYear + "," + birthMonth + "," + birthDay);
		
		MultipartFile upFile=request.getFile("file");
		String fileName=upFile.getOriginalFilename();
		String timeName=Long.toString(System.currentTimeMillis()) + "_" + fileName;
		long fileSize=upFile.getSize();
		
		logger.info("fileName:" + fileName);
		logger.info("timeName:" + timeName);
		
		if(fileSize!=0){
			try{
				String dir="C:\\Users\\kosta\\git\\sml\\src\\main\\webapp\\img\\refereeImg";
				//String dir=request.getSession().getServletContext().getRealPath("/") + File.separator + "img/refereeImg";
				
				logger.info("dir:" + dir);
				
				File file=new File(dir, timeName);	
				upFile.transferTo(file);
				refereeDto.setRefereePicture(timeName);
				refereeDto.setPath(file.getAbsolutePath());
				logger.info("file.getAbsolutePath() : " + file.getAbsolutePath());
			}catch(Exception e){
				logger.info("파일 입출력 에러:" + e);
			}
		}
		int check=refereeDao.refereeRegister(refereeDto);
		
		mav.addObject("sportType", sportType);
		mav.addObject("check", check);
		mav.setViewName("referee/refereeRegisterOk");
	}
}
