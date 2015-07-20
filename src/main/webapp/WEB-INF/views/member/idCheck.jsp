<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중복 체크</title>
<script type="text/javascript" src="${root}/resources/js/jquery.js"></script>
<script src="${root }/resources/js/bootstrap.js"></script>
<script type="text/javascript" src="${root}/resources/js/member.js"></script>

<link rel="stylesheet" type="text/css" href="${root}/resources/css/bootstrap.css"/>
</head>
<body class="jumbotron">
		<c:if test="${check!=null}">
			<form class="form-horizontal" onsubmit="return idCheck(this,'${root}')">
				<div class="alert alert-Warning">
			    	<strong>사용중인 아이디입니다!</strong> 
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="다른아이디를 입력해 주십시요" type="text" name="teamId"/>
				</div>
				
				<div class="col-sm-10" align="center">
     		    	<input class="btn btn-info btn-sm" type="submit" value="입력"/>
					<input class="btn btn-info btn-sm" type="reset" value="재입력"/>
				</div>
			</form>
		</c:if>
		
		<c:if test="${check==null}">
			<div class="alert alert-success">
			    <strong>사용 가능한 아이디입니다</strong> 
			</div>
			
			<div align="center">
				<a href="javascript:window.opener.form.teamId.value='${teamId}';close();"  class="btn btn-info btn-lg">
					<span class="glyphicon glyphicon-ok"></span>적용
				</a>
			</div>
		</c:if>
		
		<footer>
			<p>
				<span style="text-align:left;float:left;font-size:15px">&copy; 2015 <Strong>SML KOREA</Strong></span>
			</p>
		</footer>
</body>
</html>