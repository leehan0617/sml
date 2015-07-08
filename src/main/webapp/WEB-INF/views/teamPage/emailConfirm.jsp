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
		<c:when test="${hintNumber == null }">
			<script type="text/javascript">
			alert("이름 또는 핸드폰번호가 틀립니다");
			</script>
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
		</c:when>
		<c:otherwise>
			<form action="">
			<div>
			<label>인증번호를 써주세요.</label><input type="text" name="hintNumber"/>
			</div>
			<h3>${hintNumber }</h3>
	</form>		
		</c:otherwise>
	</c:choose>
	
	
</body>
</html>