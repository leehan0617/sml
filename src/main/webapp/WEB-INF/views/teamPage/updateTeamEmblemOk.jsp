<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${root}/teamPage/manageTeamEmblem.do" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
			
		<c:if test="${team.emblem==null || board.emblem.equals('') }">
			<div>
				<label>팀 로고</label>
				<span>
					<input type="file" name="teamImage"/>
				</span>
			</div>
		</c:if>
		<div>
			<input type="submit" value="수정"/>
			<input type="reset" value="취소"/>			
		</div>
	</form>
</body>
</html>