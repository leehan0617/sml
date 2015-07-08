<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<a href="${root}/start.jsp"><img alt="logo" src=""></a>
		<a href="${root}/start.jsp">SML Korea</a>
	</div>

	<c:if test="${teamGrade != null }">
		<li>${teamId }님</li>
		<li><a href="${root }/teamPage/teamPageMain.do?teamName=${teamName}">메인</a></li>
		<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${teamName}">팀 공지사항</a></li>
		<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${teamName}">팀원소개</a></li>
		<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${teamName}">팀 기록</a></li>
		<li><a href="${root }/viewSchedule.do">팀 스케쥴</a></li>
		<li>----------</li>
		<li><a href="${root }/teamPage/manageTeamBoard.do?teamName=${teamName}">공지사항관리</a></li>
		<li><a href="${root }/teamPage/manageTeamMember.do?teamName=${teamName}">팀원관리</a></li>
		<li><a href="${root }/manageTeamSchedule.do">스케쥴관리</a></li>
		<li><a href="${root }/startMatching.do">매칭관리</a></li>
		<li>-----------</li>
		<li><a href="${root}/teamPage/logout.do?teamId='${teamId}'">로그아웃</a></li>
  	</c:if>
  	
  	<c:if test="${teamGrade == null }">
		<li><a href="${root }/teamPage/teamPageMain.do?teamName=${teamName}">메인</a></li>
		<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${teamName}">팀 공지사항</a></li>
		<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${teamName}">팀원소개</a></li>
		<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${teamName}">팀 기록</a></li>
		<li><a href="${root }/viewSchedule.do">팀 스케쥴</a></li>
	</c:if>
	
	<h1>공지사항 읽기</h1>
	<br/>
	<div>
		<span style="color:blue;">글 제목</span>
		<span>${board.boardTitle }</span>
	</div>
	<div>
		<span style="color:blue;">작성자</span>
		<span>${board.boardWriter}</span>
	</div>
	<div>
		<span style="color:blue;">작성일</span>
		<span>${board.boardDate}</span>
	</div>
	<div>
		<span style="color:blue;">글 내용</span>
		<span>${board.boardContent}</span>
	</div>
	<c:if test="${teamGrade == null }">
		<input type="button" value="글 목록" onclick="location.href='${root }/teamPage/viewTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}'"/>
	</c:if>
	
	<c:if test="${teamGrade != null }">
		<input type="button" value="글 목록" onclick="location.href='${root }/teamPage/manageTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}'"/>
		<input type="button" value="수정" onclick="location.href='${root }/teamPage/updateTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}&boardNumber=${board.boardNumber}'"/>
	</c:if>
	
</body>
</html>