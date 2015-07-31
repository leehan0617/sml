package com.sml.referee.service;

import java.io.File;
import java.util.ArrayList;
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
import com.sml.weather.WeatherDTO;
import com.sml.weather.WeatherParser;

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
	 * @설명 : 등록된 심판의 리스트를 불러오기위한 서비스 함수
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
			case 2: sportType="농구"; break;
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
		
		int count=refereeDao.refereeCount(sportType);
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
	 * @설명 : 심판을 등록하기 위한 서비스함수
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
		refereeDto.setRefereeYes(0);//default=0; 수락거부	
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
