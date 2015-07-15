<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="root" value="${pageContext.request.contextPath }"/>

	<div class="modal-header">
		<h3 style="text-align:center;">공지사항 </h3>
	</div>
	
	<div class="wrap modal-body">
		<div class="panel panel-default">
	  		<div class="panel-heading">
	    		<h3 class="panel-title">${board.boardTitle }</h3>
	  		</div>
	  		<div class="panel-body">
	    		${board.boardContent }
	  		</div>
		</div>

		<input type="button" value="글 목록" onclick="location.href='${root }/teamPage/viewTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}'"/>
	
	<c:if test="${teamGrade != null }">
		<input type="button" value="수정" onclick="location.href='${root }/teamPage/updateTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}&boardNumber=${board.boardNumber}'"/>
	</c:if>
	<button type="button" class="btn btn-danger" data-dismiss="modal">목록으로</button>
	</div>