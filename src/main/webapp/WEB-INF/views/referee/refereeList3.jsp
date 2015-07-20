<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>심판 현황</title>
<script type="text/javascript" src="${root }/js/external/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${root }/js/referee/referee.js"></script>
<script type="text/javascript" src="${root}/js/xhr/xhr.js"></script>
</head>
<body>
	
	<a href="${root}/mainPage.jsp"><img alt="logo" src=""></a>
	<a href="${root}/mainPage.jsp">SML Korea</a>
	
	<h3>${sportType } 심판현황</h3>
	
	<div>
		<h3>
			<a href="${root}/soccer/soccerMain.do">홈</a>
			<a href="${root}/soccer/soccerRule.do">경기규칙</a>
			<a href="${root}/soccer/soccerTeamList.do">팀리스트</a>
			<a href="${root}/record/soccerGameScore.do">기록리스트</a>
			<a href="${root}/referee/refereeList.do?sportType=${sportType}">심판현황</a>
		</h3>
	</div>	
	
	<div>
		<label>지역:</label>
		<select id="sido2" onchange="refereeRegion('${root }', '${sportCode}', this.value)">			
			<c:forEach var="sido" items="${sidoList}">		
				<option value="${sido }">${sido }</option>				
			</c:forEach>
		</select>
	</div>
	
	<!-- Referee List -->
	<c:if test="${refereeList==null}">
		<div>존재하는 심판이 없습니다.</div>
	</c:if>
	
	<c:if test="${refereeList!=null}">
		<div id="list">	
			<c:forEach var="referee" items="${refereeList}">				
				<div>
					<ul>					
						<img src="${root }/img/refereeImg/${referee.refereePicture}" alt="" />												
						<li>이름 :  ${referee.refereeName }</li>
						<li>생일 :  ${refefree.refereeBirth }</li>
						<li>지역 :  ${referee.sido }  ${referee.gugun }</li>
					</ul>			
				</div>
			</c:forEach>															
		</div>	
	</c:if>
	
	<!-- 페이지 번호 -->
	<center>
		<c:if test="${count>0 }">
			<c:set var="pageBlock" value="${5}"/>
			
			<fmt:parseNumber var="pageCount" value="${count/boardSize+ (count/boardSize==0 ? 0:1) }" integerOnly="true"/>
			
			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
			<c:set var="startPage" value="${rs*pageBlock+1 }"/>
			<c:set var="endPage" value="${startPage+pageBlock-1 }"/>			
			<c:if test="${endPage>pageCount }">
				<c:set var="endPage" value="${pageCount }"/>
			</c:if>
			
			<c:if test="${startPage>pageBlock }">
				<a href="${root }/referee/refereeList.do?pageNumber=${startPage-pageBlock }&sportType=${sportType}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage}">
				<a href="${root }/referee/refereeList.do?pageNumber=${i}&sportType=${sportType}">[${i }]</a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<a href="${root }/referee/refereeList.do?pageNumber=${startPage+pageBlock }&sportType=${sportType}">[다음]</a>
			</c:if>
		</c:if>
	</center>
	
	<input type="button" value="심판 지원하기" onclick="location.href='${root}/referee/registerReferee.do?sportType=${sportType}'"/>
</body>
</html>