package com.sml.matching.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.sml.matching.dao.MatchingDao;
import com.sml.matching.dto.MatchingDto;
import com.sml.member.dao.MemberDao;
import com.sml.member.dto.MemberDto;
import com.sml.team.dao.TeamDao;
import com.sml.team.dto.TeamDto;
import com.sml.team.service.TeamServiceImpl;
import com.sml.weather.WeatherAllDTO;
import com.sml.weather.WeatherAllParser;

@Service
public class MatchingServiceImpl implements MatchingService {
	private Logger logger = Logger.getLogger(TeamServiceImpl.class.getName());
	@Autowired
	private MatchingDao dao;
	@Autowired
	private MemberDao memberDao;
	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 7. 6.
	 * @author : 이희재
	 * @description : 매칭과 동시에 매칭 정보를 매칭 테이블에 입력.
	 */
	@Override
	public void searchMatching(ModelAndView mav) {
		Map<String , Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MatchingDto matchingDto = (MatchingDto) map.get("matchingDto");
		String teamName=request.getParameter("teamName");
		
		matchingDto.setMatchingSport(dao.getTeamInfo(teamName).getSportType());
		matchingDto.setMatchingState("전");
//		System.out.println(matchingDto.getMatchingLatlng());
		
		int check = dao.searchMatching(matchingDto);
		mav.addObject("teamName",teamName);
		mav.addObject("matchingCheck" , check);
		mav.setViewName("teamBoard/okTeamBoard");
	}

	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 7. 2.
	 * @author : 이희재
	 * @description : 매칭을 위한 페이지 이동
	 */
	
	@Override
	public void matching(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		TeamDto teamDto=dao.getTeamInfo(teamName);
		int teamCode=teamDto.getTeamCode();
		
		MatchingDto matchingDto=dao.getTeamMatchingInfo(teamCode);
		TeamDto myTeamDto=dao.getTeamInfo(teamName);
		TeamDto otherTeamDto=null;
		
		if(matchingDto==null){
			String homeGround=dao.getTeamGround(teamCode);
			
			mav.addObject("teamCode", teamCode);
			mav.addObject("homeGround", homeGround);
			mav.addObject("teamName",teamName);
			mav.setViewName("teamPage/matching");
		}else if(matchingDto!=null){
			if(matchingDto.getMatchingState().equals("전")){
				// 매칭 전일때 매칭 시작을 위한 페이지 이동
				mav.addObject("matchingDto", matchingDto);
				mav.addObject("teamCode", teamCode);
				mav.addObject("teamName",teamName);
				mav.setViewName("teamPage/matching");
			}else if(matchingDto.getMatchingState().equals("중")){
				// 매칭 중 일때 애니메이션을 이용하여 매칭 중이라는 것을 표시
				mav.addObject("matchingDto", matchingDto);
				mav.addObject("teamCode", teamCode);
				mav.addObject("teamName",teamName);
				mav.addObject("myTeamDto", myTeamDto);
				mav.setViewName("teamPage/matchingResult");
			}else if(matchingDto.getMatchingState().equals("후")){
				// 매칭이 된 이후에는 해당 매칭에 대한 정보를 제공
				HashMap<String, Object> normalMatchInfo=dao.getNormalMatchInfo(teamCode);
				MatchingDto otherMatchingDto=null;
				
				int tempTeamCode=Integer.valueOf(String.valueOf(normalMatchInfo.get("TEAMCODE")));
				int tempTeamCode2=Integer.valueOf(String.valueOf(normalMatchInfo.get("TEAMCODE2")));
				
				if(teamCode==tempTeamCode){
					otherMatchingDto=dao.getTeamMatchingInfo(tempTeamCode2);
					otherTeamDto=dao.getTeamInfo(String.valueOf(normalMatchInfo.get("TEAM2")));
				}else if(teamCode!=tempTeamCode){
					otherMatchingDto=dao.getTeamMatchingInfo(tempTeamCode);
					otherTeamDto=dao.getTeamInfo(String.valueOf(normalMatchInfo.get("TEAM1")));
				}
				
				//상대팀 팀장 정보
				//MemberDto otherMemberDto=memberDao.getMemberInfo(otherTeamDto.getTeamCode());
				
				//일주일 날씨 파싱
				String temp=matchingDto.getMatchingPlace();
				//String temp="세종특별자치시 테스트";
				int index=temp.indexOf(" ");
				//System.out.println(index);
				String matchingPlace=temp.substring(0, index);
				if(index>4){
					matchingPlace=temp.substring(0, 2);
				}
				//System.out.println(matchingPlace);

				ArrayList<WeatherAllDTO> weatherAllList=new ArrayList<WeatherAllDTO>();
				ArrayList<WeatherAllDTO> weatherAllList2=new ArrayList<WeatherAllDTO>();
				try{
					WeatherAllParser weatherAll=new WeatherAllParser();
					weatherAllList=weatherAll.xmlRssParser();
				}catch(Exception e){
					e.printStackTrace();
				}				
				
				for(WeatherAllDTO weather : weatherAllList){					
					//System.out.println(weather.getRegion());					
					//System.out.println(matchingPlace);
					if(weather.getRegion().contains(matchingPlace) && weather.getTmEf().contains("00:00")){
						//System.out.println(weather);
						if(weather.getWf().equals("맑음")){
							weather.setWf("01.png");
						}else if( weather.getWf().equals("구름조금")){
							weather.setWf("02.png");
						}
						else if( weather.getWf().equals("구름많음")){
							weather.setWf("03.png");
						}
						else if( weather.getWf().equals("흐림")){
							weather.setWf("04.png");
						}
						else if( weather.getWf().equals("구름많고 비") || weather.getWf().equals("흐리고 비")){
							weather.setWf("05.png");
						}
						else if( weather.getWf().equals("구름많고 눈/비") || weather.getWf().equals("구름많고 비/눈") || weather.getWf().equals("흐리고 눈/비") || weather.getWf().equals("흐리고 비/눈")){
							weather.setWf("06.png");
						}
						else if( weather.getWf().equals("구름많고 눈") || weather.getWf().equals("흐리고 눈")){
							weather.setWf("07.png");
						}
						
						weatherAllList2.add(weather);
					}
				}
				
				//System.out.println(weatherAllList2);
				
				mav.addObject("weatherAllList", weatherAllList2);
				//mav.addObject("otherMemberDto", otherMemberDto);
				
				mav.addObject("normalMatchInfo",normalMatchInfo);
				mav.addObject("otherMatchingDto",otherMatchingDto);
				mav.addObject("matchingDto", matchingDto);
				mav.addObject("myTeamDto",myTeamDto);
				mav.addObject("otherTeamDto", otherTeamDto);
				mav.addObject("teamCode", teamCode);
				mav.addObject("teamName",teamName);
				mav.setViewName("teamPage/matchingResult");
			}
		}
		
	}

	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 7. 6.
	 * @author : 이희재
	 * @description : 해당 매칭 정보 삭제
	 */
	@Override
	public void deleteMatching(ModelAndView mav) {
		Map<String , Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String teamName=request.getParameter("teamName");
		int matchingCode=Integer.parseInt(request.getParameter("matchingCode"));
		
		int matchingDelete=dao.deleteMatching(matchingCode);
		
		mav.addObject("teamName", teamName);
		mav.addObject("matchingDelete",matchingDelete);
		mav.setViewName("teamBoard/okTeamBoard");
	}



	/**
	 * @name : TeamServiceImpl
	 * @date : 2015. 7. 6.
	 * @author : 이희재
	 * @description : 매칭 정보를 기반으로 서칭하기
	 */
	@Override
	public void searching(ModelAndView mav) {
		Map<String , Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int teamCode=Integer.parseInt(request.getParameter("teamCode"));
//		System.out.println(teamCode);
//		for(int i=0; i<3;i++){
//			System.out.println(i);
//			try {
//				Thread.sleep(5000);
//			} catch (InterruptedException e) {
//				
//				e.printStackTrace();
//			}
//		}
		
		dao.setWaitMatching(teamCode);
		matchingTeam(teamCode);
		int check=1;
		mav.addObject("check",check);
		mav.addObject("teamCode", teamCode);
		mav.setViewName("teamPage/matchingResult");
	}

	/**
	 * @name : viewMatchingPlace
	 * @date : 2015. 7. 9.
	 * @author : 이희재
	 * @description : 매칭을 완료한 후에 경기장 정보를 제공하기 위한 함수
	 */
	@Override
	public void viewMatchingPlace(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		int myTeamCode=Integer.parseInt(request.getParameter("myTeamCode"));
		int otherTeamCode=Integer.parseInt(request.getParameter("otherTeamCode"));

		String myTeamName=dao.getTeamInfo(myTeamCode).getTeamName();
		String otherTeamName=dao.getTeamInfo(otherTeamCode).getTeamName();
		
		MatchingDto myMatchingDto=dao.getTeamMatchingInfo(myTeamCode);
		MatchingDto	otherMatchingDto=dao.getTeamMatchingInfo(otherTeamCode);
		
		mav.addObject("myMatchingDto",myMatchingDto);
		mav.addObject("otherMatchingDto",otherMatchingDto);
		mav.addObject("myTeamName", myTeamName);
		mav.addObject("otherTeamName", otherTeamName);
		mav.setViewName("teamPage/viewMatchingPlace");
	}


	/**
	 * @name : matchingDistance
	 * @date : 2015. 7. 7.
	 * @author : 이희재
	 * @description : teamCode를 이용하여 자신의 matching 정보와 다른 팀 매칭 정보와 비교하여 매칭하는 함수
	 */
	public void matchingTeam(int teamCode){		
		MatchingDto myMatchingDto=dao.getTeamMatchingInfo(teamCode);
		List<MatchingDto> otherMatchingInfo=dao.getOtherMatchingInfo(teamCode,myMatchingDto.getMatchingSport());
		HashMap<Integer, Integer> resultMap=new HashMap<Integer, Integer>();
		
		if(otherMatchingInfo!=null){
			for(int i=0;i<otherMatchingInfo.size();i++){
				int myDistance=myMatchingDto.getMatchingDistance();
				int otherDistance=otherMatchingInfo.get(i).getMatchingDistance();
				
				int distance=calcDistance(myMatchingDto,otherMatchingInfo.get(i));
				// 두 매칭 지역간의 거리를 비교 한다.
				
				String matchingDay=compareDay(myMatchingDto,otherMatchingInfo.get(i));
				// 두 매칭 정보간의 요일 정보를 비교 (공통 부분 출력)
				
				String matchingTime=compareTime(myMatchingDto,otherMatchingInfo.get(i));
				// 두 매칭 정보간의 시간 정보 비교 (공통 부분 출력)
				
				if((distance<myDistance+otherDistance)&&(!matchingDay.equals(""))&&(!matchingTime.equals(""))){
					resultMap.put(i, distance);
				}
				// 매칭이 가능한 상태인 정보들을 hashMap에 거리와 인덱스를 저장.
				
				System.out.println("매칭 코드 : " + otherMatchingInfo.get(i).getMatchingCode());
				System.out.println("실제 측정 거리 : " +distance);
				System.out.println("매칭 거리 : "+ (myDistance + otherDistance));
				System.out.println("매칭 요일 : " + matchingDay);
				System.out.println("매칭 시간 : " + matchingTime);
				System.out.println();
			}
		}
		
		int resultIdx=getResultIdx(resultMap);
		if(resultIdx!=-1){
			dao.changeMatchingState(otherMatchingInfo.get(resultIdx));
			dao.changeMatchingState(myMatchingDto);
			dao.createGameRecord(myMatchingDto, otherMatchingInfo.get(resultIdx));
		}
		
		
	}
	
	/**
	 * @name : calcDistance
	 * @date : 2015. 7. 7.
	 * @author : 이희재
	 * @description : 위도와 경도를 이용한 거리 측정 함수 
	 */
	public int calcDistance(MatchingDto myMatchingDto,MatchingDto otherMatchingInfo){
		
		StringTokenizer myToken=new StringTokenizer(myMatchingDto.getMatchingLatlng(),",");
		double myLat=Double.parseDouble(myToken.nextToken());
		double myLng=Double.parseDouble(myToken.nextToken());
		
		String latLng=otherMatchingInfo.getMatchingLatlng();
		StringTokenizer token=new StringTokenizer(latLng,",");
		
		double otherLat=Double.parseDouble(token.nextToken());
		double otherLng=Double.parseDouble(token.nextToken());
		
		int result=(int) (Math.sqrt(Math.pow(otherLat-myLat,2)+Math.pow(otherLng-myLng, 2))*100000);
		return result;
	}
	
	/**
	 * @name : compareDay
	 * @date : 2015. 7. 8.
	 * @author : 이희재
	 * @description : 두 매칭 정보간의 요일을 비교한다.
	 */
	public String compareDay(MatchingDto myMatchingDto,MatchingDto otherMatchingInfo){
		StringTokenizer myToken=new StringTokenizer(myMatchingDto.getMatchingTime(),",");
		String otherTime=otherMatchingInfo.getMatchingTime();
		String result="";
		while(myToken.hasMoreTokens()){
			String temp=myToken.nextToken();
			if(otherTime!=null){
				if(otherTime.contains(temp)){
					result+=temp + ",";
				}
			}
		}
		return result;
	}
	
	/**
	 * @name : compareTime
	 * @date : 2015. 7. 8.
	 * @author : 이희재
	 * @description : 두 매칭 정보간의 시간 정보를 비교한다.
	 */
	public String compareTime(MatchingDto myMatchingDto,MatchingDto otherMatchingInfo){
		StringTokenizer myToken=new StringTokenizer(myMatchingDto.getMatchingDay(),",");
		String otherDay=otherMatchingInfo.getMatchingDay();
		String result="";
		while(myToken.hasMoreTokens()){
			String temp=myToken.nextToken();
			if(otherDay!=null){
				if(otherDay.contains(temp)){
					result+=temp + ",";
				}
			}
		}
		return result;
	}
	
	/**
	 * @name : getResultIdx
	 * @date : 2015. 7. 8.
	 * @author : 이희재
	 * @description : index인 key값을 이용하여 value인 거리를 출력하고 최소의 거리를 이용하여 해당 key값을 반환
	 */
	public int getResultIdx(HashMap<Integer, Integer> resultMap){
		Set<Integer> keySet=resultMap.keySet();
		Iterator<Integer> iter=keySet.iterator();
		int key=-1;
		int tempDistance=-1;
		while(iter.hasNext()){
			int tempKey=iter.next();
//			System.out.println(key + ","+resultMap.get(key));
			if(tempDistance==-1){
				tempDistance=resultMap.get(tempKey);
				key=tempKey;
			}else{
				if(tempDistance>resultMap.get(tempKey)){
					tempDistance=resultMap.get(tempKey);
					key=tempKey;
				}
			}
		}
//		System.out.println("매칭 키 : " + key);
//		System.out.println("tempDistance : "+ tempDistance);
//		System.out.println("매칭 될 거리 : " + resultMap.get(key));
		return key;
	}

	/**
	 * @name : viewOtherTeamInfo
	 * @date : 2015. 7. 10.
	 * @author : 이희재
	 * @description : 매칭이 완료된 후 상대 팀의 정보를 얻기 위한 페이지 이동
	 */
	@Override
	public void viewOtherTeamInfo(ModelAndView mav) {
		HashMap<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		int otherTeamCode=Integer.parseInt(request.getParameter("otherTeamCode"));
//		System.out.println(otherTeamCode);
		
		TeamDto otherTeam=dao.getTeamInfo(otherTeamCode);
		String otherGround=dao.getTeamGround(otherTeamCode);
		MemberDto teamLeaderDto=dao.getTeamLeaderInfo(otherTeamCode,otherTeam.getTeamLeaderName());
		
		mav.addObject("otherTeamLeader",teamLeaderDto);
		mav.addObject("otherTeam",otherTeam);
		mav.addObject("otherGround", otherGround);
		mav.setViewName("matching/viewOtherTeamInfo");
	}
}
