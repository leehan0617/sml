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
<script type="text/javascript" src="${root}/js/jquery/jquery.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1442260e0c6af86974001269a7312e42&libraries=services"></script>
<script type="text/javascript" src="${root}/js/admin/map.js"></script>
<script type="text/javascript" src="${root}/js/admin/searchPlace.js"></script>
</head>
<body>
	<body>
	<div class="map_wrap">
    <div id="map" style="width:100%;height:450px;position:relative;overflow:hidden;"></div>

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
	
	<div>경기장 1 : <span id="place1"></span></div>
	<div>경기장 2 : <span id="place2"></span></div>
	<div>경기장 3 : <span id="place3"></span></div>
	<div align="center">
		<input id="selectPlace" type="button" value="해당 주소로 설정">
	</div>
	
</body>
</html>