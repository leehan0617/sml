<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${count==0}">	
		<tr>
			<td align="center">게시판에 저장된 글이 없습니다.</td>
		</tr>		
	</c:if>
	
	<c:if test="${count>0}">	
		<tr> 
			<td align="center" width="30">종목</td>	
			<td align="center" width="250">제목</td>
			<td align="center" width="70">날짜</td>			
		</tr>		
	<br/>
	</c:if>	
	
	<c:forEach var="commonBoard" items="${commonBoardList}">
		<tr>				
			<td><a href="${root }/soccer/readCommonBoard.do?boardNumber=${commonBoard.boardNumber}&pageNumber=${currentPage}">${commonBoard.boardTitle}</a></td>					
			<td><fmt:formatDate value="${commonBoard.boardDate}" type="date"/></td>
		</tr>			
	</c:forEach><br/>
	
	<!-- 페이지 번호 -->
	<center>
		<c:if test="${count>0 }">
			<c:set var="pageBlock" value="${5}"/>
			<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/>
			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
			
			<c:set var="startPage" value="${rs*pageBlock+1 }"/>
			<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
			
			<c:if test="${endPage>pageCount }">
				<c:set var="endPage" value="${pageCount }"/>
			</c:if>
			
			<c:if test="${startPage>pageBlock }">
				<a href="${root }/board/adminBoard.do?pageNumber=${startPage-pageBlock}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="${root }/board/adminBoard.do?pageNumber=${i}">[${i }]</a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<a href="${root }/board/adminBoard.do?pageNumber=${startPage+pageBlock}">[다음]</a>
			</c:if>
		</c:if>
	</center>
</body>
</html>