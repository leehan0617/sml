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
	$(function(){
		$("#updateBoard").hide();
	});
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
	
	function updateShow(){
		$("#readBoard").hide();
		$("#updateBoard").show();
	}
</script>

</head>
<body>
	<!-- <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h1>공지게시판 읽기</h1>
	</div> -->
	<div class="modal-body">
		<div id="readBoard">	
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<hr/>
			<div class="form-group">
				<select class="form-control" name="sportCode" disabled="disabled" >
					<option></option>				
					<option value="0">전체</option>
					<option value="1">축구</option>
					<option value="2">야구</option>
					<option value="3">족구</option>
					<option value="4">풋살</option>	
				</select>
			</div>			
				
				<c:if test="${commonBoard.sportCode=='0'}">
					<script type="text/javascript">					
					$("option:eq(0)").text("축구");					
					</script>
				</c:if>
				
				<c:if test="${commonBoard.sportCode=='1'}">
					<script type="text/javascript">					
					$("option:eq(0)").text("야구");					
					</script>
				</c:if>
				
				<c:if test="${commonBoard.sportCode=='2'}">
					<script type="text/javascript">					
					$("option:eq(0)").text("농구");					
					</script>
				</c:if>
				
				<c:if test="${commonBoard.sportCode=='3'}">
					<script type="text/javascript">					
					$("option:eq(0)").text("족구");					
					</script>
				</c:if>				
				
				<input class="form-control" type="text" name="boardWriter" value="${commonBoard.boardWriter}" disabled="disabled"/>					
				<input class="form-control" type="text" name="boardTitle" value="${commonBoard.boardTitle}" disabled="disabled" style="width:100%;"/>						
				<textarea class="form-control" rows="14" cols="30" name="boardContent" disabled="disabled" style="width:100%;">${commonBoard.boardContent}</textarea>	
				
				<hr/>
				
				<input class="btn btn-default" type="button" value="글수정하기" onclick="updateShow()" />
				
			</div>
			
			<div id="updateBoard">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h1></h1>
				<hr/>
				
				<form class=""  action="${root }/board/updateCommonBoard.do"  method="post" onsubmit="" role="form">	
				<input type="hidden" name="boardNumber" value="${commonBoard.boardNumber}"/>
				<input type="hidden" name="sportCode" value="${commonBoard.sportCode }"/>
					<div class="form-group">
						<select id="update" name="sportCode">
							<option></option>				
							<option value="0">축구</option>
							<option value="1">야구</option>
							<option value="2">농구</option>
							<option value="3">족구</option>	
						</select>					
					</div>	
					
					<c:if test="${commonBoard.sportCode=='0'}">
						<script type="text/javascript">					
						$("#update option:eq(0)").text("축구");					
						</script>
					</c:if>
					
					<c:if test="${commonBoard.sportCode=='1'}">
						<script type="text/javascript">					
						$("#update option:eq(0)").text("야구");					
						</script>
					</c:if>
					
					<c:if test="${commonBoard.sportCode=='2'}">
						<script type="text/javascript">					
						$("#update option:eq(0)").text("농구");					
						</script>
					</c:if>
					
					<c:if test="${commonBoard.sportCode=='3'}">
						<script type="text/javascript">					
						$("#update option:eq(0)").text("족구");					
						</script>
					</c:if>
						
						
					<input type="text" name="boardWriter" value="${commonBoard.boardWriter}"/>		
					<input type="text" name="boardTitle" value="${commonBoard.boardTitle}" style="width:100%;">							
					<textarea rows="14" cols="30" name="boardContent" style="width:100%;">${commonBoard.boardContent}</textarea>
					
					
				
					<input type="submit" class="btn btn-default" value="수정"/>	
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">닫기</span></button>
				</form>
			</div>
		</div>		
</body>
</html>