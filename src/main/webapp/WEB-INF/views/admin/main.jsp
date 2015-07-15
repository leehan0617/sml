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
	<link id="bootstrap-style" href="${root}/resources/admin/css/bootstrap.min.css" rel="stylesheet">
	<link href="${root}/resources/admin/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="${root}/resources/admin/css/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="${root}/resources/admin/css/style-responsive.css" rel="stylesheet">
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
	<div class="container-fluid-full">	
		<div class="row-fluid">	
			<div id="content" class="span10">
									
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
		</div>		
	</div>
	
	<div class="clearfix"></div>	
	<footer>
		<p>
			<span style="text-align:left;float:left">&copy; 2015 <a href="" alt="Bootstrap_Metro_Dashboard">SML KOREA</a></span>
		</p>
	</footer>
	
	<!-- start: JavaScript-->

		<script src="${root}/resources/admin/js/jquery-1.9.1.min.js"></script>
		<script src="${root}/resources/admin/js/jquery-migrate-1.0.0.min.js"></script>	
		<script src="${root}/resources/admin/js/jquery-ui-1.10.0.custom.min.js"></script>	
		<script src="${root}/resources/admin/js/jquery.ui.touch-punch.js"></script>	
		<script src="${root}/resources/admin/js/modernizr.js"></script>	
		<script src="${root}/resources/admin/js/bootstrap.min.js"></script>	
		<script src="${root}/resources/admin/js/jquery.cookie.js"></script>	
		<script src='js/fullcalendar.min.js'></script>
	
		<script src='js/jquery.dataTables.min.js'></script>

		<script src="${root}/resources/admin/js/excanvas.js"></script>
		<script src="${root}/resources/admin/js/jquery.flot.js"></script>
		<script src="${root}/resources/admin/js/jquery.flot.pie.js"></script>
		<script src="${root}/resources/admin/js/jquery.flot.stack.js"></script>
		<script src="${root}/resources/admin/js/jquery.flot.resize.min.js"></script>
	
		<script src="${root}/resources/admin/js/jquery.chosen.min.js"></script>
	
		<script src="${root}/resources/admin/js/jquery.uniform.min.js"></script>
		
		<script src="${root}/resources/admin/js/jquery.cleditor.min.js"></script>
	
		<script src="${root}/resources/admin/js/jquery.noty.js"></script>
	
		<script src="${root}/resources/admin/js/jquery.elfinder.min.js"></script>
	
		<script src="${root}/resources/admin/js/jquery.raty.min.js"></script>
	
		<script src="${root}/resources/admin/js/jquery.iphone.toggle.js"></script>
	
		<script src="${root}/resources/admin/js/jquery.uploadify-3.1.min.js"></script>
	
		<script src="${root}/resources/admin/js/jquery.gritter.min.js"></script>
	
		<script src="${root}/resources/admin/js/jquery.imagesloaded.js"></script>
	
		<script src="${root}/resources/admin/js/jquery.masonry.min.js"></script>
	
		<script src="${root}/resources/admin/js/jquery.knob.modified.js"></script>
	
		<script src="${root}/resources/admin/js/jquery.sparkline.min.js"></script>
	
		<script src="${root}/resources/admin/js/counter.js"></script>
	
		<script src="${root}/resources/admin/js/retina.js"></script>

		<script src="${root}/resources/admin/js/custom.js"></script>
	<!-- end: JavaScript-->
</body>
</html>
