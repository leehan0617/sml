<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
						<li>생일 :  ${referee.refereeBirth }</li>
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
</body>
</html>