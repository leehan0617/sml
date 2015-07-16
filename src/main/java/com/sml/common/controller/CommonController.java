package com.sml.common.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sml.common.dao.CommonDao;
import com.sml.common.dto.CommonBoardDto;
import com.sml.common.service.CommonService;

@Controller
public class CommonController {	
	final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private CommonService commonService;
	@Autowired
	private CommonDao dao;

	/**
	 * @함수명: addCommonBoard
	 * @작성일: 2015. 6. 23.
	 * @작성자: 정성남
	 * @설명 : 운영자 공통 게시판에서 글 작성하기
	 */
	
	@RequestMapping(value="/board/addCommonBoard.do", method=RequestMethod.GET)
	public ModelAndView addCommonBoard(HttpServletRequest request, HttpServletResponse response){
		logger.info("글작성 컨트롤러-------------------------");
		ModelAndView mav=new ModelAndView();
		commonService.addCommonBoard(mav);
		return mav;
	}
	
	/**
	 * @함수명: addCommonBoard
	 * @작성일: 2015. 6. 23.
	 * @작성자: 정성남
	 * @설명 : 운영자 공통 게시판에서 글 작성하기
	 */
	
	@RequestMapping(value="/board/addCommonBoard.do",method=RequestMethod.POST)
	public ModelAndView addCommonBoard(HttpServletRequest request,CommonBoardDto commonBoardDto){
		logger.info("글작성Ok 컨트롤러-------------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("commonBoardDto",commonBoardDto);
		commonService.addCommonBoardOk(mav);	
		return mav;
	}
	
	/**
	 * @함수명: adminBoard
	 * @작성일: 2015. 6. 23.
	 * @작성자: 정성남
	 * @설명 : 운영자 공통 게시판으로 이동
	 */
	
	@RequestMapping(value="/board/adminBoard.do", method=RequestMethod.GET)
	public ModelAndView adminBoard(HttpServletRequest request, HttpServletResponse response){
		logger.info("adminBoard-------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);	
		commonService.adminBoard(mav);		
		return mav;
	}
	

	/**
	 * @name : CommonController
	 * @date : 2015. 6. 23.
	 * @author : 정성남
	 * @description : 공통게시판에서 글 삭제하기
	 */
	@RequestMapping(value="/board/deleteCommonBoard.do",method=RequestMethod.GET)
	public ModelAndView deleteCommonBoard(HttpServletRequest request, HttpServletResponse response){
		logger.info("deleteCommonBoard-------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);			
		commonService.deleteCommonBoard(mav);		
		
		return mav;
	}
	
	/**
	 * @name : CommonController
	 * @date : 2015. 6. 23.
	 * @author : 정성남
	 * @description : 공통게시판에서 글 읽기
	 */
	@RequestMapping(value="/board/readCommonBoard.do",method=RequestMethod.GET)
	public ModelAndView readCommonBoard(HttpServletRequest request, HttpServletResponse response){
		logger.info("readCommonBoard-------------------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);			
		commonService.readCommonBoard(mav);		
		
		return mav;
	}
	
	/**
	 * @name : CommonController
	 * @date : 2015. 6. 23.
	 * @author : 정성남
	 * @description : 공통게시판에서 글 수정하기
	 */
	
	@RequestMapping(value="/board/updateCommonBoard.do",method=RequestMethod.GET)
	public ModelAndView updateCommonBoard(HttpServletRequest request, HttpServletResponse response,CommonBoardDto commonBoardDto){
		logger.info("boardUpdate-----------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("commonBoardDto",commonBoardDto);
		commonService.updateCommonBoardSelect(mav);
		
		return mav;
	}
	
	/**
	 * @name : CommonController
	 * @date : 2015. 6. 23.
	 * @author : 정성남
	 * @description : 공통게시판에서 글 수정 완료하기
	 */
	
	@RequestMapping(value="/board/updateCommonBoard.do",method=RequestMethod.POST)
	public ModelAndView updateCommonBoard(HttpServletRequest request, CommonBoardDto commonBoardDto){
		logger.info("boardUpdate-----------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("commonBoardDto",commonBoardDto);

		commonService.updateCommonBoardOk(mav);
		return mav;
	}
	
	@RequestMapping(value="/autocomplete" ,method=RequestMethod.POST)
	public void autoTeamname(Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse resp, String teamName) throws IOException {
		logger.info("##########autoTeamname##############");
		String result = request.getParameter("term");
		System.out.println("result : " + result);
		
		// 한글깨짐 방지를 위해 인코딩하기
       // URLEncoder.encode(result , "UTF-8");
		
		List<String> list = dao.autoSearch(result);
		JSONArray ja = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			ja.put(list.get(i));
		}
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();

		out.print(ja.toString());

	} 
	
	
		
	/**
	 * @name : searchBoard
	 * @date : 2015. 6. 23.
	 * @author : 변형린
	 * @description : 관리자 공지사항게시판에서 공지사항 검색
	 */
	
	@RequestMapping(value="/board/searchBoard.do",method=RequestMethod.GET)
	public ModelAndView searchBoard(HttpServletRequest request){
		logger.info("searchBoard-----------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		commonService.searchBoard(mav);
		
		return mav;
	}
}
