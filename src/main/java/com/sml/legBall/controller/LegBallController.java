package com.sml.legBall.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sml.legBall.service.LegBallService;


@Controller
public class LegBallController {
	private Logger logger = Logger.getLogger(LegBallController.class.getName());
	@Autowired
	private LegBallService service;	
	/**
	 * 
	 * @함수명: legBallPage
	 * @작성일: 2015. 7. 21.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@RequestMapping(value="/legBall/legBallMain.do", method=RequestMethod.GET)
	public String legBallPage(HttpServletRequest request , HttpServletResponse response){
		logger.info("legBallController legBallPage ");
		
		return "legBall/legBallMain";
	}
	/**
	 * 
	 * @함수명: legBallRule
	 * @작성일: 2015. 7. 17.
	 * @작성자: 정성남
	 * @설명 :
	 */
	@RequestMapping(value="/legBall/legBallRule.do", method=RequestMethod.GET)
	public ModelAndView legBallRule(HttpServletRequest request, HttpServletResponse response){
		logger.info("Controller/legBallRule---------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		service.legBallRule(mav);
		
		return mav;
	}
	/**
	 * @함수명:viewlegBallBoard
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:축구페이지 공지사항 게시판 보는 함수
	 */
	@RequestMapping(value="/legBallviewlegBallBoard" , method=RequestMethod.GET)
	public ModelAndView viewlegBallBoard(HttpServletRequest request, HttpServletResponse response){
		logger.info("SController viewlegBallBoard");
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mav = service.viewlegBallBoard(request);
		return mav;
	}
	/**
	 * 
	 * @함수명:readlegBallBoard
	 * @작성일:2015. 7. 16.
	 * @작성자:이한빈 
	 * @설명문:축구페이지 공지사항 읽는 함수 
	 */
	@RequestMapping(value="/legBallreadlegBallBoard" , method=RequestMethod.GET)
	public ModelAndView readlegBallBoard(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController readlegBallBoard");
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mav = service.readlegBallBoard(request);
		return mav;
	}
	/**
	 * @함수명:showAgeChart
	 * @작성일:2015. 7. 17.
	 * @작성자:이한빈 
	 * @설명문:연령별 통계보여주는 함수 
	 */
	@RequestMapping(value="/legBallshowAgeChart" , method=RequestMethod.GET)
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
	@RequestMapping(value="/legBallshowCityChart" ,method=RequestMethod.GET)
	public ModelAndView showCityChart(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController showCityChart");
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mav = service.showCityChart(request);
		return mav;
	}
	
	@RequestMapping(value="/legBallshowDayChart" , method=RequestMethod.GET)
	public ModelAndView showDayChart(HttpServletRequest request, HttpServletResponse response){
		logger.info("SController showDayChart");
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mav = service.showDayChart(request);
		
		return mav;
	}
	
	/**
	 * 
	 * @함수명: legBallTeamList
	 * @작성일: 2015. 7. 17.
	 * @작성자: 정성남
	 * @설명 : 팀리스트 이동 컨트롤러
	 */
	@RequestMapping(value="/legBall/legBallTeamList.do", method=RequestMethod.GET)
	public ModelAndView legBallTeamList(HttpServletRequest request, HttpServletResponse response){
		logger.info("Controller/legBallMain---------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		service.legBallTeamList(mav);
		
		return mav;
	}
	/**
	 * @함수명:showLeagueInfo
	 * @작성일:2015. 7. 17.
	 * @작성자:이한빈 
	 * @설명문:리그정보 가져오는 함수 
	 */
	@RequestMapping(value="/showLeaguelegBallInfo" , method=RequestMethod.GET)
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
	@RequestMapping(value="/legBallleagueTable" , method=RequestMethod.GET)
	public ModelAndView leagueTable(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController leagueTable");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = service.leagueTable(request);
		return mav;
	}	
	
	@RequestMapping(value="/legBalljoinLeague" , method=RequestMethod.GET)
	public ModelAndView joinLeague(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController joinLeague");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = service.joinLeague(request);
		return mav;
	}
	
	/**
	 * 
	 * @함수명: legBallCommonBoardPage
	 * @작성일: 2015. 7. 21.
	 * @작성자: 정성남
	 * @설명 : 공지사항 이동 페이지
	 */
	@RequestMapping(value="/legBall/legBallCommonBoardPage.do", method=RequestMethod.GET)
	public ModelAndView legBallCommonBoard(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController legBallCommonBoard");		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		service.legBallCommonBoard(mav);
		
		return mav;
	}
	/**
	 * 
	 * @함수명:showRecentMatch
	 * @작성일:2015. 7. 21.
	 * @작성자:이한빈 
	 * @설명문:최근 다가오는 경기리스트 보여주기 
	 */
	@RequestMapping(value="/legBallshowRecentMatch" , method=RequestMethod.GET)
	public ModelAndView showRecentMatch(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController showRecentMatch");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = service.showRecentMatch(request);
		return mav;
	}
	
	@RequestMapping(value="/legBallfindMatchTeams",method=RequestMethod.GET)
	public ModelAndView findMatchTeams(HttpServletRequest request , HttpServletResponse response){
		logger.info("SController findMatchTeams");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = service.findMatchTeams(request);
		return mav;
	}

	
	

}
