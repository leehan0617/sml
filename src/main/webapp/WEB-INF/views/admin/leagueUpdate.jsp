<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
	<!-- start: Meta -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
	<title>Bootstrap Metro Dashboard by Dennis Ji for ARM demo</title>
	<meta name="description" content="Bootstrap Metro Dashboard">
	<meta name="author" content="Dennis Ji">
	<meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	<!-- end: Meta -->
	
	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- end: Mobile Specific -->
	
	<!-- start: CSS -->
	<link id="bootstrap-style" href="${root}/resources/admin/css/bootstrap.min.css" rel="stylesheet">
	<link href="${root}/resources/admin/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="${root}/resources/admin/css/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="${root}/resources/admin/css/style-responsive.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
	<!-- end: CSS -->
	
	<script src="${root}/js/jquery/jquery.js"></script>
	<script src="${root}/js/admin/admin.js"></script>
	<script src="${root}/js/external/jquery-1.11.3.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<!--
		
	  -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  	
		
	<title>팀목록보기</title>
	
	<script type="text/javascript">
	$(function() {
	    $( "#leagueStartDate" ).datepicker({
	    });
	    
	    $( "#leagueEndDate" ).datepicker({
	    });
	});
	</script>	
</head>
<body onload="updateLeague('${leagueDto.leagueTime}','${leagueDto.leaguePlace}')">	
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
					<a href="${root }/admin/main.do">Home</a>
					<i class="icon-angle-right"></i> 
				</li>
				<li>
					<i class="icon-edit"></i>
					<a href="#">리그 개설</a>
				</li>
			</ul>    
			
			<div class="row-fluid">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon edit"></i><span class="break"></span>리그 수정</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<form class="form-horizontal" action="${root}/admin/leagueUpdate.do" enctype="multipart/form-data" method="post" onsubmit="updateOkLeague(this)">
							<fieldset>
							<input type="hidden" value="${leagueDto.leagueCode }" name="leagueCode">
							  <div class="control-group">
								<label class="control-label" for="focusedInput">리그명</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="focusedInput" type="text" value="${leagueDto.leagueName}" name="leagueName">
								</div>
							  </div>							  
							  
							  <div class="control-group">
								<label class="control-label" for="selectError3">종목</label>
								<div class="controls">
								  <select id="selectError3" name="leagueSport">		
											<option value="${leagueDto.leagueSport}">${leagueDto.leagueSport}</option>
											<option value="축구">축구</option>
											<option value="야구">야구</option>
											<option value="족구">족구</option>
											<option value="풋살">풋살</option>	
								  </select>
								</div>
							  </div>	 
							  
							  <div class="control-group">
								<label class="control-label" for="focusedInput">리그 시작일</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="leagueStartDate" type="text" value="${leagueDto.leagueStartDate }" name="leagueStartDate">
								</div>
								
								<label class="control-label" for="focusedInput">리그 종료일</label>
								<div class="controls">
								  <input class="input-xlarge focused" id="leagueEndDate" type="text" value="${leagueDto.leagueEndDate }" name="leagueEndDate">
								</div>
							  </div>							  
							  	 
							  <div class="control-group">
								<label class="control-label" for="disabledInput">리그 팀수</label>
								<div class="controls">
								  <input class="input-xlarge disabled" id="disabledInput" type="text" placeholder="8팀"  name="leagueTeamNumberValue" disabled="">
								  <input type="hidden" name="leagueTeamNumber" value="8">
								</div>
							  </div>								 
							  
							  <div class="control-group">
								<label class="control-label" for="selectError3">개최지</label>
								<div class="controls">
								  <select id="sido">
								  <option>${leagueDto.leagueRegion }</option>
								  	<option>서울</option>
									<option>충남</option>
									<option>부산</option>
									<option>울산</option>
									<option>인천</option>
									<option>광주</option>
									<option>제주</option>
									<option>대전</option>
									<option>대구</option>
									<option>강원</option>
									<option>경북</option>
									<option>전북</option>
									<option>전남</option>
									<option>경기</option>
									<option>경남</option>
								  </select>
								</div>
								<input type="hidden" name="leagueRegion"></input>
							  </div>							  
							  	
							  <div class="control-group">
								<label class="control-label">리그요일</label>
								<div class="controls">
								<c:if test="${leagueDto.leagueDay=='sat'}">
								  <label class="radio">
									<input type="radio" name="leagueDay" id="optionsRadios1" value="sat" checked="checked">
									토요일
								  </label>
								  <div style="clear:both"></div>
								  <label class="radio">
									<input type="radio" name="leagueDay" id="optionsRadios2" value="sun">
									일요일
								  </label>
								  </c:if>
								  <c:if test="${leagueDto.leagueDay=='sun'}">
								  <label class="radio">
									<input type="radio" name="leagueDay" id="optionsRadios1" value="sat" >
									토요일
								  </label>
								  <div style="clear:both"></div>
								  <label class="radio">
									<input type="radio" name="leagueDay" id="optionsRadios2" value="sun" checked="checked">
									일요일
								  </label>
								  </c:if>
								</div>
							  </div>							
							
							  <div class="control-group">
								<label class="control-label">리그시간</label>
								<div class="controls">
								  <label class="checkbox inline">
									<input type="checkbox" id="inlineCheckbox1" name="time" value="10:00" > 10:00
								  </label>
								  <label class="checkbox inline">
									<input type="checkbox" id="inlineCheckbox2" name="time" value="13:00" > 13:00
								  </label>
								  <label class="checkbox inline">
									<input type="checkbox" id="inlineCheckbox3" name="time" value="16:00"> 16:00
								  </label>
								  <label class="checkbox inline">
									<input type="checkbox" id="inlineCheckbox3" name="time" value="20:00"> 20:00
								  </label>
								  <input type="hidden" name="leagueTime">
								</div>
							  </div>
										
							  <div class="control-group">
								<label class="control-label" for="focusedInput">리그 경기장</label>
								
								<div class="controls">	
								  <input class="input-xlarge focused" type="text" value="" name="place1">
								</div>								
								<div class="controls">
								  <input class="input-xlarge focused" type="text" value="" name="place2">
								</div>
								<div class="controls">
								  <input class="input-xlarge focused" type="text" value="" name="place3">								  
								</div>
								<div class="controls">
								  <input type="button" class="btn" name="searchPlace" value="경기장 찾기">
								</div>							
								<input type="hidden" name="leaguePlace">
							  </div>

							  <div class="form-actions">
								<button type="submit" class="btn btn-primary">리그 수정</button>
								<input type="button" value="취소" class="btn" onclick="location.href='${root}/admin/manageLeague.do?pageNumber=${pageNumber }'"/>
							  </div>
							</fieldset>
						  </form>					
					</div>
				</div><!--/span-->			
			</div><!--/row-->
			
	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
	</div><!--/#content.span10-->
	</div><!--/fluid-row-->
	
	<h1>선택한 시간에 따라 최소 기간이 달라짐 (유효성 검사)</h1>
	<h3>시간대 4개 선택: 3주</h3>
	<h3>시간대 3개 선택: 4주</h3>
	<h3>시간대 2개 선택: 5주</h3>
	<h3>시간대 1개 선택: 10주</h3>

	
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
		<script src="${root}/resources/admin/js/custom.js"></script>
</body>
</html>