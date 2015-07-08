<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자페이지</title>
</head>
<body>

	<span style="font-size:30pt;">SML KOREA</span>
		<br/>
		<br/>	
	<span style="font-size:20pt;">	
		<a href="${root}/admin/manageTeam.do">회원관리페이지</a>
	</span>
	
	<span style="font-size:20pt;">	
		<a href="${root}/admin/createLeague.do">리그개설</a>
	</span>
	
	<span style="font-size:20pt;">	
		<a href="${root}/admin/manageLeague.do">리그관리</a>
	</span>
	
	<span style="font-size:20pt;">	
		<a href="${root}/admin/manageReferee.do">심판관리</a>
	</span>
	
	<span style="font-size:20pt;">	
		<a href="${root}/board/adminBoard.do">공지사항게시판</a>
	</span>
	
	
	
	
</body>
</html>
