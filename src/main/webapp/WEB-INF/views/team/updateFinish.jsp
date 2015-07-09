<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${check > 0 }">
			<script>
				alert("정보변경 완료");
				location.href="${root}/start.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("정보변경 실패");
				location.href="${root}/start.jsp";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>