<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${root}/resources/js/member.js"></script>
<script src="${root }/resources/js/bootstrap.js"></script>

<link rel="stylesheet" type="text/css" href="${root}/resources/css/bootstrap.css"/>
</head>
<body class="jumbotron">
	<c:if test="${teamCheck!=null}">
		<script type="text/javascript">
			alert("이미 사용중인 팀명입니다! 다시입력 하십시요");
		</script>
	</c:if>
	
	<c:if test="${teamCheck==null}">
		<script type="text/javascript">
			alert("사용 가능한 팀명입니다");
		</script>
	</c:if>
</body>
</html>