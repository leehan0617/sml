<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table class="table table-striped">
	<thead>
		<tr> 
			<th style="width:15%">글번호</th><th style="width:45%">제목</th><th style="width:15%">작성자</th><th style="width:25%">작성일</th> 
		</tr> 
	</thead>
	<tbody>
		<c:forEach var="list" items="${teamBoardList}">
			<tr>
				<td>${list.rnum }</td>
				<td>${list.boardTitle }</td>
				<td>${list.boardWriter }</td>
				<td><fmt:formatDate value="${list.boardDate }" pattern="yy-MM-dd"/></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<span>공지를 더 확인하려면 여기를 클릭하세요.</span>