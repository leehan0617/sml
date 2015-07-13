<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>	
	<c:if test="${check ==1 }">
		<script type="text/javascript">
			alert("수정 완료");
			location.href="${root}/member/myInfoPage.do?teamName=${teamName }";
		</script>
	</c:if>
	
	<c:if test="${check ==0 }">
		<script type="text/javascript">
			alert("수정 실패");
			location.href="${root}/member/myInfoPage.do?teamName=${teamName }";
		</script>
	</c:if>
</body>
</html>