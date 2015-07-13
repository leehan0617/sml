package com.sml.member.dao;

import java.util.HashMap;
import java.util.List;

import com.sml.member.dto.MemberDto;

public interface MemberDao {
	public int insertMember(MemberDto memberDto,String teamId,String teamPassword,String teamName,String sportType,String teamGrade,String teamReaderName,String emblem, String homeGround, String path);
	public List<MemberDto> teamMemberInfo();
	public MemberDto getMemberInfo(int teamCode);
	public int updateMemberInfoOk(MemberDto memberDto, int teamCode);
	
}
