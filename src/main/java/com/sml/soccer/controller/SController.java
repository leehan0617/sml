package com.sml.soccer.controller;

import java.util.ArrayList;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sml.soccer.service.SService;
import com.sml.weather.WeatherDTO;
import com.sml.weather.WeatherParser;

@Controller
public class SController {
	private Logger logger = Logger.getLogger(SController.class.getName());
	@Autowired
	private SService service;
	
	/**
	 * 
	 * @함수명: soccerPage
	 * @작성일: 2015. 7. 17.
	 * @작성자: 정성남
	 * @설명 : 축구페이지이동
	 */
	@RequestMapping(value="/sc", method=RequestMethod.GET)
	public ModelAndView soccerPage(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController scoccerController");
		
		ModelAndView mav=new ModelAndView();
		
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
		mav.setViewName("sc/soccerMain");
		return mav;
	}
	
	/**
	 * 
	 * @함수명: soccerRule
	 * @작성일: 2015. 7. 17.
	 * @작성자: 정성남
	 * @설명 : 축구 경기규칙페이지를 호출하기 위한 컨트롤러
	 */
	@RequestMapping(value="/soccer/soccerRule.do", method=RequestMethod.GET)
	public ModelAndView soccerRule(HttpServletRequest request, HttpServletResponse response){
		logger.info("Controller/soccerRule---------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		service.soccerRule(mav);
		
		return mav;
	}
	/**
	 * @함수명:viewSoccerBoard
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:축구페이지 공지사항 게시판 보는 함수
	 */
	@RequestMapping(value="/viewSoccerBoard" , method=RequestMethod.GET)
	public ModelAndView viewSoccerBoard(HttpServletRequest request, HttpServletResponse response){
		logger.info("SController viewSoccerBoard");
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mav = service.viewSoccerBoard(request);
		return mav;
	}
	/**
	 * 
	 * @함수명:readSoccerBoard
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:축구페이지 공지사항 읽는 함수 
	 */
	@RequestMapping(value="/readSoccerBoard" , method=RequestMethod.GET)
	public ModelAndView readSoccerBoard(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController readSoccerBoard");
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mav = service.readSoccerBoard(request);
		return mav;
	}
	/**
	 * @함수명:showAgeChart
	 * @작성일:2015. 7. 17.
	 * @작성자:이한빈 
	 * @설명문:연령별 통계보여주는 함수 
	 */
	@RequestMapping(value="/showAgeChart" , method=RequestMethod.GET)
	public ModelAndView showAgeChart(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController showAgeChart");
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mav = service.showAgeChart(request);
		return mav;
	}
	/**
	 * @함수명:showCityChart
	 * @작성일:2015. 7. 17.
	 * @작성자:이한빈 
	 * @설명문:지역별 통계보여주는 함수
	 */
	@RequestMapping(value="/showCityChart" ,method=RequestMethod.GET)
	public ModelAndView showCityChart(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController showCityChart");
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mav = service.showCityChart(request);
		return mav;
	}
	
	@RequestMapping(value="/showDayChart" , method=RequestMethod.GET)
	public ModelAndView showDayChart(HttpServletRequest request, HttpServletResponse response){
		logger.info("SController showDayChart");
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mav = service.showDayChart(request);
		
		return mav;
	}
	
	/**
	 * 
	 * @함수명: soccerTeamList
	 * @작성일: 2015. 7. 17.
	 * @작성자: 정성남
	 * @설명 : 팀리스트 이동 컨트롤러
	 */
	@RequestMapping(value="/soccer/soccerTeamList.do", method=RequestMethod.GET)
	public ModelAndView soccerTeamList(HttpServletRequest request, HttpServletResponse response){
		logger.info("Controller/soccerMain---------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		service.soccerTeamList(mav);
		
		return mav;
	}
	/**
	 * @함수명:showLeagueInfo
	 * @작성일:2015. 7. 17.
	 * @작성자:이한빈 
	 * @설명문:리그정보 가져오는 함수 
	 */
	@RequestMapping(value="/showLeagueInfo" , method=RequestMethod.GET)
	public ModelAndView showLeagueInfo(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController showLeagutInfo");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = service.showLeagueInfo(request);
		return mav;
	}
	/**
	 * 
	 * @함수명:leagueTable
	 * @작성일:2015. 7. 20.
	 * @작성자:이한빈 
	 * @설명문:축구페이지 클릭시 리그테이블 뷰에 뿌려주는 함수 
	 */
	@RequestMapping(value="/leagueTable" , method=RequestMethod.GET)
	public ModelAndView leagueTable(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController leagueTable");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = service.leagueTable(request);
		return mav;
	}	
	
	@RequestMapping(value="/joinLeague" , method=RequestMethod.GET)
	public ModelAndView joinLeague(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController joinLeague");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = service.joinLeague(request);
		return mav;
	}
	
	/**
	 * 
	 * @함수명: soccerCommonBoardPage
	 * @작성일: 2015. 7. 21.
	 * @작성자: 정성남
	 * @설명 : 공지사항 이동 페이지
	 */
	@RequestMapping(value="/soccer/soccerCommonBoardPage.do", method=RequestMethod.GET)
	public ModelAndView soccerCommonBoard(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController soccerCommonBoard");		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		service.soccerCommonBoard(mav);
		
		return mav;
	}
	/**
	 * 
	 * @함수명:showRecentMatch
	 * @작성일:2015. 7. 21.
	 * @작성자:이한빈 
	 * @설명문:최근 다가오는 경기리스트 보여주기 
	 */
	@RequestMapping(value="/showRecentMatch" , method=RequestMethod.GET)
	public ModelAndView showRecentMatch(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController showRecentMatch");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = service.showRecentMatch(request);
		return mav;
	}
	
	@RequestMapping(value="/findMatchTeams",method=RequestMethod.GET)
	public ModelAndView findMatchTeams(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController findMatchTeams");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = service.findMatchTeams(request);
		return mav;
	}

}
