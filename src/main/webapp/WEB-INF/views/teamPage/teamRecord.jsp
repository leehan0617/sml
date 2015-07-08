<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<a href="${root}/start.jsp"><img alt="logo" src=""></a>
		<a href="${root}/start.jsp">SML Korea</a>
	</div>

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
	
	<h1>팀 기록실 </h1>
	<br/>
	<div>
		<span>게임</span>
		<span>TEAM A</span>
		<span>&nbsp;&nbsp;</span>
		<span>TEAM B</span>
		<span>RESULT</span>
		<span>PLACE</span>
		<span>STATE</span>
		<span>TYPE</span>
		<span>REFEREE</span>
	</div>
	<br/>
	<c:set var="count" value="${count}"></c:set>
	<c:set var="boardSize" value="${boardSize}"></c:set>
	<c:set var="blockSize" value="${blockSize}"></c:set>
	<c:set var="blockCount" value="${blockCount}"></c:set>
	<fmt:parseNumber var="rs" value="${(currentPage-1)/blockSize}" integerOnly="true"></fmt:parseNumber>
	
	<c:set var="startBlock" value="${rs*blockSize+1 }"></c:set>
	<c:set var="endBlock" value="${startBlock+blockSize-1}"></c:set>
	
	<c:forEach var="record" items="${recordList}">
		<div>
			<span>${record.GAMECODE}</span>
			<c:if test="${record.TEAM1==teamName }">
				<span style="color:blue;">${record.TEAM1}</span>
			</c:if>
			<c:if test="${record.TEAM1!=teamName }">
				<span>${record.TEAM1}</span>
			</c:if>
			<span style="color:red;">VS</span>
			<c:if test="${record.TEAM2==teamName }">
				<span style="color:blue;">${record.TEAM2}</span>
			</c:if>
			<c:if test="${record.TEAM2!=teamName }">
				<span>${record.TEAM2}</span>
			</c:if>
			<span>${record.GAMERESULT}</span>
			<span>${record.GAMEPLACE}</span>
			<span>${record.GAMESTATE}</span>
			<span>${record.GAMETYPE}</span>
			<span>${record.REFEREENUMBER}</span>
		</div>
	</c:forEach>
	
	<c:if test="${startBlock>blockSize}">
		<a href="${root }/teamPage/viewTeamRecord.do?teamName=${teamName}&currentPage=${startBlock-blockSize}">[이전]</a>
	</c:if>
	
	<c:if test="${endBlock>blockCount}">
		<c:set var="endBlock" value="${blockCount}"></c:set>
	</c:if>
	
	<c:forEach var="blockNumber" begin="${startBlock}" end="${endBlock}">
		<a href="${root }/teamPage/viewTeamRecord.do?teamName=${teamName}&currentPage=${blockNumber}">[${blockNumber}]</a>
	</c:forEach>
	
	<c:if test="${endBlock<blockCount}">
		<a href="${root }/teamPage/viewTeamRecord.do?teamName=${teamName}&currentPage=${startBlock+blockSize}">[다음]</a>
	</c:if>
	
	
</body>
</html>