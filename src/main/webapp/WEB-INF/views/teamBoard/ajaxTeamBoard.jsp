<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:set var="count" value="${count}"></c:set>
<c:set var="boardSize" value="${boardSize}"></c:set>
<c:set var="blockSize" value="${blockSize}"></c:set>
<c:set var="blockCount" value="${blockCount}"></c:set>
<fmt:parseNumber var="rs" value="${(currentPage-1)/blockSize}" integerOnly="true"></fmt:parseNumber>
<c:set var="startBlock" value="${rs*blockSize+1 }"></c:set>
<c:set var="endBlock" value="${startBlock+blockSize-1}"></c:set>

<div class="ajaxPaging">
	<table class="table table-striped">
	<thead>
		<tr> <th>글번호</th> <th>제목</th> <th>작성자</th><th>작성일</th> </tr> 
	</thead>
	<tbody>
		<c:forEach var="board" items="${teamBoardList}">
		<tr>
			<td style="width:15%">${board.rnum}</td>
			<td style="width:55%">
				<a href="${root }/teamPage/readTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}&boardNumber=${board.boardNumber}">${board.boardTitle}</a>
			</td>
			<td style="width:15%">${board.boardWriter }</td>
			<td style="width:15%"><fmt:formatDate value="${board.boardDate }" pattern="yy-MM-dd"/></td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
	
	<nav>
  <ul class="pager">
  	<c:if test="${startBlock>blockSize}">
  		<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${teamName}&currentPage=${startBlock-blockSize}">Previous</a></li>
  	</c:if>
  	<c:if test="${endBlock>blockCount}">
		<c:set var="endBlock" value="${blockCount}"></c:set>
	</c:if>
	
	<c:forEach var="blockNumber" begin="${startBlock }" end="${endBlock }">
		<li><a onclick="paging('${root }','${teamName}','${blockNumber }')">${blockNumber }</a>
	</c:forEach>
    <c:if test="${endBlock<blockCount}">
		<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${teamName}&currentPage=${startBlock+blockSize}">Next</a></li>
	</c:if>
  </ul>
</nav>
	
</div>