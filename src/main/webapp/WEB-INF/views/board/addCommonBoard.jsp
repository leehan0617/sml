<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class=""  action="${root }/board/addCommonBoard.do"  method="post" onsubmit="">				
		<h1>공지사항 글쓰기</h1>
		<select name="sportCode">
			<option>종목</option>
			<option value="0">전체</option>
			<option value="1">축구</option>
			<option value="2">야구</option>
			<option value="3">족구</option>
			<option value="4">풋살</option>	
		</select>
		
		<span class="">
			<input type="text" name="boardWriter"/>
		</span>
		<span class="">
			<input type="text" name="boardTitle">	
		</span>	
				
		<div class="">			
			<textarea rows="14" cols="58" name="boardContent"></textarea>
		</div>		
			
		<div class="">
			<input type="submit" value="글쓰기"/>			
			<input type="button" value="목록보기" onclick="location.href='${root}/board/adminBoard.do"/>
		</div>
	</form>
</body>
</html>