<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="${root }/js/startPage.js"></script>
<script src="${root }/js/external/jquery-1.11.3.min.js"></script>	
<style type="text/css">
	
</style>
<!--ajax crossdomain 우회-->
<script type="text/javascript" src="${root }/resources/js/jquery.js"></script>
<script type="text/javascript" src="${root }/js/scrollnews.js"></script>
<script type="text/javascript" src="${root }/js/soccer/soccer.js"></script>
<script type="text/javascript" src="${root }/js/bootstrap.js"></script>
<script type="text/javascript" src="${root }/js/jquery.xdomainajax.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/resources/css/bootstrap.css" class="background"/>
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
										<a href="${root }/teamPage/teamPageMain.do?teamName=${todayMatch.TEAMNAME1 }" target="_blank"><img alt="팀엠블럼1:${todayMatch.EMBLEM1 }" src="${root }/img/teamImg/${todayMatch.EMBLEM1 }"/></a>
									</span>${todayMatch.EMBLEM1 }
									<span>${todayMatch.TEAMNAME1 }</span>
									
									<span>vs</span>
									
									<span id="teamcode2">
										<a href="${root }/teamPage/teamPageMain.do?teamName=${todayMatch.TEAMNAME2 }" target="_blank"><img alt="팀엠블럼2:${todayMatch.EMBLEM2 }" src="${root }/img/teamImg/${todayMatch.EMBLEM2 }"/></a>
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
													<td style="width:30%">${commonBoard.boardWriter}</td>
													<td style="width:30%"><a href="#" onclick="window.open('${root }/soccer/readCommonBoard.do?boardNumber=${commonBoard.boardNumber}', '공지사항', 'width=400, height=200');return false;" target="_blank">	${commonBoard.boardTitle }</a></td>	
												</tr>									
										</c:forEach>
									</table>
								</div>		
								<div align="right">
									<a href="${root }/soccer/commonBoard.do">more</a>
								</div>
							</c:if>
						</div>
					</div>
				</div>	
		<div class="jumbotron" align="center">
			<div class="row">
				<div class="col-sm-6">
					<h3>리그</h3>
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
					</div>	
				</div>
				<!--통계-->
				<%-- ${root}/static/chart.do?legion=legion
				${root}/static/chart.do?age=age --%>
				<ul class="nav nav-tabs" >
					<li><a data-toggle="tab" href="${root}/static/chart.do?legion=legion"><Strong>지역별 통계</Strong></a></li>
					<li><a data-toggle="tab" href="${root}/static/chart.do?age=age"><Strong>연령별 통계</Strong></a></li>
				</ul>
				
				<div class="tab-content">
				    <div id="home" class="tab-pane fade in active">
				      <script type="text/javascript">
	
				      </script>
				    </div>
				    <div id="menu1" class="tab-pane fade">
				     
				     </div>
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