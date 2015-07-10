package com.sml.matching.dto;

public class MatchingDto {
	private int matchingCode;
	private int teamCode;
	private String matchingSport;
	private int matchingDistance;
	private String matchingTime;
	private String matchingState;
	private String matchingDay;
	private String matchingPlace;
	private String matchingLatlng;
	
	public String getMatchingLatlng() {
		return matchingLatlng;
	}
	public void setMatchingLatlng(String matchingLatlng) {
		this.matchingLatlng = matchingLatlng;
	}
	public String getMatchingDay() {
		return matchingDay;
	}
	public void setMatchingDay(String matchingDay) {
		this.matchingDay = matchingDay;
	}
	public String getMatchingPlace() {
		return matchingPlace;
	}
	public void setMatchingPlace(String matchingPlace) {
		this.matchingPlace = matchingPlace;
	}
	public int getMatchingCode() {
		return matchingCode;
	}
	public void setMatchingCode(int matchingCode) {
		this.matchingCode = matchingCode;
	}
	public int getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(int teamCode) {
		this.teamCode = teamCode;
	}
	public String getMatchingSport() {
		return matchingSport;
	}
	public void setMatchingSport(String matchingSport) {
		this.matchingSport = matchingSport;
	}
	public int getMatchingDistance() {
		return matchingDistance;
	}
	public void setMatchingDistance(int matchingDistance) {
		this.matchingDistance = matchingDistance;
	}
	public String getMatchingTime() {
		return matchingTime;
	}
	public void setMatchingTime(String matchingTime) {
		this.matchingTime = matchingTime;
	}
	public String getMatchingState() {
		return matchingState;
	}
	public void setMatchingState(String matchingState) {
		this.matchingState = matchingState;
	}
	
	
}
