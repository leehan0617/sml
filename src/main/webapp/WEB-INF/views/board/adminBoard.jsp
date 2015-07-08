<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 목록보기</title>
</head>
<body>
	<form class=""  action="${root }/board/deleteCommonBoard.do" method="GET">
	<table width="530" align="center">
		<tr>
			<td align="right" bgcolor="D1DBDB"><a href="${root }/board/addCommonBoard.do">글쓰기</a></td>
		</tr>
	</table>
	
	<c:if test="${count==0}">	
		<tr>
			<td align="center">게시판에 저장된 글이 없습니다.</td>
		</tr>		
	</c:if>
	
	<c:if test="${count>0}">	
		<tr> 
			<td align="center" width="30">종목</td>
			<td align="center" width="30">작성자</td>	
			<td align="center" width="250">제목</td>
			<td align="center" width="70">날짜</td>			
		</tr>		
	<br/>
	</c:if>	
	
	<c:forEach var="commonBoard" items="${commonBoardList}">
		<tr>			
			<td>
				<c:if test="${commonBoard.sportCode=='0'}">
					<td>전체</td>
				</c:if>
				
				<c:if test="${commonBoard.sportCode=='1'}">
					<td>축구</td>
				</c:if>
				
				<c:if test="${commonBoard.sportCode=='2'}">
					<td>야구</td>
				</c:if>
				
				<c:if test="${commonBoard.sportCode=='3'}">
					<td>족구</td>
				</c:if>
				
				<c:if test="${commonBoard.sportCode=='4'}">
					<td>풋살</td>
				</c:if>				
			</td>
			<td>${commonBoard.boardWriter}</td>
			<td><a href="${root }/board/readCommonBoard.do?boardNumber=${commonBoard.boardNumber}&pageNumber=${currentPage}">${commonBoard.boardTitle}</a></td>					
			<td><fmt:formatDate value="${commonBoard.boardDate}" type="date"/></td>
		</tr>
			&nbsp;&nbsp;
			<a href="${root }/board/deleteCommonBoard.do?boardNumber=${commonBoard.boardNumber}">[삭제]</a>
			&nbsp;&nbsp;
			<br/>
	</c:forEach>
	
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
</form>		
</body>
</html>