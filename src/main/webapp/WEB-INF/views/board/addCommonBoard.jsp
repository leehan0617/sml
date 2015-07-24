<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${root }/js/jquery/jquery.js"></script>
<title>Insert title here</title>
</head>
<body>
<form class=""  action="${root }/board/addCommonBoard.do"  method="post" onsubmit="" role="form">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h1>공지사항 글쓰기</h1>
	</div>
	<div class="modal-body">
						
			<div class="form-group">
				<label>종목:</label>
				<select name="sportCode" class="form-control">
					<option value="0">축구</option>
					<option value="1">야구</option>
					<option value="2">농구</option>
					<option value="3">족구</option>	
				</select>
			</div>
			<div class="form-group">
				<label>이름:</label>
				<input type="text" class="form-control" name="boardWriter"/>
			</div>
			<div class="form-group">
				<label>제목:</label>
				<input type="text" class="form-control" name="boardTitle" style="width:100%;">	
			</div>	
					
			<div class="form-group">	
				<label>Comment:</label>		
				<textarea class="form-control" rows="14" cols="30" name="boardContent" style="width:100%;"></textarea>
			</div>	
		
		<div class="modal-footer">
			<input class="btn btn-success" type="submit" value="글쓰기"/>			
		</div>		
	</div>
</form>
</body>
</html>