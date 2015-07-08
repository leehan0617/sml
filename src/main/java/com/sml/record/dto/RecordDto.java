package com.sml.record.dto;

import java.util.Date;

public class RecordDto {
	private int gameCode;
	private int teamCode;
	private int teamCode2;
	private int gameType;
	private int refereeNumber;
	private String gameState;
	private Date gameDate;
	private String gamePlace;
	private String gameResult;
	private String sportType;
	public String getSportType() {
		return sportType;
	}
	public void setSportType(String sportType) {
		this.sportType = sportType;
	}
	public int getGameCode() {
		return gameCode;
	}
	public void setGameCode(int gameCode) {
		this.gameCode = gameCode;
	}
	public int getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(int teamCode) {
		this.teamCode = teamCode;
	}
	public int getTeamCode2() {
		return teamCode2;
	}
	public void setTeamCode2(int teamCode2) {
		this.teamCode2 = teamCode2;
	}
	public int getGameType() {
		return gameType;
	}
	public void setGameType(int gameType) {
		this.gameType = gameType;
	}
	public int getRefereeNumber() {
		return refereeNumber;
	}
	public void setRefereeNumber(int refereeNumber) {
		this.refereeNumber = refereeNumber;
	}
	public String getGameState() {
		return gameState;
	}
	public void setGameState(String gameState) {
		this.gameState = gameState;
	}
	public Date getGameDate() {
		return gameDate;
	}
	public void setGameDate(Date gameDate) {
		this.gameDate = gameDate;
	}
	public String getGamePlace() {
		return gamePlace;
	}
	public void setGamePlace(String gamePlace) {
		this.gamePlace = gamePlace;
	}
	public String getGameResult() {
		return gameResult;
	}
	public void setGameResult(String gameResult) {
		this.gameResult = gameResult;
	}
	
	
}
