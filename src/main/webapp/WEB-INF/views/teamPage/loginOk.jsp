<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/external/jquery-1.11.3.min.js"></script>
<body>
	<c:set var="teamGrade" value="${teamGrade}" scope="session"></c:set>
	<c:set var="teamId" value="${teamId}"  scope="session"></c:set>
	<c:set var="teamName" value="${teamName}" scope="session"></c:set>
	
	<c:if test="${teamGrade!=null}">
		<script type="text/javascript">
			alert("환영합니다");
			$(location).attr("href","${root}/teamPage/teamPageMain.do?teamName=${teamName}"); 
		</script>
	</c:if>
	
	<c:if test="${teamGrade==null}">
		<script type="text/javascript">
			alert("아이디및 비밀번호가 잘못되었습니다");
			$(location).attr("href","${root}/start.jsp"); 
		</script>
	</c:if>
</body>
</html>