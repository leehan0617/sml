<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Logout</title>
</head>
<body>
	<c:remove var="teamGrade" scope="session"/>
	<c:remove var="teamId" scope="session"/>
	<c:remove var="teamName" scope="session"/>
	
	<script>
		alert("로그아웃 성공");
		location.href="${root}/start.jsp";
	</script>
</body>
</html>