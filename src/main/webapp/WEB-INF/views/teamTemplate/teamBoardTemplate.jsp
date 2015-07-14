<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<script src="${root }/resources/js/jquery.js"></script>
<script src="${root }/resources/js/teamMain.js"></script>
<c:set var="count" value="${count}"></c:set>
<c:set var="boardSize" value="${boardSize}"></c:set>
<c:set var="blockSize" value="${blockSize}"></c:set>
<c:set var="blockCount" value="${blockCount}"></c:set>
<fmt:parseNumber var="rs" value="${(currentPage-1)/blockSize}" integerOnly="true"></fmt:parseNumber>

<c:set var="startBlock" value="${rs*blockSize+1 }"></c:set>
<c:set var="endBlock" value="${startBlock+blockSize-1}"></c:set>
	
<h3 style="text-align:center">공지사항</h3>
<br/>
<div class="table-responsive">
<table class="table table-striped">
	<thead>
		<tr> <th>글번호</th> <th>제목</th> <th>작성자</th><th>작성일</th> </tr> 
	</thead>
	<tbody>
		 <c:forEach var="board" items="${teamBoardList}">
		<tr>
			<td style="width:10%">${board.rnum}</td>
			<td style="width:50%">
				<a href="${root }/teamPage/readTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}&boardNumber=${board.boardNumber}" data-toggle="modal" data-target="#modalBoardRead">${board.boardTitle}</a>
			</td>
			<td style="width:10%">${board.boardWriter }</td>
			<td style="width:30%"><fmt:formatDate value="${board.boardDate }" pattern="yy-MM-dd"/></td>
		</tr>
		</c:forEach>
	</tbody>
</table>

</div>
