<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매칭페이지</title>
</head>
<body>	
	<c:if test="${check>0 }">
		<script type="text/javascript">
			alert("결과 입력에 성공하였습니다.");
			location.href="${root}/team/teamMain.do?teamName=${teamName}";
		</script>
	</c:if>
	
	<c:if test="${check==0 }">
		<script type="text/javascript">
			alert("결과 입력에 실패하였습니다.");
			location.href="${root}/team/teamMain.do?teamName=${teamName}";
		</script>
	</c:if>
	
</body>
</html>
		
