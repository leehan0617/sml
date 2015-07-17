<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	
<!-- start: CSS -->
<link id="bootstrap-style" href="${root}/resources/admin/css/bootstrap.min.css" rel="stylesheet">
<link href="${root}/resources/admin/css/bootstrap-responsive.min.css" rel="stylesheet">
<link id="base-style" href="${root}/resources/admin/css/style.css" rel="stylesheet">
<link id="base-style-responsive" href="${root}/resources/admin/css/style-responsive.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
<!-- end: CSS -->

<title>Insert title here</title>
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
					<a href="${root }/start.jsp">Home</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="#">리그 관리</a></li>
			</ul>

			<div class="row-fluid">		
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon user"></i><span class="break"></span>리그 정보</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
						</div>
					</div>
					
					
						<div class="box-content">
						 <h1>리그정보 읽기</h1>	
	<input type="hidden" name="leagueCode" value="${leagueDto.leagueCode}"/>
	<span>
		<span>
			
		<select name="leagueSport" disabled="disabled" >
				<option>${leagueDto.leagueSport}</option>				
		</select>	
			
		</span>	
		
		<span class="">
			<input type="text" name="leagueImage" value="${leagueDto.leagueImage}" disabled="disabled"/>
		</span>
		
		<span class="">
			<input type="text" name="leagueRegion" value="${leagueDto.leagueRegion}" disabled="disabled">	
		</span>	
		
		<br/>			
				
		<span class="">
			<input type="text" name="leagueName" value="${leagueDto.leagueName}" disabled="disabled">	
		</span>
		
		<span class="">
			<input type="text" name="leagueTeamNumber" value="${leagueDto.leagueTeamNumber}" disabled="disabled">	
		</span>	
		
		<span class="">
			<input type="text" name="leagueDay" value="${leagueDto.leagueDay}" disabled="disabled">	
		</span>	
		
		<span class="">
			<input type="text" name="leagueTime" value="${leagueDto.leagueTime}" disabled="disabled">	
		</span>	
		
		<span class="">
			<input type="text" name="leagueStartDate" value="${leagueDto.leagueStartDate}" disabled="disabled">	
		</span>	
		
		<span class="">
			<input type="text" name="leagueEndDate" value="${leagueDto.leagueEndDate}" disabled="disabled">	
		</span>	
		
		<br/>
		
		
		<input type="button" value="글수정" onclick="updateFun('${root}','${leagueDto.leagueCode }','${pageNumber }')" />
		<input type="button" value="글삭제" onclick="deleteFun('${root}','${leagueDto.leagueCode }','${pageNumber }')"/>				
		<input type="button" value="글목록" onclick="location.href='${root}/admin/manageLeague.do?pageNumber=${pageNumber }'"/>
	</span>
							
							<!-- 페이지 번호 							
							<div class="pagination pagination-centered">
								<c:if test="${count>0 }">
									<c:set var="pageBlock" value="${5}"/>									
									<fmt:parseNumber var="pageCount" value="${count/boardSize+ (count/boardSize==0 ? 0:1) }" integerOnly="true"/>									
									<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
									<c:set var="startPage" value="${rs*pageBlock+1 }"/>
									<c:set var="endPage" value="${startPage+pageBlock-1 }"/>			
									<c:if test="${endPage>pageCount }">
										<c:set var="endPage" value="${pageCount }"/>
									</c:if>
									<ul>
										<c:if test="${startPage>pageBlock }">
											<li><a href="${root }/admin/manageLeague.do?pageNumber=${startPage-pageBlock }">Prev</a></li>
										</c:if>
										
										<c:forEach var="i" begin="${startPage }" end="${endPage}">
											<li><a href="${root }/admin/manageLeague.do?pageNumber=${i}">${i }</a></li>
										</c:forEach>
										
										<c:if test="${endPage<pageCount }">
											<li><a href="${root }/admin/manageLeague.do?pageNumber=${startPage+pageBlock }">Next</a></li>
										</c:if>
									</ul>
								</c:if>
							</div> 	-->						  
						             
						</div>
				</div><!--/span-->
			
			</div><!--/row-->   

	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>Settings</h3>
		</div>
		<div class="modal-body">
			<p>Here settings can be configured...</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a>
			<a href="#" class="btn btn-primary">Save changes</a>
		</div>
	</div>
	
	<div class="clearfix"></div>
	
	<footer>

		<p>
			<span style="text-align:left;float:left">&copy; 2013 <a href="http://jiji262.github.io/Bootstrap_Metro_Dashboard/" alt="Bootstrap_Metro_Dashboard">Bootstrap Metro Dashboard</a></span>
			
		</p>

	</footer>		
	<script src="${root}/resources/admin/js/jquery-1.9.1.min.js"></script>
		<script src="${root}/resources/admin/js/jquery-migrate-1.0.0.min.js"></script>	
		<script src="${root}/resources/admin/js/jquery-ui-1.10.0.custom.min.js"></script>	
		<script src="${root}/resources/admin/js/jquery.ui.touch-punch.js"></script>	
		<script src="${root}/resources/admin/js/modernizr.js"></script>	
		<script src="${root}/resources/admin/js/bootstrap.min.js"></script>	
		<script src="${root}/resources/admin/js/jquery.cookie.js"></script>	
		<script src="${root}/resources/admin/js/fullcalendar.min.js"></script>
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
</body>
</html>

	
	