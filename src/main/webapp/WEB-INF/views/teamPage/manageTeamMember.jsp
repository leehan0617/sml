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
<script src="${root }/js/jquery/jquery.js"></script>
<script src="${root }/js/jquery/jquery-ui.js"></script>
<script src="${root }/js/teamPage/teamPage.js"></script>
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
	
	<h1>팀원 소개</h1>
	<br/>
	
	<div>
		<span>번호</span>
		<span>이름</span>
		<span>생년월일</span>
		<span>지역</span>
		<span>이메일</span>
		<span>전화번호</span>
		<span>성별</span>
	</div>
	<c:set var="count" value="${count}"></c:set>
	<c:set var="boardSize" value="${boardSize}"></c:set>
	<c:set var="blockSize" value="${blockSize}"></c:set>
	<c:set var="blockCount" value="${blockCount}"></c:set>
	<fmt:parseNumber var="rs" value="${(currentPage-1)/blockSize}" integerOnly="true"></fmt:parseNumber>
	
	<c:set var="startBlock" value="${rs*blockSize+1 }"></c:set>
	<c:set var="endBlock" value="${startBlock+blockSize-1}"></c:set>
	
	<br/>
	<c:forEach var="member" items="${teamMemberList}">
		<div>
			<span>${member.rnum}</span>
			<span>${member.memberName}</span>
			<span>${member.memberBirth}</span>
			<span>${member.memberRegion}</span>
			<span>${member.memberEmail}</span>
			<span>${member.memberPhone}</span>
			<span>${member.memberGender}</span>
			<span><input type="button" value="삭제" onclick="return deleteMember('${root }','${currentPage}','${member.memberCode}')"/></span>
		</div>
	</c:forEach>
	
	<c:if test="${startBlock>blockSize}">
		<a href="${root }/teamPage/manageTeamMember.do?teamName=${teamName}&currentPage=${startBlock-blockSize}">[이전]</a>
	</c:if>
	
	<c:if test="${endBlock>blockCount}">
		<c:set var="endBlock" value="${blockCount}"></c:set>
	</c:if>
	
	<c:forEach var="blockNumber" begin="${startBlock}" end="${endBlock}">
		<a href="${root }/teamPage/manageTeamMember.do?teamName=${teamName}&currentPage=${blockNumber}">[${blockNumber}]</a>
	</c:forEach>
	
	<c:if test="${endBlock<blockCount}">
		<a href="${root }/teamPage/manageTeamMember.do?teamName=${teamName}&currentPage=${startBlock+blockSize}">[다음]</a>
	</c:if>
	<br/>
	
	<input type="button" value="팀원 추가" id="addMember"/>
	
	<form action="${root}/teamPage/addMember.do" id="addMemberForm" method="post" onsubmit="return addMember(this)">
		<input placeholder="이름" type="text" name="memberName">
		<br/>
		<input placeholder="생일" type="text" name="memberBirth">
		<br/>
		<input placeholder="지역" type="text" name="memberRegion">
		<br/>
		<input placeholder="번호" type="text" name="memberPhone">
		<br/>
		<input placeholder="이메일" type="text" name="memberEmail">
		<br/>
		<select id="gender">
			<option>남</option>
			<option>여</option>
		</select>
		<input type="hidden" name="memberGender">
		<input type="hidden" name="teamName" value="${teamName}">
		<input type="hidden" name="currentPage" value="${currentPage}">
		<br/>
		<input type="submit" value="등록">
		<input type="button" value="취소">
	</form>
	
	
</body>
</html>