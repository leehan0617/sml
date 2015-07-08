package com.sml.common.dto;

import java.util.Date;

public class CommonBoardDto {
	private int boardNumber;
	private int sportCode;
	private String boardWriter;
	private Date boardDate;
	private String boardTitle;
	private String boardContent;
	
	public int getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}
	
	public int getSportCode() {
		return sportCode;
	}
	public void setSportCode(int sportCode) {
		this.sportCode = sportCode;
	}
	
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
}
