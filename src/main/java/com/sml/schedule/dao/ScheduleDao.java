package com.sml.schedule.dao;

import java.util.List;

import com.sml.schedule.dto.ScheduleDto;
import com.sml.team.dto.TeamDto;

public interface ScheduleDao {
	public int editSchedule(ScheduleDto scheduleDto,String teamId);
	public List<ScheduleDto> readSchedule(String teamName);
	public int readCount(String teamId);
	public ScheduleDto scheduleContents(int scheduleNumber);
	public TeamDto selectMember(int scheduleNumber);
	public int deleteSchedule(int scheduleNumber);
}
