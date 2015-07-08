<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/css/scheDule/scheDule.js"></script>
</head>
<body>
  <form action="${root}/teamPage/editSchedule.do" onsubmit="return scheDule(this)">
	<div align="center">
		<label>일정관리</label>
		<input type="hidden" name="teamId" value="${teamId}"/>
		<select name="scheduleType">
			<option>종류</option>
			<option>리그</option>
			<option>친선</option>
			<option>모임</option>
			<option>기타</option>
		</select><br/><br/>
		
		<label>일정명</label>
		<input type="text" name="scheduleTitle"/><br/><br/>
		<label>일정내용</label>
		<input type="text" name="scheduleContent"/><br/>
		<input type="submit" value="입력"/>
		<input type="reset" value="취소"/>
	</div>
  </form>
</body>
</html>