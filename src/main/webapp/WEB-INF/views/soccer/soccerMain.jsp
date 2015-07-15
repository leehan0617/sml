<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="${root}/js/jquery/jquery.js"></script>
<script type="text/javascript" src="${root}/js/scrollnews.js"></script>
<script type="text/javascript" src="${root}/js/soccer/soccer.js"></script>
<script type="text/javascript" src="${root}/resources/js/bootstrap.js"></script>
<script src="${root}/js/startPage.js"></script>

<link rel="stylesheet" type="text/css" href="${root}/resources/css/bootstrap.css"/>
<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
</style>
<!--ajax crossdomain 우회-->
<title>Insert title here</title>
</head>
<body>	
<%-- ${root}/resources/images/soccer_background.jpg --%>
<div style="${root}/resources/images/soccer_background.jpg" class="img-responsive"></div>
<div class="container-fluid">	
	<a href="${root}/mainPage.jsp"><img alt="logo" src=""></a>
	<a href="${root}/mainPage.jsp">SML Korea</a>	
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="row">
					<ul class="nav navbar-nav">
						<li class="active"><a href="${root}/soccer/soccerMain.do"><b>홈</b></a></li>
						<li class="active"><a href="${root}/soccer/soccerRule.do"><b>경기규칙</b></a></li>
						<li class="active"><a href="${root}/soccer/soccerTeamList.do"><b>팀리스트</b></a></li>
						<li class="active"><a href="${root}/record/soccerGameScore.do"><b>기록리스트</b></a></li>
						<li class="active"><a href="${root}/referee/refereeList.do?sportType=${sportType}"><b>심판현황</b></a></li>
					</ul>
				</div>
			</div>
		</nav>	
		<div class="jumbotron" align="right">
			<div align="center">
				<img alt="soccer_icon" src="${root}/resources/images/soccer_icon.jpg">
				<h1><strong>SML Korea</strong></h1>
			</div>
				<form name="form" class="form-inline" id="searchForm">
					<input type="text" placeholder="teamName" name="teamName">
					<input class="btn btn-default" type="button" value="검색" onclick="teamSearch(form,'${root}')"/>
				</form>		
				
				<div class="noti" id="roll" style="height:22px; overflow:hidden;width:300px;">
					<ul>
						<c:forEach var="weather" items="${weatherList }">		
								<li>	
								<span>${weather.sido}</span>
								<span>${weather.temp} ºC</span>
								<span> ${weather.wfKor}</span>
							</li>	
						</c:forEach>		
					</ul>
				</div>		
		</div>	
		<div id="matchingList" class="jumbotron" align="center">
				<div class="row">
					<div class="col-sm-6">
							<h3><a href="">금주매치</a></h3>
							<div>
								<span><input type="button" value="이전" onclick="moveMatchDay('${root}', '${-1}', '${matchDay}')"/></span>
								<%-- <span><fmt:formatDate value="${now }" type="date" pattern="MM월 dd일" /></span> --%>
								<span>${matchDay }</span>
								<span>요일</span>
								<span><input type="button" value="다음" onclick="moveMatchDay('${root}', '${1}', '${matchDay}')"/></span>
							</div>
						<c:if test="${todayMatchList==null }">
							<span>매치 없음</span>
						</c:if>
						
						<c:if test="${todayMatchList!=null }">
							<c:forEach var="todayMatch" items="${todayMatchList }">
								<div>	
									<span id="teamCode">
										<a href="${root }/teamPage/teamPageMain.do?teamName=${todayMatch.TEAMNAME1 }" target="_blank"><img alt="팀엠블럼1:${todayMatch.EMBLEM1 }" src="${root}/img/teamImg/${todayMatch.EMBLEM1}"/></a>
									</span>${todayMatch.EMBLEM1 }
									<span>${todayMatch.TEAMNAME1 }</span>
									
									<span>vs</span>
									
									<span id="teamcode2">
										<a href="${root }/teamPage/teamPageMain.do?teamName=${todayMatch.TEAMNAME2 }" target="_blank"><img alt="팀엠블럼2:${todayMatch.EMBLEM2}" src="${root}/img/teamImg/${todayMatch.EMBLEM2}"/></a>
									</span>
									<span>${todayMatch.TEAMNAME2 }</span>
									
									<a href=""><span>${todayMatch.GAMEPLACE }</span></a>
								</div>
							</c:forEach>
						</c:if>
					</div>
					
					<!-- 공지사항 -->
					<div class="col-sm-6">
							<h3 style="text-align:center">공지사항</h3>
							<c:if test="${commonBoardList==null }">
							<div class="table-responsive">
								<table class="table table-striped">	
									<tr>
										<td>공지사항 없음</td>
									</tr>
								</table>
							</div>
							</c:if>
							
							<c:if test="${commonBoardList!=null}">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr><th>글번호</th><th>생성일</th><th>작성자</th><th>제목</th></tr>
										</thead>
										
										<c:forEach var="commonBoard" items="${commonBoardList}">		
												<tr>	
													<td style="width:15%">${commonBoard.boardNumber}</td>			
													<td style="width:20%"><fmt:formatDate value="${commonBoard.boardDate }" type="date" pattern="MM-dd"/></td>
													<td style="width:30%">${commonBoard.boardWriter}</td><!-- window.open('${root }/soccer/readCommonBoard.do?boardNumber=${commonBoard.boardNumber} -->
													<td style="width:30%"><a data-toggle="modal" data-target="#soccerModal" onclick="sModal('${root}','${commonBoard.boardNumber}')"  target="_blank"> ${commonBoard.boardTitle }</a></td>	
												</tr>			
										</c:forEach>
									</table>
								</div>		
								<div align="right">
									<a href="${root }/soccer/commonBoard.do"><strong>더보기</strong></a>
								</div>
							</c:if>
						</div>
					</div>
				</div>	
		
		<!-- 리그상황 -->		
		<div class="jumbotron">
			<div class="row">
				<div class="col-sm-6">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
					    <ol class="carousel-indicators">
					      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					      <li data-target="#myCarousel" data-slide-to="1"></li>
					      <li data-target="#myCarousel" data-slide-to="2"></li>
					      <li data-target="#myCarousel" data-slide-to="3"></li>
					    </ol>
						<c:forEach var="league" items="${leagueList}">
							 <div class="carousel-inner" role="listbox">
							      <div class="item active">
							        <img src="${root}/img/leagueImg/${league.leagueImage}" alt="league" width="460" height="345">
							        <div class="carousel-caption">
							          <h3>${league.leagueName}</h3>
							          <p>${league.leagueStartDate}</p>~<p>${league.leagueEndDate}</p>
							        </div>
							      </div>
							      
	<%-- 			 			      <div class="item">
							        <img src="${root}/img/leagueImg/${league.leagueImage}" alt="league" width="460" height="345">
							        <div class="carousel-caption">
							          <h3>${league.leagueName}</h3>
							          <p>${league.leagueStartDate}</p>~<p>${league.leagueEndDate}</p>
							        </div>
							      </div>--%>
							      
							 </div>		 
	 					</c:forEach> 
						
						 <!-- Left and right controls -->
					    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
					      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					      <span class="sr-only">Previous</span>
					    </a>
					    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
					      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					      <span class="sr-only">Next</span>
					    </a>
					    </div>	
				</div>
				
				<!-- 통계차트 -->
				<div class="col-sm-6">
					<ul class="nav nav-tabs" ><!--${root}/soccer/soccerMain.do?legion=legion  -->
									  <!--${root}/soccer/soccerMain.do?age=age  -->
						<li><a href="${root}/soccer/soccerMain.do?legion=legion">지역별 통계</a></li>
						<li><a href="${root}/soccer/soccerMain.do?age=age">연령별 통계</a></li>
					</ul>
				<div>
					<c:if test="${legion!=null}">
						<%@include file="../soccerTeamplate/legionChart.jsp" %> 
					</c:if>
					<c:if test="${age!=null}">
						<%@include file="../soccerTeamplate/ageChart.jsp" %> 
					</c:if>
				</div>
				</div>
			</div>					   	
		</div>							
		<div class="jumbotron" align="center">
			<div class="row">
				<h3>전화번호 : 02 - 123 - 4567</h3>
				<h3>이메일 : smlKorea@sml.com</h3>
			</div>
		</div>
	</div>
	
	 <!-- Modal -->
	  <div class="modal fade" id="soccerModal" role="dialog">
	    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <h4 class="modal-title"><strong>공지사항</strong></h4>
		        </div>
		        <div class="modal-body">
			        <table class="table table-striped">
				        <thead>
							<tr> 
								<th style="width:15%">글번호</th><th style="width:45%">제목</th><th style="width:15%">작성자</th><th style="width:25%">작성일</th> 
							</tr> 
						</thead>
						<tbody class="soccerBoardTbody">	
						</tbody>
			        </table>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div> 
	   	 </div>	
	    </div>				
</body>
</html>




<%-- 							<c:if test="${count>0 }">
								<c:set var="pageBlock" value="${1}"/>
								
								<fmt:parseNumber var="pageCount" value="${count/boardSize+ (count/boardSize==0 ? 0:1) }" integerOnly="true"/>
								
								<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
								<c:set var="startPage" value="${rs*pageBlock+1 }"/>
								<c:set var="endPage" value="${startPage+pageBlock-1 }"/>			
								<c:if test="${endPage>pageCount }">
									<c:set var="endPage" value="${pageCount }"/>
								</c:if>
								
								<c:if test="${startPage>pageBlock }">
									<a href="${root}/soccer/soccerMain.do?pageNumber=${startPage-pageBlock }"> < </a>
								</c:if>
							
								<c:if test="${endPage<pageCount }">
									<a href="${root}/soccer/soccerMain.do?pageNumber=${startPage+pageBlock }"> > </a>
								</c:if>
							</c:if> --%>
							
							
<%--					 	<h3>리그</h3>
						<div>
							<span><input type="button" value="<"/></span>
							<img alt="리그 이미지 넣어야함" src=""/>
							<span><input type="button" value=">"/></span> 
							
							<c:forEach var="league" items="${leagueList}">
								<div>
									<span><img src="${root}/img/leagueImg/${league.leagueImage}"/></span>
									<span>리그이름 : ${league.leagueName}</span>
									<span>리그지역 : ${league.leagueRegion}</span>
									<span>리그시간 : ${league.leagueTime}</span>
									<span>리그시작일 : ${league.leagueStartDate}</span>
									<span>리그종료일 : ${league.leagueEndDate}</span>										
								</div>
				
							 		<div>
							 			<a href="${root}/soccer/soccerLeague.do?leagueSport=${league.leagueSport}&leagueCode=${league.leagueCode}&leagueTeamNumber=${league.leagueTeamNumber}">신청하기</a>
									</div> 
						
						</c:forEach>
						</div> --%>