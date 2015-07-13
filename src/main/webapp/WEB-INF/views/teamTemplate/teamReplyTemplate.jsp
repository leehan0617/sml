<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<div class="col-md-3">
	 <div class="input-group">
		 <span class="input-group-btn">
			<button class="btn btn-default" type="button" disabled="disabled">닉네임</button>
		</span>
		<input type="text" class="form-control" value="${teamLog.replyNickName }" id="replyNickName" disabled="disabled">
	 </div><!-- /input-group -->
</div>
<div class="col-md-3">
	 <div class="input-group">
				 <span class="input-group-btn">
  					<button class="btn btn-default" type="button" disabled="disabled">작성일</button>
					</span>
					<input type="text" class="form-control" value="<fmt:formatDate value="${teamLog.replyDate }" pattern="yy-MM-dd"/>" id="replyDate" disabled="disabled">
		 </div><!-- /input-group -->
</div>
<div class="col-md-6">
	<div class="input-group">
		 <input type="text" class="form-control" value="${teamLog.replyContent }" id="replyContent" disabled="disabled">
     <span class="input-group-btn">
       	<button class="btn btn-danger" type="button" onclick="">삭제</button>
     </span>
	</div>
</div>
