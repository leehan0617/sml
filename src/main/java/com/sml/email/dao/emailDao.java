package com.sml.email.dao;


import com.sml.member.dto.MemberDto;

public interface emailDao {
	public MemberDto search(String memberName,String memberPhone);

	public int addCertification(String number,String phone);

	public String getCertificationNumber(String phone);
}
