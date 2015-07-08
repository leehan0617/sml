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
		<li><a href="${root }/viewTeamRecord">팀 기록</a></li>
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
		<li><a href="${root }/viewSchedule.do">팀 기록</a></li>
		<li><a href="${root }/viewSchedule.do">팀 스케쥴</a></li>
	</c:if>
	
	<c:if test="${board==null }">
		<h1>공지사항 쓰기</h1>
		<br/>
		<form action="" onsubmit="location.href='${root }/teamPage/writeTeamBoard.do'" method="post">
			<input type="hidden" value="${currentPage}" name="currentPage"/>
			<input type="hidden" value="${teamName}" name="teamName"/>
			<div>
				<span style="color:blue;">공지 제목</span>
				<input type="text" name="boardTitle"/>
			</div>
			<div>
				<span style="color:blue;">작성자</span>
				<input type="text" name="boardWriter" value="${writer}" disabled="disabled"/>
				<input type="hidden" name="boardWriter" value="${writer}"/>
			</div>
			<div><span style="color:blue;">공지 내용</span></div>
			<div>
				<textarea rows="10" cols="30" name="boardContent"></textarea>
			</div>
			<input type="submit" value="글쓰기" />
			<input type="button" value="목록" onclick="location.href='${root }/teamPage/manageTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}'"/>
		</form>
	</c:if>
	
	<c:if test="${board!=null }">
		<h1>공지사항 수정</h1>
		<br/>
		<form action="" onsubmit="location.href='${root }/teamPage/updateTeamBoard.do'" method="post">
			<input type="hidden" value="${currentPage}" name="currentPage"/>
			<input type="hidden" value="${teamName}" name="teamName"/>
			<div>
				<span style="color:blue;">공지 제목</span>
				<input type="text" name="boardTitle" value="${board.boardTitle }"/>
			</div>
			<div>
				<span style="color:blue;">작성자</span>
				<input type="text" name="boardWriter" value="${board.boardWriter}" disabled="disabled"/>
				<input type="hidden" name="boardWriter" value="${board.boardWriter}"/>
			</div>
			<div><span style="color:blue;">공지 내용</span></div>
			<div>
				<textarea rows="10" cols="30" name="boardContent">${board.boardContent }</textarea>
			</div>
			<input type="submit" value="수정" />
			<input type="button" value="목록" onclick="location.href='${root }/teamPage/manageTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}'"/>
		</form>
	</c:if>
</body>
</html>