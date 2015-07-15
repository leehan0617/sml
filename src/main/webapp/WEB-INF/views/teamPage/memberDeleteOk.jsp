<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	<c:if test="${check>0 }">
		<script type="text/javascript">
			alert("삭제완료");
			location.href="${root}/teamPage/teamMemberInfo.do?teamName=${teamName}&teamCode=${teamCode}&teamGrade=${teamGrade}";
		</script>
	</c:if>
	
	<c:if test="${check==0 }">
		<script type="text/javascript">
			alert("삭제실패");
			location.href="${root}/teamPage/teamMemberInfo.do?teamName=${teamName}&teamCode=${teamCode}&teamGrade=${teamGrade}";
		</script>
	</c:if>
</body>
</html>