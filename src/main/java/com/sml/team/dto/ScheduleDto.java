package com.sml.team.dto;

import java.util.Date;

public class ScheduleDto {
	private int scheduleNumber;
	private int teamCode;
	private String scheduleType;
	private String scheduleTitle;
	private String scheduleContent;
	private Date scheduleDate;
	
	
	public String getscheduleTitle() {
		return scheduleTitle;
	}
	public void setscheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}
	public String getscheduleContent() {
		return scheduleContent;
	}
	public void setscheduleContent(String scheduleContent) {
		this.scheduleContent = scheduleContent;
	}
	public int getScheduleNumber() {
		return scheduleNumber;
	}
	public void setScheduleNumber(int scheduleNumber) {
		this.scheduleNumber = scheduleNumber;
	}
	public int getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(int teamCode) {
		this.teamCode = teamCode;
	}
	public String getScheduleType() {
		return scheduleType;
	}
	public void setScheduleType(String scheduleType) {
		this.scheduleType = scheduleType;
	}
	public Date getScheduleDate() {
		return scheduleDate;
	}
	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}
}
