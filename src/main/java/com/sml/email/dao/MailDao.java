package com.sml.email.dao;



public interface MailDao {
	public int checkInfo(String name, String phone);

	public int findTeamCode(String name, String phone);

	public String findEmail(String name, String phone);

	public void insertAuthenticationInfo(String authenticationNumber,int teamCode);

	public String findMyAccount(int teamCode, String userNumber);

	public void deleteAuthenticationData(int teamCode, String userNumber);

	public int updateInfo(String teamId, String teamPassword);
}
