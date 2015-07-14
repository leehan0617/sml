<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" contetn="width=device-width,initial-scale=1">
<!-- start: CSS -->
	<link id="bootstrap-style" href="${root}/css/admin/bootstrap.min.css" rel="stylesheet">
	<link href="${root}/css/admin/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="${root}/css/admin/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="${root}/css/admin/style-responsive.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
<!-- end: CSS -->
<link rel="stylesheet" type="text/css" href="${root }/resources/css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="${root }/resources/css/jquery-ui.css"/>

<script src="${root }/resources/js/jquery.js"></script>
<script src="${root }/resources/js/bootstrap.js"></script>
<title>관리자페이지</title>

</head>
<body>	
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="${root }/start.jsp"><span>SML KOREA</span></a>					
			</div>
		</div>
	</div>

	<div class="container-fluid">		
		<h1>관리자 페이지 </h1>
			<br/>
			<br/>
		
		<span style="font-size:20pt;">	
			<a href="${root}/admin/manageTeam.do">회원관리페이지</a>
		</span>
		
		<span style="font-size:20pt;">	
			<a href="${root}/admin/createLeague.do">리그개설</a>
		</span>
		
		<span style="font-size:20pt;">	
			<a href="${root}/admin/manageLeague.do">리그관리</a>
		</span>
		
		<span style="font-size:20pt;">	
			<a href="${root}/admin/manageReferee.do">심판관리</a>
		</span>
		
		<span style="font-size:20pt;">	
			<a href="${root}/board/adminBoard.do">공지사항게시판</a>
		</span>
	</div>
	
	
	
	
	
	
	
	
	<footer>

		<p>
			<span style="text-align:left;float:left">&copy; 2013 <a href="http://jiji262.github.io/Bootstrap_Metro_Dashboard/" alt="Bootstrap_Metro_Dashboard">Bootstrap Metro Dashboard</a></span>
			
		</p>

	</footer>
	
	<!-- start: JavaScript-->

		<script src="${root}/js/admin/resource/jquery-1.9.1.min.js"></script>
		<script src="${root}/js/admin/resource/jquery-migrate-1.0.0.min.js"></script>	
		<script src="${root}/js/admin/resource/jquery-ui-1.10.0.custom.min.js"></script>	
		<script src="${root}/js/admin/resource/jquery.ui.touch-punch.js"></script>	
		<script src="${root}/js/admin/resource/modernizr.js"></script>	
		<script src="${root}/js/admin/resource/bootstrap.min.js"></script>	
		<script src="${root}/js/admin/resource/jquery.cookie.js"></script>	
		<script src='js/fullcalendar.min.js'></script>
	
		<script src='js/jquery.dataTables.min.js'></script>

		<script src="${root}/js/admin/resource/excanvas.js"></script>
		<script src="${root}/js/admin/resource/jquery.flot.js"></script>
		<script src="${root}/js/admin/resource/jquery.flot.pie.js"></script>
		<script src="${root}/js/admin/resource/jquery.flot.stack.js"></script>
		<script src="${root}/js/admin/resource/jquery.flot.resize.min.js"></script>
	
		<script src="${root}/js/admin/resource/jquery.chosen.min.js"></script>
	
		<script src="${root}/js/admin/resource/jquery.uniform.min.js"></script>
		
		<script src="${root}/js/admin/resource/jquery.cleditor.min.js"></script>
	
		<script src="${root}/js/admin/resource/jquery.noty.js"></script>
	
		<script src="${root}/js/admin/resource/jquery.elfinder.min.js"></script>
	
		<script src="${root}/js/admin/resource/jquery.raty.min.js"></script>
	
		<script src="${root}/js/admin/resource/jquery.iphone.toggle.js"></script>
	
		<script src="${root}/js/admin/resource/jquery.uploadify-3.1.min.js"></script>
	
		<script src="${root}/js/admin/resource/jquery.gritter.min.js"></script>
	
		<script src="${root}/js/admin/resource/jquery.imagesloaded.js"></script>
	
		<script src="${root}/js/admin/resource/jquery.masonry.min.js"></script>
	
		<script src="${root}/js/admin/resource/jquery.knob.modified.js"></script>
	
		<script src="${root}/js/admin/resource/jquery.sparkline.min.js"></script>
	
		<script src="${root}/js/admin/resource/counter.js"></script>
	
		<script src="${root}/js/admin/resource/retina.js"></script>

		<script src="${root}/js/admin/resource/custom.js"></script>
	<!-- end: JavaScript-->
</body>
</html>
