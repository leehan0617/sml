<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
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
	<title>게시판 목록보기</title>
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
				<li><a href="#">공지 게시판 관리</a></li>
			</ul>
			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon user"></i><span class="break"></span>공지 게시판</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
						</div>
					</div>	
					
					<a href="${root }/board/addCommonBoard.do">글쓰기</a>
		
					<c:if test="${count==null }">
						<div>	
							<span>검색결과가 없습니다.</span>												
						</div>
					</c:if>
					
					<c:if test="${count!=null}">
						<div class="box-content">
							<table class="table table-striped table-bordered bootstrap-datatable datatable">
							  <thead>
								  <tr>
									  <th>종목</th>
									  <th>작성자</th>	
									  <th>제목</th>
									  <th>날짜</th>	
									  <th>삭제 여부</th>
								  </tr>
							  </thead>   
							  <tbody>
							  	<c:forEach var="commonBoard" items="${commonBoardList}">				
									<tr>											
										<c:if test="${commonBoard.sportCode=='0'}">
											<td>전체</td>
										</c:if>
										
										<c:if test="${commonBoard.sportCode=='1'}">
											<td>축구</td>
										</c:if>
										
										<c:if test="${commonBoard.sportCode=='2'}">
											<td>야구</td>
										</c:if>
										
										<c:if test="${commonBoard.sportCode=='3'}">
											<td>족구</td>
										</c:if>
										
										<c:if test="${commonBoard.sportCode=='4'}">
											<td>풋살</td>
										</c:if>				
										
										<td>${commonBoard.boardWriter}</td>
										<td><a href="${root }/board/readCommonBoard.do?boardNumber=${commonBoard.boardNumber}&pageNumber=${currentPage}">${commonBoard.boardTitle}</a></td>					
										<td><fmt:formatDate value="${commonBoard.boardDate}" type="date"/></td>		
										<td>
											<a href="{root }/board/deleteCommonBoard.do?boardNumber=${commonBoard.boardNumber}">
												<span class="label label-important">삭제</span>
											</a>	
										</td>							
									</tr>									
									
								</c:forEach>													
							  </tbody>  
						  </table> 					 
							
							<!-- 페이지 번호 -->							
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
											<li><a href="${root }/board/adminBoard.do?pageNumber=${startPage-pageBlock}">Prev</a></li>
										</c:if>
										
										<c:forEach var="i" begin="${startPage }" end="${endPage}">
											<li><a href="${root }/board/adminBoard.do?pageNumber=${i}">${i }</a></li>
										</c:forEach>
										
										<c:if test="${endPage<pageCount }">
											<li><a href="${root }/board/adminBoard.do?pageNumber=${startPage+pageBlock}">Next</a></li>
										</c:if>
									</ul>
								</c:if>
							</div> 							  
						             
						</div>
					</c:if>
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
<table width="530" align="center">
		<tr>
			<td align="right" bgcolor="D1DBDB"><a href="${root }/board/addCommonBoard.do">글쓰기</a></td>
		</tr>
	</table>
	
	<c:if test="${count==0}">	
		<tr>
			<td align="center">게시판에 저장된 글이 없습니다.</td>
		</tr>		
	</c:if>
	
	<c:if test="${count>0}">	
		<tr> 
			<td align="center" width="30">종목</td>
			<td align="center" width="30">작성자</td>	
			<td align="center" width="250">제목</td>
			<td align="center" width="70">날짜</td>			
		</tr>		
	<br/>
	</c:if>	
	
	<c:forEach var="commonBoard" items="${commonBoardList}">
		<tr>			
			<td>
				<c:if test="${commonBoard.sportCode=='0'}">
					<td>전체</td>
				</c:if>
				
				<c:if test="${commonBoard.sportCode=='1'}">
					<td>축구</td>
				</c:if>
				
				<c:if test="${commonBoard.sportCode=='2'}">
					<td>야구</td>
				</c:if>
				
				<c:if test="${commonBoard.sportCode=='3'}">
					<td>족구</td>
				</c:if>
				
				<c:if test="${commonBoard.sportCode=='4'}">
					<td>풋살</td>
				</c:if>				
			</td>
			<td>${commonBoard.boardWriter}</td>
			<td><a href="${root }/board/readCommonBoard.do?boardNumber=${commonBoard.boardNumber}&pageNumber=${currentPage}">${commonBoard.boardTitle}</a></td>					
			<td><fmt:formatDate value="${commonBoard.boardDate}" type="date"/></td>
		</tr>
			&nbsp;&nbsp;
			<a href="${root }/board/deleteCommonBoard.do?boardNumber=${commonBoard.boardNumber}">[삭제]</a>
			&nbsp;&nbsp;
			<br/>
	</c:forEach>
	
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
				<a href="${root }/board/adminBoard.do?pageNumber=${startPage-pageBlock}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="${root }/board/adminBoard.do?pageNumber=${i}">[${i }]</a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<a href="${root }/board/adminBoard.do?pageNumber=${startPage+pageBlock}">[다음]</a>
			</c:if>
		</c:if>
	</center>