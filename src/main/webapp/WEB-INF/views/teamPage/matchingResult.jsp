<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매칭페이지</title>
</head>
<script src="${root }/js/jquery/jquery.js"></script>
<script src="${root }/js/teamPage/teamPage.js"></script>
<script src="${root }/js/teamPage/teamMatching.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1442260e0c6af86974001269a7312e42&libraries=services"></script>
<link href="${root}/css/teamPage/matchingMap.css" type="text/css" rel="stylesheet"/>
<body>	
	<c:if test="${matchingDto.matchingState=='후' }">
	
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h1>Result Matching</h1>
		<div style="font-size: 40px; font: bold;">
			${normalMatchInfo.TEAM1 }
			<span style="color: red;">VS</span>
			${normalMatchInfo.TEAM2 }
		</div>
	</div>
	
	<div class="modal-body">
		<c:if test="${normalMatchInfo.TEAM1==teamName }"><div>team1</div>
			<h2>나의 팀</h2>
			<h4>emblem : ${myTeamDto.emblem }</h4>
			<h4>name : ${normalMatchInfo.TEAM1}</h4>
			<h4>place : ${matchingDto.matchingPlace}</h4>
			<h4>Day : ${matchingDto.matchingDay}</h4>
			<h4>Time : ${matchingDto.matchingTime}</h4>
			<br/><br/>
			
			<h2>상대 팀</h2>
			<h4>emblem : ${otherTeamDto.emblem }</h4>
			<h4>name : ${normalMatchInfo.TEAM2 }</h4>
			<h4>place : ${otherMatchingDto.matchingPlace}</h4>
			<h4>Day : ${otherMatchingDto.matchingDay}</h4>
			<h4>Time : ${otherMatchingDto.matchingTime}</h4>
			<br/><br/>
			
		
			<h2>날씨</h2>
			<c:forEach var="weather" items="${weatherAllList}" begin="1" end="7">
				<span>${weather.region }</span>
				<span>${weather.tmEf }</span>
				<span>${weather.wf }</span>
				<span>${weather.tmn }</span>
				<span>${weather.tmx }</span>
				<br/>
			</c:forEach>
			
		</c:if>
		<c:if test="${normalMatchInfo.TEAM2==teamName }"><div>team2</div>
			<h2>나의 팀</h2>
			<h4>emblem : ${myTeamDto.emblem }</h4>
			<h4>name : ${normalMatchInfo.TEAM2}</h4>
			<h4>place : ${matchingDto.matchingPlace}</h4>
			<h4>Day : ${matchingDto.matchingDay}</h4>
			<h4>Time : ${matchingDto.matchingTime}</h4>
			<br/><br/>
			
			<h2>상대 팀</h2>
			<h4>emblem : ${otherTeamDto.emblem }</h4>
			<h4>name : ${normalMatchInfo.TEAM1 }</h4>
			<h4>place : ${otherMatchingDto.matchingPlace}</h4>
			<h4>Day : ${otherMatchingDto.matchingDay}</h4>
			<h4>Time : ${otherMatchingDto.matchingTime}</h4>
			<br/><br/>
			
			<h2>날씨</h2>
			<c:forEach var="weather" items="${weatherAllList}" begin="1" end="7">				
				<span>${weather.region }</span>
				<span>${weather.tmEf }</span>
				<span>${weather.wf }</span>
				<span>최저온도 ${weather.tmn }</span>
				<span>최고온도 ${weather.tmx }</span>
				<br/>
			</c:forEach>
		</c:if>
	
		<h2>날씨 정보 넣어야 함</h2>
		<br/>
	
		<h3>경기장 정보 부분 </h3>
	
	</div>
	
	<div class="modal-footer">
		<input type="button" value="경기 결과 입력">
		<input type="button" value="경기장 정보" onclick="viewMatchingPlace('${root }','${myTeamDto.teamCode }','${otherTeamDto.teamCode }')">
		<input type="button" value="상대 팀 및 팀장 정보" onclick="viewOtherTeamInfo('${root}','${otherMatchingDto.teamCode}')">
	</div>
	
	</c:if>
	
	
	
	
	
	<c:if test="${matchingDto.matchingState=='중' }">
		<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h1>매칭이 진행중입니다.</h1>
		</div>
		
		<div class="modal-body">				
			<div class="row well">
			  <div class="col-md-1"></div>
			  
			  <div class="col-md-4 well">
			  	<div class="row">
			  		<div class="col-xs-6 col-md-3" style="text-align:center">
		    			<a href="#" class="thumbnail" style="max-width:100%;">
		    				<img src="${root}/img/teamImg/${myTeamDto.emblem } alt=".." width=188/>
		      			</a>
		  			</div>
				</div>
			  </div>
			  <div class="col-md-2 well"><h3>vs</h3></div>
			  <div class="col-md-4 well">
			  	<div class="row">
			  		<div class="col-xs-6 col-md-3">
		    			<a href="#" class="thumbnail">
		      				<img src="${root }/img/teamImg/searching.gif" alt="..." width=188>
		    			</a>
		  			</div>
			  	</div>
			  </div>
			  <div class="col-md-1"></div>
			</div>				
		
			<h5> 팀 이름: ${myTeamDto.teamName }</h5>
			<h5> 매칭 장소 : ${matchingDto.matchingPlace}</h5>
			<h5> 매칭 희망 요일 : ${matchingDto.matchingDay}</h5>
			<h5> 매칭 희망 시간 : ${matchingDto.matchingTime}</h5>
			<br/><br/>
			
			<div style="color:green;"><h5>도움말 : 매칭이 잘 이루어지지 않는다면..</h5></div>
			<h6> -> 거리, 요일, 시간대 등의 조건을 넓히면 매칭이 더욱 쉬워 질 수 있습니다. </h6>		
		</div>
		
		<div class="modal-footer">'
			<button type="button" class="btn btn-warning" onclick="javascript:location.href='${root}/teamPage/deleteMatching.do?matchingCode=${matchingDto.matchingCode }&teamName=${teamName}'">
			매칭 취소하기
			</button>
			<input type="button" value="매칭 취소" onclick="javascript:location.href='${root}/teamPage/deleteMatching.do?matchingCode=${matchingDto.matchingCode }&teamName=${teamName}'">
		</div>
	</c:if>
</body>
</html>
