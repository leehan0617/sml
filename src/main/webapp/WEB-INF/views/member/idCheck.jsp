<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중복 체크</title>
<script type="text/javascript" src="${root}/resources/js/jquery.js"></script>
<script src="${root }/resources/js/bootstrap.js"></script>

<link rel="stylesheet" type="text/css" href="${root}/resources/css/bootstrap.css"/>
</head>
<body class="jumbotron">
		<c:if test="${check!=null}">
			<div align="center"><h4><strong>이미 사용중인 아이디 입니다.</strong></h4></div>
			<form class="form-horizontal" action="${root}/member/idCheck.do" method="get" onsubmit="idCheck(form,'${root}')">
				<div class="form-group">
					<input class="form-control" placeholder="다른아이디를 입력해 주십시요" type="text" name="teamId"/>
				</div>
				
				<div class="col-sm-10" align="center">
     		    	<input class="btn btn-info btn-sm" type="submit" value="입력"/>
					<input class="btn btn-info btn-sm" type="reset" value="재입력"/>
				</div>
			</form>
		</c:if>
		
		<c:if test="${check==null}">
			<div align="center"><h4><strong>사용 가능한 아이디입니다</strong></h4></div>
			
			<div align="center">
				<a href="javascript:window.opener.registerModal.teamId.value='${teamId}';close();">
					<span style="font-size:20px"><b>적용</b></span>
				</a>
			</div>
		</c:if>
</body>
</html>