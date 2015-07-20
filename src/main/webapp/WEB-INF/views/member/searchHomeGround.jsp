<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" contetn="width=device-width,initial-scale=1">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/resources/js/jquery.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1442260e0c6af86974001269a7312e42&libraries=services"></script>
<script type="text/javascript" src="${root}/js/member/map.js"></script>
<script type="text/javascript" src="${root}/resources/js/member.js"></script>
<script type="text/javascript" src="${root}/js/xhr/xhr.js"></script>
<script src="${root }/resources/js/bootstrap.js"></script>


<link href="${root}/css/map/map.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/bootstrap.css"/>
</head>
<body>
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
	    	<div class="col-sm-12" id="homeGround" align="center" style="font-size:30px;font-family:serif;font-style:oblique;"></div>
		</div>
		<div class="jumbotron">
			<div class="col-sm-12" align="center">
				<a  onclick="selectHomeGround()" class="btn btn-info btn-lg">
					<span class="glyphicon glyphicon-ok"></span>완료
				</a>
			</div>
		</div>
	<footer>
		<p>
			<span style="text-align:left;float:left;font-size:15px">&copy; 2015 <Strong>SML KOREA</Strong></span>
		</p>
	</footer>
</body>
</html>