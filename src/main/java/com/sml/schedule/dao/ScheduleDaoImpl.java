package com.sml.schedule.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sml.schedule.dto.ScheduleDto;
import com.sml.team.dto.TeamDto;

@Component
public class ScheduleDaoImpl implements ScheduleDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	/**
	 * @함수명:editSchedule
	 * @작성일:2015. 7. 6.
	 * @작성자:조영석
	 * @설명문:스케쥴일정 값을 데이터베이스에 집어넣는 메소드 
	 */
	@Override
	public int editSchedule(ScheduleDto scheduleDto,String teamName) {
		int value=0;
		int teamCode=sqlSession.selectOne("schedule.dao.ScheduleMapper.scheduleTeamid",teamName);
		scheduleDto.setTeamCode(teamCode);
		value=sqlSession.insert("schedule.dao.ScheduleMapper.insertSchedule",scheduleDto);
		return value;
	}
	
	/**
	 * @함수명:readSchedule
	 * @작성일:2015. 7. 6.
	 * @작성자:조영석
	 * @설명문:스케쥴 정보 불러오기 메소드
	 */
	@Override
	public List<ScheduleDto> readSchedule(String teamName) {
		int teamCode=sqlSession.selectOne("schedule.dao.ScheduleMapper.scheduleTeamid",teamName);
		ScheduleDto scheduleDto=new ScheduleDto();
		scheduleDto.setTeamCode(teamCode);
		
		return sqlSession.selectList("schedule.dao.ScheduleMapper.readSchedule",scheduleDto);
	}
	
	/**
	 * @함수명:readCount
	 * @작성일:2015. 7. 6.
	 * @작성자:조영석
	 * @설명문:스케쥴 총 갯수 구하는 메소드 
	 */
	@Override
	public int readCount(String teamName) {
		int teamCode=sqlSession.selectOne("schedule.dao.ScheduleMapper.scheduleTeamid",teamName);
		
		return sqlSession.selectOne("schedule.dao.ScheduleMapper.readCount",teamCode);
	}
	
	/**
	 * @함수명:scheduleContent
	 * @작성일:2015. 7. 7.
	 * @작성자:조영석
	 * @설명문:스케쥴 세부일정 내용열람을 위한 데이터베이스연결
	 */
	@Override
	public ScheduleDto scheduleContents(int scheduleNumber) {
//		HashMap<String,Object> Hmap=new HashMap<String,Object>();
//		Hmap.put("teamCode", teamCode);
//		Hmap.put("scheduleNumber", scheduleNumber);
		return sqlSession.selectOne("schedule.dao.ScheduleMapper.scheduleContent",scheduleNumber);
	}

	/**
	 * @함수명:selectMember
	 * @작성일:2015. 7. 7.
	 * @작성자:조영석
	 * @설명문:스케쥴 권한 부여를 위한 데이터베이스연결
	 */
	@Override
	public TeamDto selectMember(int scheduleNumber) {
		int teamCode=sqlSession.selectOne("schedule.dao.ScheduleMapper.scheduleNumber",scheduleNumber);
		
		TeamDto teamDto=null;
		if(teamCode>0){
			 teamDto=sqlSession.selectOne("schedule.dao.ScheduleMapper.selectTeam",teamCode);
		}
		
		return teamDto;
	}

	/**
	 * @함수명:deleteSchedule
	 * @작성일:2015. 7. 7.
	 * @작성자:조영석
	 * @설명문:스케쥴 삭제를 위한 데이터베이스연결
	 */
	@Override
	public int deleteSchedule(int scheduleNumber) {
		
		return sqlSession.delete("schedule.dao.ScheduleMapper.deleteSchedule",scheduleNumber);
	}

	@Override
	public TeamDto getTeamDto(String teamName) {
		return sqlSession.selectOne("schedule.dao.ScheduleMapper.getTeamDto",teamName);
	}


}
