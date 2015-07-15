package com.sml.team.dto;

public class TeamDto {
	private int teamCode;
	private String teamName;
	private String teamLeaderName;
	private String teamId;
	private String teamPassword;
	private String sportType;
	private String emblem;
	private String teamGrade;
	private String path;
	private String teamIntro;
	
	public String getTeamIntro() {
		return teamIntro;
	}
	public void setTeamIntro(String teamIntro) {
		this.teamIntro = teamIntro;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(int teamCode) {
		this.teamCode = teamCode;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getTeamLeaderName() {
		return teamLeaderName;
	}
	public void setTeamLeaderName(String teamLeaderName) {
		this.teamLeaderName = teamLeaderName;
	}
	public String getTeamId() {
		return teamId;
	}
	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}
	public String getTeamPassword() {
		return teamPassword;
	}
	public void setTeamPassword(String teamPassword) {
		this.teamPassword = teamPassword;
	}
	public String getSportType() {
		return sportType;
	}
	public void setSportType(String sportType) {
		this.sportType = sportType;
	}
	public String getEmblem() {
		return emblem;
	}
	public void setEmblem(String emblem) {
		this.emblem = emblem;
	}
	public String getTeamGrade() {
		return teamGrade;
	}
	public void setTeamGrade(String teamGrade) {
		this.teamGrade = teamGrade;
	}
}
