<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${root }/js/external/jquery-1.11.3.min.js"></script>
</head>
<body>
	<form class=""  action="${root }/board/updateCommonBoard.do"  method="post" onsubmit="">
	
	<input type="hidden" name="boardNumber" value="${commonBoard.boardNumber}"/>		
	<h1>공지사항 수정하기</h1>
		<span>
			<select name="sportCode" >
				<option></option>				
				<option value="0">전체</option>
				<option value="1">축구</option>
				<option value="2">야구</option>
				<option value="3">족구</option>
				<option value="4">풋살</option>	
			</select>
		
			<c:if test="${commonBoard.sportCode=='0'}">
				<script type="text/javascript">					
				$("option:eq(0)").text("전체");					
				</script>
			</c:if>
			
			<c:if test="${commonBoard.sportCode=='1'}">
				<script type="text/javascript">					
				$("option:eq(0)").text("축구");					
				</script>
			</c:if>
			
			<c:if test="${commonBoard.sportCode=='2'}">
				<script type="text/javascript">					
				$("option:eq(0)").text("야구");					
				</script>
			</c:if>
			
			<c:if test="${commonBoard.sportCode=='3'}">
				<script type="text/javascript">					
				$("option:eq(0)").text("족구");					
				</script>
			</c:if>
			
			<c:if test="${commonBoard.sportCode=='4'}">
				<script type="text/javascript">					
				$("option:eq(0)").text("풋살");					
				</script>
			</c:if>
		</span>		
			
		<span class="">
			<input type="text" name="boardWriter" value="${commonBoard.boardWriter}"/>
		</span>
		
		<span class="">
			<input type="text" name="boardTitle" value="${commonBoard.boardTitle}">	
		</span>	
					
		<div class="">			
			<textarea rows="14" cols="58" name="boardContent">${commonBoard.boardContent}</textarea>
		</div>		
			
		<div class="">
			<input type="submit" value="수정"/>	
			<input type="reset" value="취소"/>		
			<input type="button" value="목록보기" onclick="location.href='${root}/board/adminBoard.do"/>
		</div>
	</form>
</body>
</html>