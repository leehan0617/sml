<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/member/jquery.js"></script>
</head>
<body>
<c:if test="${check>0}">
	<script type="text/javascript">
		alert("신청이 완료되었습니다")
		
		var url="${root}/sc";
 		$(location).attr("href",url);  
	</script>
</c:if>

<c:if test="${check==0}">
	<script type="text/javascript">
		alert("이미 처리된 아이디입니다.")
		
  		var url="${root}/sc";
 		$(location).attr("href",url);    
	</script>
</c:if>

<c:if test="${check==-1}">
	<script type="text/javascript">
		alert("이미 참가하고 있는 리그가 있습니다.")
		
  		var url="${root}/sc";
 		$(location).attr("href",url);
	</script>
</c:if>

<c:if test="${check==-3}">
	<script type="text/javascript">
		alert("죄송합니다! 마감되었습니다.")
		
		var url="${root}/sc";
 		$(location).attr("href",url); 
	</script>
</c:if>
</body>
</html>