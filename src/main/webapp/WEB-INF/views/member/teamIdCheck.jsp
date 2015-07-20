<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${root }/resources/js/bootstrap.js"></script>

<link rel="stylesheet" type="text/css" href="${root}/resources/css/bootstrap.css"/>
</head>
<body class="jumbotron">
	<c:if test="${teamCheck!=null}">
		<form class="form-horizontal" action="${root}/member/idCheck.do" method="get">
			<div align="center"><h4><strong>이미 사용중인 팀명 입니다.</strong></h4></div>
			<div class="form-group">
				<input class="form-control" placeholder="다른팀명을 입력해 주십시요"  type="text" name="teamName"/>
			</div>
			
			<div class="col-sm-10" align="center">
				<input class="btn btn-info btn-sm" type="submit" value="입력"/>
				<input class="btn btn-info btn-sm" type="reset" value="재입력"/>
			</div>
		</form>
	</c:if>
	
	<c:if test="${teamCheck==null}">
		<div align="center"><h4><strong>사용 가능한 팀명입니다</strong></h4>
		
			<a href="javascript:window.opener.registerModal.teamName.value='${teamName}';close();">
				<span style="font-size:20px"><b>적용</b></span>
			</a>
		</div>
	</c:if>
	
</body>
</html>