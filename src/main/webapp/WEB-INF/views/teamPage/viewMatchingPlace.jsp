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
	<div id="map" style="width:100%;height:450px;"></div>
</body>
</html>