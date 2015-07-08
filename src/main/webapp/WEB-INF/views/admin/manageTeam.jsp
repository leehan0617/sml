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
	<form class=""  action="" method="GET">
		<h2>회원관리(팀 관리) by Manager</h2>
	
	<c:if test="${count==0}">	
		<span>
			<span style="text-align: center">등록된 팀이없습니다.</span>
		</span>		
	</c:if>
	
	<c:if test="${count>0}">	
		<div>
			<span style="text-align: center">종목</span>
			<span style="text-align: center">엠블럼</span>
			<span style="text-align: center">팀명</span>	
			<span style="text-align: center">팀장이름</span>
			<span style="text-align: center">생년월일</span>
			<span style="text-align: center">지역</span>	
			<span style="text-align: center">이메일</span>
			<span style="text-align: center">연락처</span>
			<span style="text-align: center">성별</span>							
		</div>		
	<br/>
	
	</c:if>	
	
	<c:forEach var="containerList" items="${containerList}">
			<span>${containerList.SPORTTYPE}</span>
			&nbsp;&nbsp;&nbsp;
			<span>${containerList.EMBLEM}</span>&nbsp;&nbsp;&nbsp;		
			<span><a href="${root }/teamPage/teamPageMain.do?teamCode=${containerList.TEAMCODE}">${containerList.TEAMNAME}</a></span>&nbsp;&nbsp;&nbsp;	
			<span>${containerList.TEAMLEADERNAME}</span>&nbsp;&nbsp;&nbsp;	
			<span>${containerList.MEMBERBIRTH}</span>&nbsp;&nbsp;&nbsp;	
			<span>${containerList.MEMBERREGION}</span>&nbsp;&nbsp;&nbsp;	
			<span>${containerList.MEMBEREMAIL}</span>&nbsp;&nbsp;&nbsp;	
			<span>${containerList.MEMBERPHONE}</span>&nbsp;&nbsp;&nbsp;	
			<span>${containerList.MEMBERGENDER}</span>&nbsp;&nbsp;&nbsp;	
			<a href="${root }/admin/manageTeamDelete.do?teamCode=${containerList.TEAMCODE}">[삭제]</a>	
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
				<a href="${root }/admin/manageTeam.do?pageNumber=${startPage-pageBlock}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="${root }/admin/manageTeam.do?pageNumber=${i}">[${i }]</a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<a href="${root }/admin/manageTeam.do?pageNumber=${startPage+pageBlock}">[다음]</a>
			</c:if>
		</c:if>
	</center>
</form>		
</body>
</html>