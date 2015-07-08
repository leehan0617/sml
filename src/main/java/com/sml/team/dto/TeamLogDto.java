/**
 * 
 */
package com.sml.team.dto;

import java.util.Date;

/**
 
 * @작성일: 2015. 7. 3.
 * @작성자: 정성남
 * @설명 :
 */
public class TeamLogDto {
	private int replyCode;
	private int teamCode;
	private String replyNickName;
	private String replyPassword;
	private String replyContent;
	private Date replyDate;
	
	public int getReplyCode() {
		return replyCode;
	}
	public void setReplyCode(int replyCode) {
		this.replyCode = replyCode;
	}
	public int getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(int teamCode) {
		this.teamCode = teamCode;
	}
	public String getReplyNickName() {
		return replyNickName;
	}
	public void setReplyNickName(String replyNickName) {
		this.replyNickName = replyNickName;
	}
	public String getReplyPassword() {
		return replyPassword;
	}
	public void setReplyPassword(String replyPassword) {
		this.replyPassword = replyPassword;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	
	
}
