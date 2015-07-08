<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디/비밀번호찾기</title>
</head>
<body>
<form action="${root}/email/sendEmail.do" method="POST" onsubmit="">
	<div>
		<label>이름</label>
		<input type="text" name="memberName" placeholder="이름을 입력하세요" /><br/><br/>
		
		<label>핸드폰번호</label>
		<input type="text" name="memberPhone" placeholder="핸드폰번호를 입력하세요"/><br/><br/>
		
		<input type="submit" value="인증받기"/>
		<input type="reset" value="닫기" onclick="javascript:self.close()"/>
	</div>
</form>
</body>
</html>