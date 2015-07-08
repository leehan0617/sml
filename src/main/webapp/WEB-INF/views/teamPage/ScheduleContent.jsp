<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${root}/js/member/jquery.js"></script>
<script type="text/javascript" src="${root}/js/carlendar/write.js"></script>
<title>Insert title here</title>
</head>
<body>
		<div>
			<h2><strong>${scheduleDto.scheduleType}</strong></h2>
			<label>제목</label><br/>
			<input type="text" name="scheduleTitle" value="${scheduleDto.scheduleTitle}" disabled="disabled">
			<br/><br/>
			
			<label>기간</label><br/>
			<input type="text" name="startDate" value="${scheduleDto.startDate}"disabled="disabled">~<input type="text" name="endDate" value="${scheduleDto.endDate}"disabled="disabled"/>
			<br/><br/>
			
			<label>내용</label><br/>
			<input type="text" name="scheduleContent" value="${scheduleDto.scheduleContent }"disabled="disabled"/>
			<br/><br/>

				<input type="button" id="btn" value="삭제" onclick="deleteSchedule('${root}','${scheduleDto.scheduleNumber}','${teamDto.teamGrade}')"/>

			
			<input type="button" value="닫기"  onclick="javascirpt:self.close()"/>
			
			<c:if test="${check>0}">
				<script type="text/javascript">
					window.opener.location.reload();
					window.close();
				</script>
			</c:if>
		</div>
</body>
</html>