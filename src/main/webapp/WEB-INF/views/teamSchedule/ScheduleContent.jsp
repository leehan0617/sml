<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${root}/js/member/jquery.js"></script>
<script type="text/javascript" src="${root}/js/carlendar/write.js"></script>
<script src="${root }/resources/js/bootstrap.js"></script>

<link rel="stylesheet" type="text/css" href="${root}/resources/css/bootstrap.css"/>
<title>스케쥴</title>
</head>
<body class="jumbotron">	
				<div>	
					<a style="font-size:medium;"><strong class="glyphicon glyphicon-pencil">${scheduleDto.scheduleTitle}</strong></a>
					<table class="table">
				   			<tr class="warning">
				   				<th><strong>기간</strong></th> 
				   				<td>${scheduleDto.startDate}~${scheduleDto.endDate}</td>	
				   			</tr>
				   			<tr class="success">
				   				<th><strong>종류</strong></th>
				   				<td>${scheduleDto.scheduleType}</td>						
							</tr>
							<tr class="danger">
								<th><strong>내용</strong></th>
								<td>${scheduleDto.scheduleContent}</td>	
							</tr>
					</table>
				</div>
				<div align="right">
					<c:if test="${teamId!=guest}">
						<input type="button" class="btn btn-info btn-sm" id="btn" value="삭제" onclick="deleteSchedule('${root}','${scheduleDto.scheduleNumber}','${teamDto.teamGrade}')"/>
					</c:if>
					<input type="button" class="btn btn-info btn-sm" value="닫기"  onclick="javascirpt:self.close()"/> 
					<c:if test="${check>0}">
						<script type="text/javascript">
							window.opener.location.reload();
							window.close();
						</script>
					</c:if>
			</div>
</body>
</html>