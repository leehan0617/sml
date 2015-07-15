package com.sml.league.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.sml.league.dao.LeagueDao;
import com.sml.league.dto.LeagueDto;
import com.sml.record.dto.RecordDto;
import com.sml.schedule.dto.ScheduleDto;
import com.sml.team.dto.TeamDto;

@Component
public class LeagueServiceImpl implements LeagueService{
	@Autowired
	private LeagueDao dao;

	/**
	 * @함수명:applicate
	 * @작성일:2015. 7. 9.
	 * @작성자:조영석
	 * @설명문:리그신청관리 서비스 메소드
	 */
	@Override
	public void applicate(ModelAndView mav) {
		Map<String,Object> map=mav.getModel();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String teamId=request.getParameter("teamId");
		int leagueCode=Integer.parseInt(request.getParameter("leagueCode"));
		int leagueTeamNumber=Integer.parseInt(request.getParameter("leagueTeamNumber"));
		int leagueCount=dao.getLeagueCount(leagueCode);
		
		if(leagueCount>=leagueTeamNumber){
			int check=-3;
			
			mav.addObject("check",check);
			mav.setViewName("soccer/applicateOk");
			
		}else{
			int teamCode=dao.getTeamCode(teamId);
			int value=dao.getLeagueJoinSelect(teamCode);
			
			if(value==0){
				int check=dao.applicate(teamCode,leagueCode);
				
				int scheduleCount=dao.getLeagueCount(leagueCode);
				
				if(scheduleCount==leagueTeamNumber){
					leagueSchedule(leagueCode);
				}
				
				mav.addObject("check",check);
				mav.setViewName("soccer/applicateOk");
			}else{
				int check=-1;
					
				mav.addObject("check",check);
				mav.setViewName("soccer/applicateOk");
			}
		}
		
	}
	
	/**
	 * @name : leagueSchedule
	 * @date : 2015. 7. 13.
	 * @author : 이희재
	 * @description : 리그 신청 후 정원이 꽉차면 리그 정보에 따른 스케쥴링 함수
	 */
	public void leagueSchedule(int leagueCode){
		LeagueDto league=dao.getLeagueInfo(leagueCode);
		int teamCount=league.getLeagueTeamNumber();
		HashMap<Integer, String> scheduleMap=new HashMap<Integer, String>();
		List<Integer> teamCodeList=dao.getLeagueJoinList(leagueCode);
		
		// 총 경기 수
		int gameCount=(teamCount*(teamCount-1))/2;
				
		String leagueTime=league.getLeagueTime();
		StringTokenizer token=new StringTokenizer(leagueTime,",");
		
		int countWeek=(gameCount/(token.countTokens()*3))+3;
		// 총 경기수 / 시간대 수 * 경기장 수 (3) + 1
		
		String leagueDay=league.getLeagueDay();
		String leaguePlace=league.getLeaguePlace();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd(EEE)");
		
		ArrayList<Date> dateList=getDateList(leagueDay, countWeek, league.getLeagueStartDate());
		
		int createCount=0;
		
		String temp="";
		for(int i=0;i<dateList.size();i++){
			token=new StringTokenizer(leagueTime,",");
			
			while(token.hasMoreTokens()){
				String tempToken=token.nextToken();
				StringTokenizer token2=new StringTokenizer(leaguePlace,",");
				while(token2.hasMoreTokens()){
					temp+=sdf.format(dateList.get(i)) + "," + tempToken + "," + token2.nextToken();
					createCount++;
					scheduleMap.put(createCount, temp);
//					System.out.println(createCount + "," + temp);
					temp="";
				}
			}
		}
//		System.out.println("완료");
//		System.out.println();

		
		ArrayList<RecordDto> scheduleList=joinTeamAndDate(teamCodeList,scheduleMap,league);
		
		// 스케쥴에 따라 gameRecord 저장
		for(int i=0;i<scheduleList.size();i++){
			dao.insertLeagueGame(scheduleList.get(i));
		}
		
		makeLeagueSchedule(scheduleList, league);
		
	}
	
	/**
	 * @name : getDateList
	 * @date : 2015. 7. 14.
	 * @author : 이희재
	 * @description : 요일에 따른 달력에 의한 날짜 추출 
	 */
	public ArrayList<Date> getDateList(String dayName, int countWeek, String startDate){
		// 주말 날짜 구하기
		ArrayList<Date> dateList=new ArrayList<Date>();
		SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
		
		Date date=new Date();
		Date dateSun=new Date();
		
		try {
			date=sdf.parse(startDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Calendar cal=Calendar.getInstance();
		cal.setTime(date);
		
		int day=date.getDay();
		
		if(day<6){
			// 이번주 토요일
			cal.add(cal.DAY_OF_WEEK, 6-day);
			date=cal.getTime();
			
			// 이번주 일요일
			cal.add(cal.DAY_OF_WEEK, 1);
			dateSun=cal.getTime();
		}
		
		if(dayName.equals("sat")){
			System.out.println("토요일------------------");
			// 토요일 날짜
			cal.setTime(date);
			dateList.add(date);
			
			for(int i=0;i<countWeek;i++){
				cal.add(Calendar.DATE, 7);
				Date tempDate=cal.getTime();
				dateList.add(tempDate);
				cal.setTime(tempDate);
			}
			
//			for(int i=0;i<dateList.size();i++){
//				System.out.println(dateList.get(i));
//			}
		}else if(dayName.equals("sun")){
			System.out.println("일요일------------------");
			// 일요일 날짜
			cal.setTime(dateSun);
			dateList.add(dateSun);
			
			for(int i=0;i<countWeek;i++){
				cal.add(Calendar.DATE, 7);
				Date tempDate=cal.getTime();
				dateList.add(tempDate);
				cal.setTime(tempDate);
			}
			
//			for(int i=0;i<dateList.size();i++){
//				System.out.println(dateList.get(i));
//			}
		}
		
		return dateList;
	}
	
	/**
	 * @name : joinTeamAndDate
	 * @date : 2015. 7. 14.
	 * @author : 이희재
	 * @description : 여러 과정을 이용하여 만든 List들을 이용하여 recordDto로 묶어주기 위한 함수
	 */
	public ArrayList<RecordDto> joinTeamAndDate(List<Integer> teamCodeList, HashMap<Integer,String> scheduleMap, LeagueDto league){
		ArrayList<RecordDto> scheduleList=new ArrayList<RecordDto>();
		List<Integer> randomKey=getRandomKey(scheduleMap.size());
		// hashMap의 key값 섞기
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd(EEE)");
		
		Collections.shuffle(teamCodeList);
		// 팀 코드 리스트 섞기
		
		int keyCount=0;
		
//		System.out.println("start");
		for(int i=0;i<teamCodeList.size();i++){
			int team1=teamCodeList.get(i);
			for(int j=i+1;j<teamCodeList.size();j++){
				int team2=teamCodeList.get(j);
				String schedule=scheduleMap.get(randomKey.get(keyCount));
				keyCount++;
				System.out.println(team1 + "," + team2 +"," + schedule +"," + keyCount);
				
				// dto 생성
				RecordDto gameRecord=new RecordDto();
				gameRecord.setTeamCode(team1);
				gameRecord.setTeamCode2(team2);
				gameRecord.setGameType(league.getLeagueCode());
				gameRecord.setRefereeNumber(3);
				gameRecord.setGameState("경기 전");
				
				StringTokenizer scheduleToken=new StringTokenizer(schedule,",");
				while(scheduleToken.hasMoreTokens()){
					try {
						Date tempDate=sdf.parse(scheduleToken.nextToken());
						gameRecord.setGameDate(tempDate);
						gameRecord.setGameTime(scheduleToken.nextToken());
						gameRecord.setGamePlace(scheduleToken.nextToken());
					} catch (ParseException e) {
						System.out.println("parse Error");
						e.printStackTrace();
					}
				}
				gameRecord.setSportType(league.getLeagueSport());
				gameRecord.setGameResult("전");
				
				int invalidTeam1=dao.invalidSchedule(gameRecord,team1);
				int invalidTeam2=dao.invalidSchedule(gameRecord,team2);
				
				if(invalidTeam1!=0){
					System.out.println(invalidTeam1);
				}
				
				if(invalidTeam2!=0){
					System.out.println(invalidTeam2);
				}
				scheduleList.add(gameRecord);
			}
		}
		return scheduleList;
	}
	
	/**
	 * @name : getRandomKey
	 * @date : 2015. 7. 14.
	 * @author : 이희재
	 * @description : HashMap의 사이즈를 이용하여 랜덤한 난수 출력
	 */
	public List<Integer> getRandomKey(int num){
		List<Integer> randomKey=new ArrayList<Integer>();
		int count=num;
		
		int keyCount=0;
//		System.out.println("getRandomKey");
		
		while(keyCount<count){
			int tempKey=(int) (Math.random()*num+1);
			if(!randomKey.contains(tempKey)){
				randomKey.add(tempKey);
				keyCount++;
			}
		}
		
		return randomKey;
	}
	
	/**
	 * @name : makeLeagueSchedule
	 * @date : 2015. 7. 14.
	 * @author : 이희재
	 * @description : 스케쥴 리스트에 따른 경기의 정보를 스케쥴러에 등록
	 */
	public void makeLeagueSchedule(ArrayList<RecordDto> scheduleList,LeagueDto league){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i=0;i<scheduleList.size();i++){
			TeamDto otherTeam=dao.getTeamInfo(scheduleList.get(i).getTeamCode2());
			
			ScheduleDto scheduleDto=new ScheduleDto();
			scheduleDto.setTeamCode(scheduleList.get(i).getTeamCode());
			scheduleDto.setScheduleType("리그");
			scheduleDto.setStartDate(sdf.format(scheduleList.get(i).getGameDate()));
			scheduleDto.setEndDate(sdf.format(scheduleList.get(i).getGameDate()));
			scheduleDto.setscheduleTitle(league.getLeagueName() + " 리그 경기");
			scheduleDto.setscheduleContent("상대 팀 : " + otherTeam.getTeamName() + ", 경기장 : " + scheduleList.get(i).getGamePlace() + ", 시간 : "+ scheduleList.get(i).getGameTime());
			
			dao.insertLeagueSchedule(scheduleDto);
		}
		
		for(int i=0;i<scheduleList.size();i++){
			TeamDto otherTeam=dao.getTeamInfo(scheduleList.get(i).getTeamCode());
			
			ScheduleDto scheduleDto=new ScheduleDto();
			scheduleDto.setTeamCode(scheduleList.get(i).getTeamCode2());
			scheduleDto.setScheduleType("리그");
			scheduleDto.setStartDate(sdf.format(scheduleList.get(i).getGameDate()));
			scheduleDto.setEndDate(sdf.format(scheduleList.get(i).getGameDate()));
			scheduleDto.setscheduleTitle(league.getLeagueName() + " 리그 경기");
			scheduleDto.setscheduleContent("상대 팀 : " + otherTeam.getTeamName() + ", 경기장 : " + scheduleList.get(i).getGamePlace() + ", 시간 : "+ scheduleList.get(i).getGameTime());
			
			dao.insertLeagueSchedule(scheduleDto);
		}
	}
}
