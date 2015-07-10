<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<h1>공지사항</h1>
<br/>
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
	</div>
</c:forEach>

<c:if test="${startBlock>blockSize}">
	<a href="${root }/teamPage/viewTeamBoard.do?teamName=${teamName}&currentPage=${startBlock-blockSize}">[이전]</a>
</c:if>

<c:if test="${endBlock>blockCount}">
	<c:set var="endBlock" value="${blockCount}"></c:set>
</c:if>

<c:forEach var="blockNumber" begin="${startBlock}" end="${endBlock}">
	<a href="${root }/teamPage/viewTeamBoard.do?teamName=${teamName}&currentPage=${blockNumber}">[${blockNumber}]</a>
</c:forEach>

<c:if test="${endBlock<blockCount}">
	<a href="${root }/teamPage/viewTeamBoard.do?teamName=${teamName}&currentPage=${startBlock+blockSize}">[다음]</a>
</c:if>
