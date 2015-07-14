<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>

	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- end: Mobile Specific -->
	
	<!-- start: CSS -->
	<link id="bootstrap-style" href="${root}/css/admin/bootstrap.min.css" rel="stylesheet">
	<link href="${root}/css/admin/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="${root}/css/admin/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="${root}/css/admin/style-responsive.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
	<!-- end: CSS -->
</head>
<body>
	<!-- start: Header -->
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
	
	<!-- start: Header -->
	
		<div class="container-fluid-full">
		<div class="row-fluid">
				
			<!-- start: Main Menu -->
			<div id="sidebar-left" class="span2">
				<div class="nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li><a href="${root}/admin/manageTeam.do"><i class="icon-bar-chart"></i><span class="hidden-tablet"> 회원관리페이지</span></a></li>	
						<li><a href="${root}/admin/createLeague.do"><i class="icon-bar-chart"></i><span class="hidden-tablet"> 리그개설</span></a></li>	
						<li><a href="${root}/admin/manageLeague.do"><i class="icon-bar-chart"></i><span class="hidden-tablet"> 리그관리</span></a></li>	
						<li><a href="${root}/admin/manageReferee.do"><i class="icon-bar-chart"></i><span class="hidden-tablet"> 심판관리</span></a></li>	
						<li><a href="${root}/board/adminBoard.do"><i class="icon-bar-chart"></i><span class="hidden-tablet"> 공지사항관리</span></a></li>	
					</ul>
				</div>
			</div>
			<!-- end: Main Menu -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<!-- start: Content -->
			<div id="content" class="span10">
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="${root }/admin/main.do">Home</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="#">회원관리페이지</a></li>
			</ul> 
			
			<h3 style="text-align:center">회원관리(팀 관리)</h3>
						
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-12">
				<c:if test="${count==0}">			
					<p style="text-align: center">등록된 팀이없습니다.</p>		
				</c:if>
				
				<c:if test="${count>0}">	
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>종목</th>
									<th>엠블럼</th>
									<th>팀명</th>	
									<th>팀장이름</th>
									<th>생년월일</th>
									<th>지역</th>	
									<th>이메일</th>
									<th>연락처</th>
									<th>성별</th>
									<th></th>					
								</tr>	
							</thead>
							<tbody>
								<c:forEach var="containerList" items="${containerList}">		
									<tr>						
										<td>${containerList.SPORTTYPE}</td>
										<td>${containerList.EMBLEM}</td>		
										<td><a href="${root }/teamPage/teamPageMain.do?teamCode=${containerList.TEAMCODE}">${containerList.TEAMNAME}</a></td>
										<td>${containerList.TEAMLEADERNAME}</td>
										<td>${containerList.MEMBERBIRTH}</td>
										<td>${containerList.MEMBERREGION}</td>	
										<td>${containerList.MEMBEREMAIL}</td>
										<td>${containerList.MEMBERPHONE}</td>
										<td>${containerList.MEMBERGENDER}</td>	
										<td><a href="${root }/admin/manageTeamDelete.do?teamCode=${containerList.TEAMCODE}">[삭제]</a></td>	
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:if>
			</div>
		</div>
	</div>
		
	<div class="container">			
		<!-- 페이지 번호 -->
		<center>
			<c:if test="${count>0 }">
				<c:set var="pageBlock" value="${5}"/>
				<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/>
				<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
				
				<c:set var="startPage" value="${rs*pageBlock+1 }"/>
				<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
				
				<c:if test="${endPage>pageCount }">
					<c:set var="endPage" value="${pageCount }"/>
				</c:if>
				
				<c:if test="${startPage>pageBlock }">
					<a href="${root }/admin/manageTeam.do?pageNumber=${startPage-pageBlock}">[이전]</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="${root }/admin/manageTeam.do?pageNumber=${i}">[${i }]</a> 
				</c:forEach>
				
				<c:if test="${endPage<pageCount }">
					<a href="${root }/admin/manageTeam.do?pageNumber=${startPage+pageBlock}">[다음]</a>
				</c:if>
			</c:if>
		</center>	
	</div>	
</div>
	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->	
	<div class="clearfix"></div>
	
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
