<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${root }/js/startPage.js"></script>
<script src="${root }/js/external/jquery-1.11.3.min.js"></script>	
<!--ajax crossdomain 우회-->
<script type="text/javascript" src="${root }/js/jquery.xdomainajax.js"></script>
<script type="text/javascript" src="${root }/js/scrollnews.js"></script>
<script type="text/javascript" src="${root }/js/soccer/soccer.js"></script>
</head>
<body>			
	<a href="${root}/mainPage.jsp"><img alt="logo" src=""></a>
	<a href="${root}/mainPage.jsp">SML Korea</a>
	<br/><br/><br/>
		
	<div>
		<h5>팀명으로 검색 (팀페이지로 이동)</h5>
		<form name="form">
			<input type="text" placeholder="teamName" name="teamName"><input type="button" value="검색" onclick="teamSearch(form,'${root}')"/>
		</form>		
		
		<h3>날씨 </h3>		
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
		<!-- <div id="weather"></div> -->
	</div>
	
	
	<div>
		<h3>
			<a href="${root}/soccer/soccerMain.do">홈</a>
			<a href="${root}/soccer/soccerRule.do">경기규칙</a>
			<a href="${root}/soccer/soccerTeamList.do">팀리스트</a>
			<a href="${root}/record/soccerGameScore.do">기록리스트</a>
			<a href="${root}/referee/refereeList.do?sportType=${sportType}">심판현황</a>
		</h3>
	</div>	
	
	
	
	<div id="matchingList">
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
	
	
	<div>
		<h3>공지사항</h3>
		<c:if test="${commonBoardList==null }">
			<div>
				<span>공지사항 없음</span>
			</div>
		</c:if>
		
		<c:if test="${commonBoardList!=null}">
			<a href="${root }/soccer/commonBoard.do">more</a>
			<div>
				<c:forEach var="commonBoard" items="${commonBoardList}">	
					<div>					
						<span>
							<fmt:formatDate value="${commonBoard.boardDate }" type="date" pattern="MM-dd"/>
						</span>
						<span>
							<a href="#" onclick="window.open('${root }/soccer/readCommonBoard.do?boardNumber=${commonBoard.boardNumber}', '공지사항', 'width=400, height=200');return false;" target="_blank">										
								${commonBoard.boardTitle }
							</a>
						</span>		
					</div>									
				</c:forEach>
			</div>
		</c:if>
		
		<c:if test="${count>0 }">
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
		</c:if>
	</div>		
		
		
	<div>
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
	
		
	<div>
		<h3>통계</h3>
	</div>
				
		
	<div>
		고객센터 부분
		<h3>전화번호 : 02 - 123 - 4567</h3>
		<h3>이메일 : smlKorea@sml.com</h3>
	</div>
</body>
</html>