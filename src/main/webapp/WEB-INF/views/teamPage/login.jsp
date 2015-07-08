<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3 align="center"> SML Korea </h3> 
	
	<form action="${root }/teamPage/login.do" method="POST">
		<div id="test2" align="center">
			<label>아이디</label><input type="text"  name="id"/><br/>
			<label>비밀번호</label><input type="password"  name="password"/><br/>
			<a href="#">아이디/비밀번호찾기</a><br/>
			
			<input type="submit" value="로그인"/>
			<input type="reset" value="취소"/>
		</div>
	</form>
</body>
</html>