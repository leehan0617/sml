<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/carlendar/scheDule.js"></script>
<script src='${root}/js/carlendar/jquery.js' type="text/javascript"></script>
<script src='${root}/js/carlendar/jquery-ui.js' type="text/javascript"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script type="text/javascript">
	$(function() {
		$( "#startDate" ).datepicker({
			dateFormat:"yy-mm-dd",
			});
		
		$( "#endDate" ).datepicker({
			dateFormat:"yy-mm-dd",
			});
});
</script>	
</head>
<body>
  <form action="${root}/teamPage/editSchedule.do" method="get" onsubmit="return scheDule(this)">
	<div align="center">
		<label><strong>일정관리</strong></label><br/><br/>
		<input type="hidden" name="teamId" value="${teamId}"/>
		
		<label>기간</label>
		<input type="text" id="startDate" name="startDate">
		<span>~</span>
		<input type="text" id="endDate" name="endDate">
		<br/><br/>
		
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
		<input type="submit" value="입력" onclick="javascirpt:window.opener.location.reload();window.close()"/>
		<input type="reset" value="취소" onclick="javascript:self.close();"/>
	</div>
  </form>
</body>
</html>