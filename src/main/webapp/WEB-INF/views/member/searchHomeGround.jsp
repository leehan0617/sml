<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${root}/css/map/map.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/bootstrap.css"/>

<script src="${root }/resources/js/bootstrap.js"></script>
</head>
<body>
	<div>
	<div>
		<div class="map_wrap" align="center">
	    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	
	
	    <div id="menu_wrap" class="bg_white">
	        <div class="option">
	            <p>
	                키워드 : <input type="text" id="keyword" size="15"/> 
	                <input type="button" id="search" value="검색"/>
	            </p>
	        </div>
	        <hr>
	        <ul id="placesList"></ul>
	        <div id="pagination"></div>
	    	</div>
		</div>
	</div>	
	
	<div class="jumbotron">
		<div id="homeGround"></div>
		<div align="center">
			<input type="button" value="해당 주소로 설정" onclick="selectHomeGround()">
		</div>
	</div>
	</div>			
</body>

<script type="text/javascript" src="${root}/js/jquery/jquery.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1442260e0c6af86974001269a7312e42&libraries=services"></script>
<script type="text/javascript" src="${root}/js/member/map.js"></script>
<script type="text/javascript" src="${root}/js/member/member.js"></script>
<script type="text/javascript" src="${root}/js/xhr/xhr.js"></script>
</html>