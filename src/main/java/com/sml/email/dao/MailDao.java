package com.sml.email.dao;



public interface MailDao {
	public int checkInfo(String name, String phone);

	public int findTeamCode(String name, String phone);

	public String findEmail(String name, String phone);
}
