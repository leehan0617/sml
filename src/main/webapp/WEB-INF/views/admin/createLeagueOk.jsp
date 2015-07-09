<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>리그개설</title>
</head>
<body>
	<c:if test="${check>0}">
		<script type="text/javascript">
			alert("리그개설완료");
			location.href="${root}/admin/createLeague.do";
		</script>	
	</c:if>
	
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("리그개설미완료");
			location.href="${root}/admin/createLeague.do";
		</script>	
	</c:if>
	
		
</body>
</html>