package com.sml.schedule.dto;

public class ScheduleDto {
	private int scheduleNumber;
	private int teamCode;
	private String startDate;
	private String endDate;
	private String scheduleType;
	private String scheduleTitle;
	private String scheduleContent;
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
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
}
