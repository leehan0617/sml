<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root }/js/soccer/soccer.js"></script>
<script type="text/javascript" src="${root }/js/member/jquery.js"></script>	
<script type="text/javascript" src="${root }/js/scrollnews.js"></script>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>팀목록보기</title>
</head>
<body>
	<form class=""  action="" method="GET">
	
		<h2>리그관리 by Manager</h2>
	<c:if test="${count==0}">	
		<span>
			<span style="text-align: center">등록된 리그가없습니다.</span>
		</span>		
	</c:if>
	
	
	<c:if test="${count>0}">	
		<div>
			<span style="text-align: center">종목</span>
			<span style="text-align: center">이미지</span>
			<span style="text-align: center">개최지</span>
			<span style="text-align: center">리그명</span>	
			<span style="text-align: center">참가인원</span>
			<span style="text-align: center">요일</span>
			<span style="text-align: center">경기시간</span>	
			<span style="text-align: center">시작일</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="text-align: center">종료일</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
										
		</div>		
	<br/>
	</c:if>	
		<c:forEach var="soccerLeagueList" items="${soccerLeagueList}">
		<c:if test="${soccerLeagueList.leagueState==1}">
				<span>${soccerLeagueList.leagueSport}</span>
				&nbsp;&nbsp;&nbsp;
				<span><img src="${root}/img/leagueImg/${soccerLeagueList.leagueImage}"></span>&nbsp;&nbsp;&nbsp;	
				<span>${soccerLeagueList.leagueRegion}</span>&nbsp;&nbsp;&nbsp;		
				<span>${soccerLeagueList.leagueName}</span>&nbsp;&nbsp;&nbsp;	
				<span>${soccerLeagueList.leagueTeamNumber}</span>&nbsp;&nbsp;&nbsp;	
				<span>${soccerLeagueList.leagueDay}</span>&nbsp;&nbsp;&nbsp;	
				<span>${soccerLeagueList.leagueTime}</span>&nbsp;&nbsp;&nbsp;	
				<span>${soccerLeagueList.leagueStartDate}</span>&nbsp;&nbsp;&nbsp;	
				<span>${soccerLeagueList.leagueEndDate}</span>&nbsp;&nbsp;&nbsp;

				<input type="button" value="참가하기" onclick="applicate('${root}','${teamId}','${soccerLeagueList.leagueCode}','${soccerLeagueList.leagueTeamNumber}')"/>
				<br/>
				<br/>
		</c:if>
		</c:forEach>
	
	<!-- 페이지 번호 -->
	<center>
		<c:if test="${count>0 }">
			<c:set var="pageBlock" value="${6}"/>
			<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/>
			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
			
			<c:set var="startPage" value="${rs*pageBlock+1 }"/>
			<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
			
			<c:if test="${endPage>pageCount }">
				<c:set var="endPage" value="${pageCount }"/>
			</c:if>
			
			<c:if test="${startPage>pageBlock }">
				<a href="${root }/admin/manageLeague.do?pageNumber=${startPage-pageBlock}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="${root }/admin/manageLeague.do?pageNumber=${i}">[${i }]</a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<a href="${root }/admin/manageLeague.do?pageNumber=${startPage+pageBlock}">[다음]</a>
			</c:if>
		</c:if>
		
		
	</center>
</form>		
</body>
</html>