<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>팀등록</title>
<script type="text/javascript" src="${root}/js/member/member.js"></script>
<script type="text/javascript" src="${root}/js/member/jquery.js"></script>
</head>
<body>
	<div>
		<a href="${root}/start.jsp"><img alt="logo" src=""></a>
		<a href="${root}/start.jsp">SML Korea</a>
	</div>
	<h3>팀정보입력>>팀장 정보 입력>>회원가입 완료</h3>
	
	<div>
	  <form action="${root}/member/registerTeam.do" method="post" name="form" onsubmit="return Check(this)">
		<span>
			<input placeholder="팀 아이디" type="text" name="teamId"/>
			<input type="button" value="중복확인" onclick="idCheck(form,'${root}')"/>	
		</span><br/><br/>
		<input placeholder="팀 비밀번호" type="password" name="teamPassword"/><br/>
		<input placeholder="팀 비밀번호 확인" type="password" name="teamPassword2"/>
	<br/><br/>
	
		<span>
			<input placeholder="팀 이름" type="text" name="teamName"/>
			<input type="button" value="중복확인" onclick="teamIdCheck(form,'${root}')"/>	
		</span><br/><br/><br/>
		<span>
			<label>종목</label>
			<select name="sportType">
				<option></option>
				<option value="축구">축구</option>
				<option value="야구">야구</option>
				<option value="족구">족구</option>
				<option value="풋살">풋살</option>
			</select>
			
			<br/>
			<a>홈구장</a>
			<input type="text" name="homeGround">
			<input type="button" value="지도로 찾기" onclick="searchHomeground(form,'${root}')"> 
			<br/><br/>
		</span>
	
	<input type="submit" value="다음단계"/>
	</form>
	</div>
	
</body>
</html>