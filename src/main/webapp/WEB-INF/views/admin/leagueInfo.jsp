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
			<div >
				<input type="hidden" name="leagueCode" value="${leagueDto.leagueCode}"/>
				<div style="width:50%; float:left;">
       				<img src="${root }/img/leagueImg/${leagueDto.leagueImage}" style="width:400px; height:350px; padding-top: 50px; padding-left: 50px;">
       				<br/><br/><br/><br/>
       				<c:if test="${leagueDto.leagueState==0 }">
       					<div style="text-align: center;">
       						<button type="button" class="btn btn-success btn-lg" disabled="disabled">리그 진행 중</button>&nbsp;&nbsp;&nbsp;&nbsp;
       						<button type="button" class="btn btn-warning btn-lg" onclick="javascript:location.href='${root}/admin/manageLeagueRecord.do?leagueCode=${leagueDto.leagueCode }'">결과 입력</button>
       					</div>
       				</c:if>
       				<c:if test="${leagueDto.leagueState!=0 }">
       					<div style="text-align: center;">
       						<button type="button" class="btn btn-info btn-lg">참가 진행 중</button>
       					</div>
       				</c:if>
        		</div>
        	<div style="width:50%; float:left;">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="focusedInput">리그명</label>
						<div class="controls">
							<input class="input-xlarge focused" id="focusedInput" type="text" value="${leagueDto.leagueName }" name="leagueName" disabled="disabled">
						</div>
					</div>							  
							  
					<div class="control-group">
						<label class="control-label" for="selectError3">종목</label>
						<div class="controls">
						  <select id="selectError3" name="leagueSport" disabled="disabled">
							<option>${leagueDto.leagueSport}</option>
						  </select>
						</div>
					</div>	 
							  
				  	<div class="control-group">
						<label class="control-label" for="focusedInput">리그 시작일</label>
							<div class="controls">
					  			<input class="input-xlarge focused" id="leagueStartDate" type="text" value="${leagueDto.leagueStartDate }" name="leagueStartDate" disabled="disabled">
							</div>
					
						<label class="control-label" for="focusedInput">리그 종료일</label>
					<div class="controls">
					  <input class="input-xlarge focused" type="text" value="${leagueDto.leagueEndDate }" name="leagueEndDate" disabled="disabled">
					</div>
				  </div>							  
				  	 
				  <div class="control-group">
					<label class="control-label" for="disabledInput">리그 팀수</label>
					<div class="controls">
					  <input class="input-xlarge disabled" type="text" placeholder="8팀"  name="leagueTeamNumberValue">
					  <input type="hidden" name="leagueTeamNumber" value="8">
					</div>
				  </div>								 
				  
				  <div class="control-group">
					<label class="control-label" for="selectError3">개최지</label>
					<div class="controls">
					  <input class="input-xlarge focused" type="text" value="${leagueDto.leagueRegion }" name="leagueRegion" disabled="disabled">
					</div>
				  </div>							  
				  	
				  <div class="control-group">
					<label class="control-label">리그요일</label>
					<div class="controls">
					   <input class="input-xlarge disabled" type="text" value="${leagueDto.leagueDay }" name="leagueDay" disabled="disabled">
					</div>
				  </div>							
				
				  <div class="control-group">
					<label class="control-label">리그시간</label>
					<div class="controls">
					  <input class="input-xlarge disabled" type="text" value="${leagueDto.leagueTime }" name="leagueTime" disabled="disabled">
					</div>
				  </div>
							
				  <div class="control-group">
					<label class="control-label" for="focusedInput">리그 경기장</label>
					<div class="controls">
					<c:forTokens var="place" items="${leagueDto.leaguePlace }" delims=",">
					  <input class="input-xlarge disabled" type="text" value="${place}" disabled="disabled">
					</c:forTokens>
					</div>							
					<input type="hidden" name="leaguePlace">
				  </div>  
				</fieldset>
				<div class="form-actions" style="margin-left: -550px; text-align: center;">
					<input type="button" class="btn btn-primary" value="리그 수정" onclick="updateFun('${root}','${leagueDto.leagueCode }','${pageNumber }')" />
					<input type="button" class="btn btn-danger" value="리그 삭제" onclick="deleteFun('${root}','${leagueDto.leagueCode }','${pageNumber }')"/>				
					<input type="button" class="btn btn-default" value="글목록" onclick="location.href='${root}/admin/manageLeague.do?pageNumber=${pageNumber }'"/>
				</div>
			</div>
			</div>
			</div>
		</div>	             
						</div>
				</div><!--/span-->
			
			</div><!--/row-->   

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
		<script src="${root}/resources/admin/js/custom.js"></script>
		<script type="text/javascript">
	function deleteFun(root, leagueCode, pageNumber){
		var url=root+"/admin/leagueDelete.do?leagueCode="+leagueCode+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;	
	}
	
	function updateFun(root, leagueCode, pageNumber){
		var url=root+"/admin/leagueUpdate.do?leagueCode="+leagueCode+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;
	}
</script>
</body>
</html>

	
	