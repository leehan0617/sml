<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매칭페이지</title>
</head>
<script src="${root }/js/jquery/jquery.js"></script>
<script src="${root }/js/teamPage/teamPage.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1442260e0c6af86974001269a7312e42&libraries=services"></script>
<link href="${root}/css/teamPage/matchingMap.css" type="text/css" rel="stylesheet"/>
<body>
	<div>
		<a href="${root}/mainPage.jsp"><img alt="logo" src=""></a>
		<a href="${root}/mainPage.jsp">SML Korea</a>
	</div>
	<br/><br/>

	<c:if test="${teamGrade != null }">
		<li>${teamId }님</li>
		<li><a href="${root }/teamPage/teamPageMain.do?teamName=${teamName}">메인</a></li>
		<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${teamName}">팀 공지사항</a></li>
		<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${teamName}">팀원소개</a></li>
		<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${teamName}">팀 기록</a></li>
		<li><a href="${root }/viewSchedule.do">팀 스케쥴</a></li>
		<li>----------</li>
		<li><a href="${root }/teamPage/manageTeamBoard.do?teamName=${teamName}">공지사항관리</a></li>
		<li><a href="${root }/teamPage/manageTeamMember.do?teamName=${teamName}">팀원관리</a></li>
		<li><a href="${root }/manageTeamSchedule.do">스케쥴관리</a></li>
		<li><a href="${root }/startMatching.do">매칭관리</a></li>
		<li>-----------</li>
		<li><a href="${root}/teamPage/logout.do?teamId='${teamId}'">로그아웃</a></li>
  	</c:if>
  	
  	<c:if test="${teamGrade == null }">
		<li><a href="${root }/teamPage/teamPageMain.do?teamName=${teamName}">메인</a></li>
		<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${teamName}">팀 공지사항</a></li>
		<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${teamName}">팀원소개</a></li>
		<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${teamName}">팀 기록</a></li>
		<li><a href="${root }/viewSchedule.do">팀 스케쥴</a></li>
	</c:if>
	
	<h1>otherTeamInfo</h1>
	
	<div><span style="font-weight: bold">팀 로고 : </span><span>${otherTeam.emblem }</span></div>
	<div><span style="font-weight: bold">팀 이름 : </span><span>${otherTeam.teamName }</span></div>
	<div><span style="font-weight: bold">팀 연고지 : </span><span>${otherGround }</span></div>
	
	<h3>TeamLeader Info</h3>
	<div><span style="font-weight: bold">팀장 이름 : </span><span>${otherTeamLeader.memberName }</span></div>
	<div><span style="font-weight: bold">팀장 성별 : </span><span>${otherTeamLeader.memberGender }</span></div>
	<div><span style="font-weight: bold">팀장 번호 : </span><span>${otherTeamLeader.memberPhone }</span></div>
	<br/><br/>
	
	<input type="button" value="상대 팀 페이지로 이동" onclick="javascript:location.href='${root}/team/teamMain.do?teamName=${otherTeam.teamName }'">
</body>
</html>