<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>팀장 정보 입력</title>
<script type="text/javascript" src="${root}/js/member/jquery.js"></script>
<script type="text/javascript" src="${root}/js/member/member.js"></script>
<script type="text/javascript" src="${root}/js/member/jquery-ui.js"></script>
<script type="text/javascript" src="${root}/js/xhr/xhr.js"></script>
<link rel="stylesheet" type="text/css"  href="${root}/css/member/jquery-ui.css"/>
<script type="text/javascript">
 	$(function(){
		$("#date1").datepicker({
			dateFormat:"yy-mm-dd",
			yearRange: "1950:2015",
			monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			dayNamesMin:["일","월","화","수","목","금","토"],
			showOn:"button",
			buttonImage:"${root}/js/member/달력.PNG",
			buttonImageOnly:true,
			changeYear:true,
			changeMonth:true
			
		});
	}); 
</script>
</head>
<body>
	<div>
		<a href="${root}/start.jsp"><img alt="logo" src=""></a>
		<a href="${root}/start.jsp">SML Korea</a>
	</div>
	
	<h3>팀정보입력>>팀장 정보 입력>>회원가입 완료</h3>
	
	<form action="${root}/member/registerMember.do" method="post" onsubmit="return teamCheck(this)">
		<input type="hidden" name="teamId" value="${teamId}"/>
		<input type="hidden" name="teamPassword" value="${teamPassword}"/>
		<input type="hidden" name="sportType" value="${sportType}"/>
		<input type="hidden" name="teamName" value="${teamName}"/>
		<input type="hidden" name="homeGround" value="${homeGround }">
		<div>
			<label>이름</label>
			<input type="text" name="memberName"/><br/>
		    <label>생년월일:</label>
			<input type="text" id="date1" name="memberBirth"/>
			<br/></br> 
		</div>
		
		<div>
			<label>지역:</label>
			<select id="sido" onchange="regionSido('${root }')">
				<option>시/도</option>
			</select>
			<select id="gugun">
				<option>시/구/군</option>
				<option></option>
			</select>
			<input type="hidden" name="memberRegion">
			<br/><br/>
		</div>
		
		<div>
			<label>이메일:</label>
			<input type="text" name="memberEmail"/>
			<br/>
		</div>
		
		<div>
			<label>연락처:</label>
			<input type="text" name="memberPhone"/>
			"-"는 생략하고 적어주십시요
			<br/>
		</div>
		
		<span>
			<label>성별</label>
			<span>
				<input type="radio" name="sexValue" value="남"/>남
				<input type="radio" name="sexValue" value="여"/>여
				<input type="hidden" name="memberGender"/>
			</span>
		</span><br/><br/>
		
		<input type="submit" value="팀만들기"/>
	</form>
</body>
</html>