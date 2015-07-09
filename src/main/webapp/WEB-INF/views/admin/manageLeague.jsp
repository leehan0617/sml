<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>팀목록보기</title>
<script src="${root }/js/external/jquery-1.11.3.min.js"></script>
</head>
<body>
	<form class=""  action="${root }/admin/leagueDelete.do" method="GET">
	
		<h2>리그관리 by Manager</h2>
		
	
	<c:if test="${count==0}">	
		<span>
			<span style="text-align: center">등록된 리그가없습니다.</span>
		</span>		
	</c:if>
	
	<c:if test="${count>0}">	
		<div>
			<span style="text-align: center">종목</span>
			<span style="text-align: center">*</span>
			<span style="text-align: center">개최지</span>
			<span style="text-align: center">리그명</span>	
			<span style="text-align: center">참가인원</span>
			<span style="text-align: center">요일</span>
			<span style="text-align: center">경기시간</span>	
			<span style="text-align: center">시작</span>
			<span style="text-align: center">종료</span>
										
		</div>		
	<br/>
	
	</c:if>	
	
	<c:forEach var="manageLeagueList" items="${manageLeagueList}">
			<span>${manageLeagueList.leagueSport}</span>
			&nbsp;&nbsp;&nbsp;
			<span><img src="${root }/img/leagueImg/${manageLeagueList.leagueImage}"></span>&nbsp;&nbsp;&nbsp;	
			<span>${manageLeagueList.leagueRegion}</span>&nbsp;&nbsp;&nbsp;		
			<span><a href="${root }/admin/leagueInfo.do?leagueCode=${manageLeagueList.leagueCode}&pageNumber=${currentPage}">${manageLeagueList.leagueName}</a></span>&nbsp;&nbsp;&nbsp;	
			<span>${manageLeagueList.leagueTeamNumber}</span>&nbsp;&nbsp;&nbsp;	
			<span>${manageLeagueList.leagueDay}</span>&nbsp;&nbsp;&nbsp;	
			<span>${manageLeagueList.leagueTime}</span>&nbsp;&nbsp;&nbsp;	
			<span>${manageLeagueList.leagueStartDate}</span>&nbsp;&nbsp;&nbsp;	
			<span>${manageLeagueList.leagueEndDate}</span>&nbsp;&nbsp;&nbsp;	
			<c:if test="${manageLeagueList.leagueState==-1 }">
				<input type="button" value="게시하기" onclick="location.href='${root}/admin/leagueSwitch.do?pageNumber=${currentPage }&leagueCode=${manageLeagueList.leagueCode }&leagueState=${manageLeagueList.leagueState}'"/>
			</c:if>
			
			<c:if test="${manageLeagueList.leagueState== 1 }">
				<input type="button" value="게시하지 않기" onclick="location.href='${root}/admin/leagueSwitch.do?pageNumber=${currentPage }&leagueCode=${manageLeagueList.leagueCode }&leagueState=${manageLeagueList.leagueState}'"/>
			</c:if>
			<a href="${root }/admin/leagueDelete.do?leagueCode=${manageLeagueList.leagueCode}">[삭제]</a>	
			<br/>
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