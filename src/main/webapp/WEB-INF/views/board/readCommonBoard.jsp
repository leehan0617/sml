<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 읽기</title>
<script src="${root }/js/external/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
	function deleteFun(root, boardNumber, pageNumber){
		var url=root+"/board/deleteCommonBoard.do?boardNumber="+boardNumber+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;	
	}
	
	function updateFun(root, boardNumber, pageNumber){
		var url=root+"/board/updateCommonBoard.do?boardNumber="+boardNumber+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;
	}
</script>

</head>
<body>			
	<h1>공지게시판 읽기</h1>	
	<span>
	<span>
			
		<select name="sportCode" disabled="disabled" >
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
			<input type="text" name="boardWriter" value="${commonBoard.boardWriter}" disabled="disabled"/>
		</span>
		
		<span class="">
			<input type="text" name="boardTitle" value="${commonBoard.boardTitle}" disabled="disabled">	
		</span>	
		
		<br/>			
				
		<textarea rows="14" cols="58" name="boardContent" disabled="disabled">${commonBoard.boardContent}</textarea>
		
		<br/>
		
		
		<input type="button" value="글수정" onclick="updateFun('${root}','${commonBoard.boardNumber }','${pageNumber }')" />
		<input type="button" value="글삭제" onclick="deleteFun('${root}','${commonBoard.boardNumber }','${pageNumber }')"/>				
		<input type="button" value="글목록" onclick="location.href='${root}/board/adminBoard.do?pageNumber=${pageNumber }'"/>
	</span>
</body>
</html>