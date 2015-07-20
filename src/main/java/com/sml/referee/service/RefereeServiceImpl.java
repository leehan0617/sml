package com.sml.referee.service;

import java.io.File;
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
	 * 
	 * @함수명: refereeList
	 * @작성일: 2015. 7. 20.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public void refereeList(ModelAndView mav) {	
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String sportType="";
		int sportCode = Integer.parseInt(request.getParameter("sportCode"));
		//System.out.println("RefereeListsportCode:"+sportCode);
		
		
		switch(sportCode){
			case 0: sportType="축구"; break;
			case 1: sportType="야구"; break;
			case 2: sportType="풋살"; break;
			case 3: sportType="족구"; break;
		}
		
		//각 종목 메인 페이지의 심판리스트 불러올 종목변수 (예) "축구", "족구", "야구", 		
		//System.out.println("sportType:"+sportType);
		//심판 리스트로 넘어갈때 맨 처음 보여줄 심판들의 지역 , 초기값은 "서울"
		String regionSido=request.getParameter("regionSido");	
		System.out.println("regionSido"+regionSido);
		if(regionSido==null){
			regionSido="전국";
		}
		logger.info("regionSido:" + regionSido);
		
		int count=refereeDao.refereeCount();
		//logger.info("count:" + count);
		
		String pageNumber=request.getParameter("pageNumber");
		//System.out.println("pageNumber"+pageNumber);
		if(pageNumber==null) pageNumber="1";
		
		int boardSize=5;		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;	
		
		//심판 리스트
		List<RefereeDto> refereeList=null;
		
		if(regionSido.equals("전국")){
			refereeList=refereeDao.refereeAllList(startRow, endRow, sportType);
			
		}
		
		else if(count>0&&regionSido!="전국"){
			refereeList=refereeDao.refereeList(startRow, endRow, sportType, regionSido);//sportType="축구"
		}
		
		
		logger.info("boardSize:" + refereeList.size());		
		//심판 지역 리스트
		List<String> sidoList=refereeDao.sidoList(regionSido);
		sidoList.add("전국");
		
		mav.addObject("sportCode",sportCode);
		mav.addObject("sportType", sportType);
		mav.addObject("refereeList", refereeList);
		mav.addObject("sidoList", sidoList);		
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);		
		mav.addObject("currentPage",currentPage);
		mav.addObject("regionSido",regionSido);
		mav.setViewName("referee/refereeList");
		//mav.setViewName("referee/refereeListOption");
	}

	/**
	 * 
	 * @함수명: registerReferee
	 * @작성일: 2015. 7. 20.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@Override
	public void registerReferee(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String sportType="";
		int sportCode = Integer.parseInt(request.getParameter("sportCode"));
		System.out.println("RegistersportCode:"+sportCode);
		
		
		switch(sportCode){
			case 0: sportType="축구"; break;
			case 1: sportType="야구"; break;
			case 2: sportType="풋살"; break;
			case 3: sportType="족구"; break;
		}
		System.out.println("RegistersportType"+sportType);
		
		String regionSido=request.getParameter("regionSido");		
		if(regionSido==null){
			regionSido="전국";
		}
		
		List<String> sidoList=refereeDao.sidoList(regionSido);
		sidoList.add(0, regionSido);		
		
		logger.info("registersportType : " + sportType );
		
		mav.addObject("sportCode",sportCode);
		mav.addObject("sidoList", sidoList);
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
			
		String sportType="";
		int sportCode = Integer.parseInt(request.getParameter("sportCode"));
		System.out.println("RegisterOksportCode:"+sportCode);
		
		
		switch(sportCode){
			case 0: sportType="축구"; break;
			case 1: sportType="야구"; break;
			case 2: sportType="풋살"; break;
			case 3: sportType="족구"; break;
		}		
		
		String refereeRegion=request.getParameter("refereeRegion");
		RefereeDto refereeDto=(RefereeDto)map.get("refereeDto");
		refereeDto.setRefereeSport(sportType);
		refereeDto.setRefereeYes(1);//default=0; 수락거부	
		refereeDto.setSido(refereeRegion);
		refereeDto.setGugun("");
		
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
		
		mav.addObject("sportCode",sportCode);
		mav.addObject("sportType", sportType);
		mav.addObject("check", check);
		mav.setViewName("referee/refereeRegisterOk");
	}
}
