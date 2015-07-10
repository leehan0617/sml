<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${root }/js/teamPage/teamPage.js"></script>
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
	
	<h1>공지사항</h1>
	<br/>
	<input type="button" value="글 쓰기" onclick="location.href='${root}/teamPage/writeTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}'"/>
	<div>
		<span>글 번호</span>
		<span>작성자</span>
		<span>글 제목</span>
		<span>작성일</span>
	</div>
	<c:set var="count" value="${count}"></c:set>
	<c:set var="boardSize" value="${boardSize}"></c:set>
	<c:set var="blockSize" value="${blockSize}"></c:set>
	<c:set var="blockCount" value="${blockCount}"></c:set>
	<fmt:parseNumber var="rs" value="${(currentPage-1)/blockSize}" integerOnly="true"></fmt:parseNumber>
	
	<c:set var="startBlock" value="${rs*blockSize+1 }"></c:set>
	<c:set var="endBlock" value="${startBlock+blockSize-1}"></c:set>
	
	<c:forEach var="board" items="${teamBoardList}">
		<div>
			<span>${board.rnum}</span>
			<span>${board.boardWriter}</span>
			<span><a href="${root }/teamPage/readTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}&boardNumber=${board.boardNumber}">${board.boardTitle}</a></span>
			<span>${board.boardDate}</span>
			<c:if test="${teamGrade != null }">
				<input type="button" value="삭제" onclick="deleteBoard('${root}','${teamName}','${currentPage}','${board.boardNumber}')"/>
			</c:if>
		</div>
	</c:forEach>
	
	<c:if test="${startBlock>blockSize}">
		<a href="${root }/teamPage/manageTeamBoard.do?teamName=${teamName}&currentPage=${startBlock-blockSize}">[이전]</a>
	</c:if>
	
	<c:if test="${endBlock>blockCount}">
		<c:set var="endBlock" value="${blockCount}"></c:set>
	</c:if>
	
	<c:forEach var="blockNumber" begin="${startBlock}" end="${endBlock}">
		<a href="${root }/teamPage/manageTeamBoard.do?teamName=${teamName}&currentPage=${blockNumber}">[${blockNumber}]</a>
	</c:forEach>
	
	<c:if test="${endBlock<blockCount}">
		<a href="${root }/teamPage/manageTeamBoard.do?teamName=${teamName}&currentPage=${startBlock+blockSize}">[다음]</a>
	</c:if>
	
</body>
</html>