<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${root }/resources/css/bootstrap.css"/>
<title>인증번호 인증란</title>
<style>
	body {
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #eee;
}

.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>
</head>

<body>
	<c:choose>
		<c:when test="${check == 0 }">
			<script type="text/javascript">
			alert("이름 또는 핸드폰번호에 관한 정보가 없습니다.");
			location.href="${root}/start.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<div class="container">
				<form class="form-signin" action="${root }/checkAuthentication" method="post">
		        <h2 class="form-signin-heading">인증번호를 써주세요.</h2>
		        <label class="sr-only">인증번호</label>
		        <input type="text" name="userNumber" id="number" class="form-control" placeholder="인증번호를 써주세요.">
		        <input type="hidden" name="teamCode" value="${teamCode }"/>
		        <hr/>
		        <button class="btn btn-lg btn-primary btn-block" type="submit" >인증 요청</button>
		      	</form>
	
   			 </div> <!-- /container -->	
		</c:otherwise>
	</c:choose>
</body>
</html>