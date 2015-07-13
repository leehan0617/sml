<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div>
		<h3>팀 정보</h3>
		<img src="${root }/img/teamImg/${teamDto.emblem}" alt="팀 로고"/>
		<div>팀명 : ${teamDto.teamName }</div>
		<div>팀 아이디 : ${teamDto.teamId }</div>
		<div>팀장이름 : ${teamDto.teamLeaderName }</div>
		<div>팀 종목 : ${teamDto.sportType }</div>	
		<div>홈구장 : ${homeGround }</div>	
		<a href="${root }/team/updateTeamInfo.do?teamName=${teamDto.teamName }">수정하기</a>
	</div>
	
	
	<div>
		<h3>내 프로필</h3>
		<div>이름 : ${memberDto.memberName}</div>
		<div>생년월일 : ${memberDto.memberBirth}</div>
		<div>지역 : ${memberDto.memberRegion}</div>
		<div>이메일 : ${memberDto.memberEmail}</div>
		<div>연락처 : ${memberDto.memberPhone}</div>
		<div>성별 : ${memberDto.memberGender}</div>
		<a href="${root }/member/updateMemberInfo.do?teamName=${teamDto.teamName }">수정하기</a>
	</div>
	
</body>
</html>