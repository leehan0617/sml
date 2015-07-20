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

<script src="${root }/resources/js/jquery.js"></script>
<script>
	function readURL(input){
		if(input.files && input.files[0]){
			var reader=new FileReader();
			reader.onload=function(e){
				$("#UploadedImg").attr("src", e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
		
	}
</script>

<style>
	#UploadedImg {
		max-width: 100% ;
 		width: expression(this.width > 640 ? 640: true) ; 
		height: auto ;
	}
</style>
</head>
<body>
	<form action="${root}/teamPage/manageTeamEmblem.do" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h1>로고 변경하기</h1>
	   	</div>
		
		<div class="modal-body">	
			<div class="row">	
				<input type="hidden" name="teamName" value="${team.teamName }"/>	
				
				<div class="col-sm-5 col-md-5" style="display:table-cell; text-align:center; vertical-align:middle;">
					<div>
						<img src="${root }/img/teamImg/${team.emblem}"/>
					</div>					
				</div>
				<div class="col-sm-2 col-md-2 " style="margin-top:15%; padding-left:7%;">
					<div>
						<img src="${root }/img/teamImg/narrow02.jpg" width="30px"/></div>
					</div>
				<div class="col-sm-5 col-md-5" style="display:table-cell; text-align:center; vertical-align:middle;">		
					<div>
						<img id="UploadedImg" src="${root }/img/teamImg/${team.emblem} "/>
					</div>
				</div>	
			</div>		
			<br/><br/>
			<div class="row">
				<div class="col-md-4"></div>					
				<div class="col-md-4">					
					<input type="file" name="teamImage" onchange="readURL(this);" filter:alpha(opacity=0); opacity:();/>				
				</div>
				<div class="col-md-4"></div>
			</div>	
		</div>
		
		<div class="modal-footer">
			<button type="submit" class="btn btn-success">수정하기</button>
		</div>		
	</form>
	
</body>
</html>