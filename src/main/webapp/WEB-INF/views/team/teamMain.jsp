<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:if test="${team!=null}">
		<c:set var="teamId" value="${teamId}" scope="session"/>
		<c:set var="teamGrade" value="${teamGrade }" scope="session"/>
		<c:set var="teamName" value="${teamName }" scope="session"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>팀페이지</title>
	<link rel="stylesheet" type="text/css" href="${root }/resources/css/bootstrap.css"/>
	
	<script src="${root }/resources/js/jquery.js"></script>
	<script src="${root }/resources/js/angular.js"></script>
	<script src="${root }/resources/js/bootstrap.js"></script>
</head>
<body>
	<div class="row">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-3"><h3><strong>SML KOREA</strong></h3></div>
	  		<div class="col-md-4"></div>
	  		<div class="col-md-4">
	  			<form class="form-inline"  id="searchForm" name="searchForm" style="padding-top:15px;">
		  			<div class="input-group">
		      			<input type="text" class="form-control" placeholder="팀명을 검색하세요." id="searchTeamName">
			    		<span class="input-group-btn">
			      		<button class="btn btn-default" type="button">
			      		  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>찾기
			      		</button>
			      		</span>
		    		</div><!-- /input-group -->
	  			</form>
	  	   </div>
	 </div>
	<div>
		<a href="${root}/mainPage.jsp"><img alt="logo" src=""></a>
		<a href="${root}/mainPage.jsp">SML Korea</a>
	</div>
	
	<c:if test="${team==null}">
	<div style="text-align:center;">
		<h1>SML KOREA</h1>
		<br/>
		<h6>해당 팀이 존재하지 않습니다.</h6>
	</div>
		
	</c:if>
	
	<c:if test="${team!=null}">
	<div>
		SML KOREA 
		<ul>
			<c:if test="${teamGrade != null }">
				<li>${teamId }님</li>
				<li><a href="${root }/teamPage/teamPageMain.do?teamName=${team.teamName}">메인</a></li>
				<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${team.teamName}">팀 공지사항</a></li>
				<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}">팀원소개</a></li>
				<li><a href="${root }/teamPage/teamSchedule.do?teamName=${team.teamName}">팀 스케쥴</a></li>
				<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${team.teamName}">팀 기록</a></li>

				<li>----------</li>
				<li><a href="${root }/teamPage/manageTeamBoard.do?teamName=${team.teamName}">공지사항관리</a></li>
				<li><a href="${root }/teamPage/manageTeamMember.do?teamName=${team.teamName}">팀원관리</a></li>
				<li><a href="${root }/teamPage/teamScheduleEdit.do">스케쥴관리</a></li>
				<li><a href="${root }/teamPage/matching.do?teamName=${team.teamName}">매칭관리</a></li>
				<li>-----------</li>
				<li><a href="${root}/teamPage/logout.do?teamId='${teamId}'">로그아웃</a></li>
		  	</c:if>
		  	
		  	<c:if test="${teamGrade == null }">
				<li><a href="${root }/teamPage/teamPageMain.do?teamName=${team.teamName}">메인</a></li>
				<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${team.teamName}">팀 공지사항</a></li>
				<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}">팀원소개</a></li>
				<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${team.teamName}">팀 기록</a></li>
				<li><a href="${root }/viewSchedule.do">팀 스케쥴</a></li>
			</c:if>

		</ul>
	</div>
	
	<div>
		<img alt="팀 로고 이미지 넣어야함" src=""/>
		<h3>팀 이름 : ${team.teamName}</h3>
		<input id="teamState" style="color: gray;"type="button" value="매칭 대기 중">
	</div>
	
	<div>
		팀소개 넣는칸
	</div>
	
	<div>
		공지사항 넣는칸
	</div>
	
	<div>
		달력 넣는칸
	</div>
	
	<div>
		<div>
			기록실 넣는칸
		</div>
		
		<div>
			자기팀에관한 정보 넣는칸
		</div>
	</div>
	
	<div>
		<div>
			<label>닉네임</label> <input type="text" name="nickName"/>
			<label>비밀번호</label> <input type="text" name="password"/>
			<input type="text" placeholder="한마디 남겨주세요" name="content"/>
			<input type="button" value="작성"/>
		</div>
		
		<div>
			댓글 리스트 나오는창
		</div>
	</div>	
	</c:if>
</body>
</html>
