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
<script src="${root }/js/teamPage/teamMatching.js"></script>
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
	
	<h3>matching(${teamName })</h3>
	<br/>
	
	
	<c:if test="${matchingDto.matchingState=='후' }">
	<h1>Result Matching</h1>
	<div style="font-size: 40px; font: bold;">
		${normalMatchInfo.TEAM1 }
		<span style="color: red;">VS</span>
		${normalMatchInfo.TEAM2 }
	</div>
	
		<c:if test="${normalMatchInfo.TEAM1==teamName }"><div>team1</div>
			<h2>나의 팀</h2>
			<h4>emblem : ${myTeamDto.emblem }</h4>
			<h4>name : ${normalMatchInfo.TEAM1}</h4>
			<h4>place : ${matchingDto.matchingPlace}</h4>
			<h4>Day : ${matchingDto.matchingDay}</h4>
			<h4>Time : ${matchingDto.matchingTime}</h4>
			<br/><br/>
			
			<h2>상대 팀</h2>
			<h4>emblem : ${otherTeamDto.emblem }</h4>
			<h4>name : ${normalMatchInfo.TEAM2 }</h4>
			<h4>place : ${otherMatchingDto.matchingPlace}</h4>
			<h4>Day : ${otherMatchingDto.matchingDay}</h4>
			<h4>Time : ${otherMatchingDto.matchingTime}</h4>
			<br/><br/>
		</c:if>
		<c:if test="${normalMatchInfo.TEAM2==teamName }"><div>team2</div>
			<h2>나의 팀</h2>
			<h4>emblem : ${myTeamDto.emblem }</h4>
			<h4>name : ${normalMatchInfo.TEAM2}</h4>
			<h4>place : ${matchingDto.matchingPlace}</h4>
			<h4>Day : ${matchingDto.matchingDay}</h4>
			<h4>Time : ${matchingDto.matchingTime}</h4>
			<br/><br/>
			
			<h2>상대 팀</h2>
			<h4>emblem : ${otherTeamDto.emblem }</h4>
			<h4>name : ${normalMatchInfo.TEAM1 }</h4>
			<h4>place : ${otherMatchingDto.matchingPlace}</h4>
			<h4>Day : ${otherMatchingDto.matchingDay}</h4>
			<h4>Time : ${otherMatchingDto.matchingTime}</h4>
			<br/><br/>
		</c:if>
	
	<h2>날씨 정보 넣어야 함</h2>
	<br/>
	
	<h3>경기장 정보 부분 </h3>
	
	<input type="button" value="경기 결과 입력">
	<input type="button" value="경기장 정보" onclick="viewMatchingPlace('${root }','${myTeamDto.teamCode }','${otherTeamDto.teamCode }')">
	<input type="button" value="상대 팀 및 팀장 정보" onclick="viewOtherTeamInfo('${root}','${otherMatchingDto.teamCode}')">
	</c:if>
	
	<c:if test="${matchingDto.matchingState=='중' }">
		<h1>Waiting Matching</h1>
		<h2>애니메이션 삽입</h2>
		<h4>emblem : ${myTeamDto.emblem }</h4>
		<h4>name : ${myTeamDto.teamName }</h4>
		<h4>place : ${matchingDto.matchingPlace}</h4>
		<h4>Day : ${matchingDto.matchingDay}</h4>
		<h4>Time : ${matchingDto.matchingTime}</h4>
		<br/><br/>
		
		<div style="color:green;"><h5>도움말 : 매칭이 잘 이루어지지 않는다면..</h5></div>
		<h6> -> 거리, 요일, 시간대 등의 조건을 넓히면 매칭이 더욱 쉬워 질 수 있습니다. </h6>
		<input type="button" value="매칭 취소" onclick="javascript:location.href='${root}/teamPage/deleteMatching.do?matchingCode=${matchingDto.matchingCode }&teamName=${teamName}'">
	</c:if>
</body>
</html>