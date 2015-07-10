<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${root }/js/jquery/jquery.js"></script>
<script src="${root }/js/teamPage/teamMatching.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1442260e0c6af86974001269a7312e42&libraries=services"></script>
<link href="${root}/css/teamPage/matchingMap.css" type="text/css" rel="stylesheet"/>
</head>
<body onload="viewMap('${myTeamName }','${otherTeamName}','${myMatchingDto.matchingLatlng }','${myMatchingDto.matchingDistance }','${otherMatchingDto.matchingLatlng }','${otherMatchingDto.matchingDistance }')">
	<div id="map" style="width:100%;height:450px;position:relative;overflow:hidden;"></div>

    <div style="margin-bottom: 120px" id="menu_wrap" class="bg_white">
        <hr>
        <ul id="placesList" style="margin-left:-50px;"></ul>
        <div id="pagination"></div>
    </div>
    <br/><br/>
    <label>경기장 타입 : </label><input id="stadium" type="button" value="경기장"><input id="university" type="button" value="대학교"><input id="highSchool" type="button" value="고등학교">
	<br/><br/>
	
	<div style="text-align: center;"><input type="button" value="확인" onclick="closeMap()"></div>
</body>
</html>