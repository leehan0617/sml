package com.sml.member.dao;

import java.util.HashMap;
import java.util.List;

import com.sml.member.dto.MemberDto;
import com.sml.team.dto.TeamDto;

public interface MemberDao {
	public int insertMember(MemberDto memberDto,String teamId,String teamPassword,String teamName,String sportType,String teamGrade,String teamReaderName,String emblem, String homeGround, String path);
	public List<MemberDto> teamMemberInfo();
	public MemberDto getMemberInfo(int teamCode);
	public int updateMemberInfoOk(MemberDto memberDto, int teamCode);
	public List<MemberDto> getTeamMemberList(String teamName,int startRow, int endRow);
	public int getTeamMemberCount(int teamCode);
	public TeamDto getTeamInfo(String teamName);	
	public int addMember(MemberDto member);
	public int deleteMember(int memberCode);
	
}
