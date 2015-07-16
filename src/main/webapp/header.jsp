<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!-- test login session -->
<c:set var="teamId" value="${teamId}" scope="session"/>
<c:set var="teamName" value="${teamName }" scope="session"/>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${root }/resources/css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="${root }/resources/css/jquery-ui.css"/>

<script src="${root }/resources/js/jquery.js"></script>
<script src="${root }/resources/js/bootstrap.js"></script>
<script src="${root }/resources/js/smlStart.js"></script>

</head>
<body>



<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">        
          <a class="navbar-brand" href="${root}/team/teamMain.do?teamName=${teamName}"><font color="white"><strong>SML Korea</strong></font></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse  navbar-right">
        	<div class="row">
	          <ul class="nav navbar-nav">
	            <li>
			        <form class="form-inline"  id="searchForm" name="searchForm" style="padding-top:10px;">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="팀명을 검색하세요." name="teamName" id="searchTeamName">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" id="goTeamPage">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>
							</span>
						</div><!-- /input-group -->			
					</form>
		        </li> 
	          	<li><a href="${root}/soccer/soccerMain.do?legion=legion">축구</a></li>
		        <li><a href="#">야구</a></li>
		        <li><a href="#">풋살</a></li>
		        <li><a href="#">족구</a></li>
		       <%--  <li>
			        <c:if test="${teamId!=null }">
				        <li class="dropdown">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${teamId }님 <span class="caret"></span></a>
				          <ul class="dropdown-menu" role="menu">
				            <li><a href="${root }/team/teamMain.do?teamName=${teamName}">${teamName }팀</a></li>
				            <li class="divider"></li>
				            <li><a href="${root}/teamPage/logout.do?teamId='${teamId}">로그아웃</a></li>
				          </ul>
				        </li>
				    </c:if>
	          	</li> --%>
		        <li style="padding-top:10px;">			       	
					  <button type="button"  class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					    <span class="glyphicon glyphicon-th-large"></span>
					  </button>
					  <ul class="dropdown-menu" role="menu">
				    	  <c:if test="${teamGrade != null }">	    
							<li><a href="${root }/member/myInfoPage.do?teamName=${teamName }">${teamId }님</a></li>
							<li><a data-toggle="modal" data-target="#modalTeamBoard" onclick="getTeamBoardData('${root}','${teamName}')">팀공지사항</a></li>
							<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}&teamCode=${team.teamCode}&teamGrade=${teamGrade}">팀원소개</a></li>
							<li><a href="${root }/teamPage/teamScheduleEdit.do?teamName=${teamName}">팀 스케쥴</a></li>
							<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${team.teamName}">팀 기록</a></li>
			
							<li class="divider"></li>
							<li><a data-toggle="modal" data-target="#modalTeamBoard" onclick="getTeamBoardData('${root}','${teamName}')">팀공지사항</a></li>
							<li><a href="${root }/teamPage/manageTeamMember.do?teamName=${team.teamName}&teamCode=${team.teamCode}&teamGrade=${teamGrade}">팀원관리</a></li>
							<li><a href="${root }/teamPage/teamScheduleEdit.do?teamName=${teamName}">스케쥴관리</a></li>
							<li><a href="${root }/teamPage/matching.do?teamName=${team.teamName}">매칭관리</a></li>
							<li><a href="${root }/teamPage/manageTeamEmblem.do?teamName=${team.teamName}">팀 로고 관리</a></li>
							<li class="divider"></li>
							<li><a href="${root}/teamPage/logout.do?teamId='${teamId}'">로그아웃</a></li>
					  	</c:if>
					  	
					  	<c:if test="${teamGrade == null }">
							<li><a data-toggle="modal" data-target="#modalTeamBoard" onclick="getTeamBoardData('${root}','${teamName}')">팀공지사항</a></li>
							<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}&teamCode=${team.teamCode}">팀원소개</a></li>
							<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${team.teamName}">팀 기록</a></li>
							<li><a href="${root }/teamPage/teamScheduleEdit.do?teamName=${teamName}">팀 스케쥴</a></li>
						</c:if>				
					  </ul>							
		        </li>		         
	          </ul> 
			</div>       
        </div>
      </div>
    </nav>

	<p>This is a sample text.This is a sample text.This is a sample text.
   		This is a sample text.</p>
   		
   		
</body>
</html>