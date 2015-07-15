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

<style>
.navbar .nav > li > a {
  @navbarHeight: 60px;
  @elementHeight: 20px;
  padding: ((@navbarHeight - @elementHeight) / 2 - 1) 10px ((@navbarHeight - @elementHeight) / 2 + 1);
  line-height: 19px;
}
</style>
</head>
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header" >
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <strong><a class="navbar-brand" href="${root }/start.jsp" style="font-size:50px; line-height: 70px; height: 100px;">SML KOREA</a></strong>     
    </div>

    <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">      
		  <form class="form-inline"  id="searchForm" name="searchForm" style="padding-top:15px;">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="팀명을 검색하세요." name="teamName" id="searchTeamName">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button" id="goTeamPage">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>이동
					</button>
				</span>
			</div><!-- /input-group -->			
		 </form>
	      
	     <ul class="nav navbar-nav ">
	        <!-- <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li> -->
	        <li><a href="${root}/soccer/soccerMain.do?legion=legion">축구</a></li>
	        <li><a href="#">야구</a></li>
	        <li><a href="#">풋살</a></li>
	        <li><a href="#">족구</a></li>
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
	     </ul>     
    </div>
  </div>
</nav>
		
	<p>This is a sample text.This is a sample text.This is a sample text.
   		This is a sample text.</p>
</body>
</html>