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
	<table class="table table-striped table-bordered bootstrap-datatable datatable">
	  <thead>
		  <tr>
			  <th>작성자</th>	
			  <th>제목</th>
			  <th>날짜</th>	
		  </tr>
	  </thead>
	  <tr>
		 <td><fmt:formatDate value="${commonBoard.boardDate }" type="date" pattern="MM/dd"/></td>
		 <td>${commonBoard.boardTitle }</td>
		 <td>${commonBoard.boardContent }</td> 
	  </tr> 
	</table>
</body>
</html>

