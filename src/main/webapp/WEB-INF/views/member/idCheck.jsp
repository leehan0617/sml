<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중복 체크</title>
<script type="text/javascript" src="${root}/resources/js/jquery.js"></script>
</head>
<body>
	<c:if test="${check!=null}">
		<div align="center"> 사용중인 아이디 입니다.</div>
		<form action="${root}/member/idCheck.do" method="get">
			<input type="text" name="teamId"/>
			<input type="submit" value="확인"/>
		</form>
	</c:if>
	
	<c:if test="${check==null}">
		<div align="center">사용 가능한 아이디입니다</div>
		
		<a href="javascript:window.opener.registerModal.teamId.value='${teamId}';close();">닫기</a>
	</c:if>
	
	
</body>
</html>