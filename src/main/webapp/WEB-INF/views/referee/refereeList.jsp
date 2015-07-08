<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>심판 현황</title>
</head>
<body>
	
	<a href="${root}/start.jsp"><img alt="logo" src=""></a>
	<a href="${root}/start.jsp">SML Korea</a>
	
	<h3>심판현황</h3>
	
	<div>
		<h3>
			<a href="${root}/soccer/soccerMain.do">홈</a>
			<a href="${root}/soccer/soccerRule.do">경기규칙</a>
			<a href="${root}/soccer/soccerTeamList.do">팀리스트</a>
			<a href="${root}/record/soccerGameScore.do">기록리스트</a>
			<a href="${root}/referee/refereeList.do/">심판현황</a>
		</h3>
	</div>	
	
	<div>
		<input type="button" value="전체"/>
		<input type="button" value="서울"/>
		<input type="button" value="대전"/>
		<input type="button" value="대구"/>
		<input type="button" value="부산"/>
		<input type="button" value="강원"/>
	</div>
	
	<!-- Referee List -->
	<c:if test="${teamList==null}">
		<div>존재하는 심판이 없습니다.</div>
	</c:if>
	
	<c:if test="${refereeList!=null}">
		<div>	
			<c:forEach var="referee" items="${refereeList}">				
				<div>
					<ul>
						<li><img alt="${referee.refereePicture }" src=""/></li>
						<li>심판이름 ${referee.refereeName }</li>
						<li>심판나이 ${referee.refereeBirth }</li>
						<li>심판지역 ${referee.refereeAddress }</li>
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
				<a href="${root }/referee/refereeList.do?pageNumber=${startPage-pageBlock }">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage}">
				<a href="${root }/referee/refereeList.do?pageNumber=${i}">[${i }]</a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<a href="${root }/referee/refereeList.do?pageNumber=${startPage+pageBlock }">[다음]</a>
			</c:if>
		</c:if>
	</center>
	
	<input type="button" value="심판 지원하기" onclick="location.href='${root}/referee/registerReferee.do'"/>
</body>
</html>