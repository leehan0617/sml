<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/carlendar/write.js"></script>
<script src='${root}/js/carlendar/jquery.js' type="text/javascript"></script>
<script src='${root}/js/carlendar/jquery-ui.js' type="text/javascript"></script>
<script src="${root }/resources/js/bootstrap.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${root}/resources/css/bootstrap.css"/>
<script type="text/javascript">
/* 	$(function() {
		$( "#startDate" ).datepicker({
			dateFormat:"yy-mm-dd",
			});
		
		$( "#endDate" ).datepicker({
			dateFormat:"yy-mm-dd",
			});
}); */
</script>	
</head>
<body>
  <form action="${root}/teamPage/editSchedule.do" method="get" onsubmit="return scheDule(this)" class="form-horizontal" role="form">
		<div class="modal-body">
			<div class="form-group">
				<label><strong>일정관리</strong>
					<select name="scheduleType">
						<option>종류</option>
						<option>리그</option>
						<option>친선</option>
						<option>모임</option>
						<option>기타</option>
					</select>
				</label>
			</div>
			<input type="hidden" name="teamId" value="${teamId}"/>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="기간">기간</label>
				<div class="col-sm-10">          
       				 <input class="form-control" type="date" name="startDate" placeholder="일정 시작일을 입력하세요">
					 <div align="center"><h3><strong>~</strong></h3></div>
       				 <input class="form-control" type="date" name="endDate" placeholder="일정 종료일을 입력하세요">
				</div>
				
				<label class="control-label col-sm-2" for="기간">제목</label>
				<div class="col-sm-10">          
       				 <input type="text" class="form-control"name="scheduleTitle" placeholder="스케쥴 제목을 입력하세요">
     		    </div>
     		    
     		    <label class="control-label col-sm-2" for="기간">내용</label>
     		    <div class="col-sm-10">          
       				 <input type="text" class="form-control" name="scheduleContent" placeholder="스케쥴 내용을 입력하세요">
     		    </div>
     		    
     		    <div class="col-sm-10">
     		    	<input class="btn btn-info btn-sm" type="submit" value="입력"/>
					<input class="btn btn-info btn-sm" type="reset" value="재입력"/>
				</div>
			</div>
		</div>
  </form>
  
  <c:if test="${check>0}">
  	<script type="text/javascript">
  	 	window.opener.location.reload();
  	 	window.close();
  	</script>
  </c:if>
</body>
</html>