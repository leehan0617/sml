package com.sml.basketBall.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sml.basketBall.service.BasketBallService;

@Controller
public class BasketBallController {
	private Logger logger = Logger.getLogger(BasketBallController.class.getName());
	@Autowired
	private BasketBallService service;	
	/**
	 * 
	 * @함수명: basketBallPage
	 * @작성일: 2015. 7. 21.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@RequestMapping(value="/basketBall/basketBallMain.do", method=RequestMethod.GET)
	public String basketBallPage(HttpServletRequest request , HttpServletResponse response){
		logger.info("basketBallController basketBallPage ");
		
		return "basketBall/basketBallMain";
	}
	/**
	 * 
	 * @함수명: basketBallRule
	 * @작성일: 2015. 7. 17.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@RequestMapping(value="/basketBall/basketBallRule.do", method=RequestMethod.GET)
	public ModelAndView basketBallRule(HttpServletRequest request, HttpServletResponse response){
		logger.info("Controller/basketBallRule---------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		service.basketBallRule(mav);
		
		return mav;
	}
	/**
	 * @함수명:viewbasketBallBoard
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:축구페이지 공지사항 게시판 보는 함수
	 */
	@RequestMapping(value="/basketBallviewbasketBallBoard" , method=RequestMethod.GET)
	public ModelAndView viewbasketBallBoard(HttpServletRequest request, HttpServletResponse response){
		logger.info("SController viewbasketBallBoard");
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mav = service.viewbasketBallBoard(request);
		return mav;
	}
	/**
	 * 
	 * @함수명:readbasketBallBoard
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:축구페이지 공지사항 읽는 함수 
	 */
	@RequestMapping(value="/basketBallreadbasketBallBoard" , method=RequestMethod.GET)
	public ModelAndView readbasketBallBoard(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController readbasketBallBoard");
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mav = service.readbasketBallBoard(request);
		return mav;
	}
	/**
	 * @함수명:showAgeChart
	 * @작성일:2015. 7. 17.
	 * @작성자:이한빈 
	 * @설명문:연령별 통계보여주는 함수 
	 */
	@RequestMapping(value="/basketBallshowAgeChart" , method=RequestMethod.GET)
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
	@RequestMapping(value="/basketBallshowCityChart" ,method=RequestMethod.GET)
	public ModelAndView showCityChart(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController showCityChart");
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mav = service.showCityChart(request);
		return mav;
	}
	
	@RequestMapping(value="/basketBallshowDayChart" , method=RequestMethod.GET)
	public ModelAndView showDayChart(HttpServletRequest request, HttpServletResponse response){
		logger.info("SController showDayChart");
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mav = service.showDayChart(request);
		
		return mav;
	}
	
	/**
	 * 
	 * @함수명: basketBallTeamList
	 * @작성일: 2015. 7. 17.
	 * @작성자: 정성남
	 * @설명 : 팀리스트 이동 컨트롤러
	 */
	@RequestMapping(value="/basketBall/basketBallTeamList.do", method=RequestMethod.GET)
	public ModelAndView basketBallTeamList(HttpServletRequest request, HttpServletResponse response){
		logger.info("Controller/basketBallMain---------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		service.basketBallTeamList(mav);
		
		return mav;
	}
	/**
	 * @함수명:showLeagueInfo
	 * @작성일:2015. 7. 17.
	 * @작성자:이한빈 
	 * @설명문:리그정보 가져오는 함수 
	 */
	@RequestMapping(value="/basketBallshowLeagueInfo" , method=RequestMethod.GET)
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
	@RequestMapping(value="/basketBallleagueTable" , method=RequestMethod.GET)
	public ModelAndView leagueTable(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController leagueTable");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = service.leagueTable(request);
		return mav;
	}	
	
	@RequestMapping(value="/basketBalljoinLeague" , method=RequestMethod.GET)
	public ModelAndView joinLeague(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController joinLeague");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = service.joinLeague(request);
		return mav;
	}
	
	/**
	 * 
	 * @함수명: basketBallCommonBoardPage
	 * @작성일: 2015. 7. 21.
	 * @작성자: 정성남
	 * @설명 : 공지사항 이동 페이지
	 */
	@RequestMapping(value="/basketBall/basketBallCommonBoardPage.do", method=RequestMethod.GET)
	public ModelAndView basketBallCommonBoard(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController basketBallCommonBoard");		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		service.basketBallCommonBoard(mav);
		
		return mav;
	}
	/**
	 * 
	 * @함수명:showRecentMatch
	 * @작성일:2015. 7. 21.
	 * @작성자:이한빈 
	 * @설명문:최근 다가오는 경기리스트 보여주기 
	 */
	@RequestMapping(value="/basketBallshowRecentMatch" , method=RequestMethod.GET)
	public ModelAndView showRecentMatch(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController showRecentMatch");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = service.showRecentMatch(request);
		return mav;
	}
	
	@RequestMapping(value="/basketBallfindMatchTeams",method=RequestMethod.GET)
	public ModelAndView findMatchTeams(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController findMatchTeams");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = service.findMatchTeams(request);
		return mav;
	}

	
	

}
