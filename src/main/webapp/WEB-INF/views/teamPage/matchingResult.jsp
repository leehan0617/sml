<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<h1>매칭 결과</h1>
		<%-- <div style="font-size: 40px; font: bold;">
			${normalMatchInfo.TEAM1 }
			<span style="color: red;">VS</span>
			${normalMatchInfo.TEAM2 }
		</div> --%>
	</div>
	
	<div class="modal-body">	
		
		<!-- 로고 -->	
		<div class="row">
		  <div class="col-md-1"></div>
		  
		  <div class="col-md-4" style="display:table-cell; text-align:center; vertical-align:middle; ">	
		  	<c:if test="${normalMatchInfo.TEAM1==teamName }">		  
		    	<a href="${root }/team/teamMain.do?teamName=${normalMatchInfo.TEAM1 }" target="_new">
		    		<img class="img-circle" src="${root}/img/teamImg/${myTeamDto.emblem }" alt=".." height="188px"/>
		      	</a>
	      	</c:if>
	      	
	      	<c:if test="${normalMatchInfo.TEAM2==teamName }">
	      		<a href="${root }/team/teamMain.do?teamName=${normalMatchInfo.TEAM2 }" target="_new">
		    		<img class="img-circle" src="${root}/img/teamImg/${myTeamDto.emblem }" alt=".." height="188px"/>
		      	</a>	
	      	</c:if>
	      	
		  </div>
		  <div class="col-md-2" style="display:table-cell; text-align:center; vertical-align:middle; height:230px; padding-top:70px;"><h2>vs</h2></div>
		  
		  <div class="col-md-4" style="display:table-cell; text-align:center; vertical-align:middle; ">
	    	<c:if test="${normalMatchInfo.TEAM1==teamName }">		  
		    	<a href="${root }/team/teamMain.do?teamName=${normalMatchInfo.TEAM2}" target="_new">
		    		<img class="img-circle" src="${root}/img/teamImg/${otherTeamDto.emblem }" alt=".." height="188px"/>
		      	</a>
	      	</c:if>
	      	
	      	<c:if test="${normalMatchInfo.TEAM2==teamName }">
	      		<a href="${root }/team/teamMain.do?teamName=${normalMatchInfo.TEAM1}" target="_new">
		    		<img class="img-circle" src="${root}/img/teamImg/${otherTeamDto.emblem }" alt=".." height="188px"/>
		      	</a>
	      	</c:if>
		  </div>
		  <div class="col-md-1"></div>
		</div>
		
		<!-- 팀 정보 -->
		<div class="modalPageOne">
		<h2>매칭 정보</h2> 
		<div class="row">		  
		  <div class="col-md-6 well">			  
	    		<c:if test="${normalMatchInfo.TEAM1==teamName }">
				<table class="table table-condensed">
				 	<tr></tr>
  					<tr>
  						<td style="width: 100px; font-weight: bold;">팀</td>
  						<td style="background-color: white;">${normalMatchInfo.TEAM1}</td>
  					</tr>
  					<tr>
  						<td style="width: 100px; font-weight: bold;">장소</td>
  						<td style="background-color: white;">${matchingDto.matchingPlace}</td>
  					</tr>
  					<tr>
  						<td style="width: 100px; font-weight: bold;">요일</td>
  						<td style="background-color: white;">${matchingDto.matchingDay}</td>
  					</tr>
  					<tr>
  						<td style="width: 100px; font-weight: bold;">시간</td>
  						<td style="background-color: white;">
  							${matchingDto.matchingTime}
  						</td>
  					</tr>
				</table>
		      	</c:if>
		      	
		      	<c:if test="${normalMatchInfo.TEAM2==teamName }">
				<br/>      					   
					  <table class="table table-hover">
					    <tbody>
					      <tr>
					        <td style="width:20%;"><strong>팀</strong></td>
					        <td>${normalMatchInfo.TEAM2}</td>
					      </tr>
					      <tr>
					        <td style="width:20%;"><strong>장소</strong></td>
					        <td>${matchingDto.matchingPlace}</td>
					      </tr>
					      <tr>
					        <td style="width:20%;"><strong>요일</strong></td>	
					        <td>${matchingDto.matchingDay}</td>
					      </tr>
					      <tr>
					        <td style="width:20%;"><strong>시간</strong></td>
					        <td>${matchingDto.matchingTime}</td>
					      </tr>
					      
					      <tr>
					      	<td></td>
					      	<td></td>
					      </tr>
					    </tbody>
					  </table>
		      	</c:if>
		  </div>
		  <!-- <div class="col-md-2" style="display:table-cell; text-align:center; vertical-align:middle; height:230px; padding-top:70px;"></div> -->		  
		  <div class="col-md-6 well">
	    		<c:if test="${normalMatchInfo.TEAM1==teamName }">
	    		<table class="table table-condensed">
	    		<tr></tr>
  					<tr>
  						<td style="width: 100px; font-weight: bold;">팀</td>
  						<td style="background-color: white;">${normalMatchInfo.TEAM2 }</td>
  					</tr>
  					<tr>
  						<td style="width: 100px; font-weight: bold;">장소</td>
  						<td style="background-color: white;">${otherMatchingDto.matchingPlace}</td>
  					</tr>
  					<tr>
  						<td style="width: 100px; font-weight: bold;">요일</td>
  						<td style="background-color: white;">${otherMatchingDto.matchingDay}</td>
  					</tr>
  					<tr>
  						<td style="width: 100px; font-weight: bold;">시간</td>
  						<td style="background-color: white;">
  							${otherMatchingDto.matchingTime}
  						</td>
  					</tr>
			</table>
		      	</c:if>
		      	
		      	<c:if test="${normalMatchInfo.TEAM2==teamName }">
		      	<br/>
					  <table class="table table-hover">
					    <tbody>
					      <tr>
					        <td style="width:20%;"><strong>팀</strong></td>
					        <td>${normalMatchInfo.TEAM1 }</td>
					      </tr>
					      <tr>
					        <td style="width:20%;"><strong>장소</strong></td>
					        <td>${otherMatchingDto.matchingPlace}</td>
					      </tr>
					      <tr>
					        <td style="width:20%;"><strong>요일</strong></td>	
					        <td>${otherMatchingDto.matchingDay}</td>
					      </tr>
					      <tr>
					        <td style="width:20%;"><strong>시간</strong></td>
					        <td>${otherMatchingDto.matchingTime}</td>
					      </tr>
					      
					      <tr>
					      	<td></td>
					      	<td></td>
					      </tr>
					    </tbody>
					  </table>
		      	</c:if>
		  </div>
		</div>	
	
		<h2>날씨</h2>
		<br/>
			<div class="container"> 
			  <table class="table table-hover" style="width:67%;">
			    <tbody>
			    
			      <tr>
			      	<c:forEach var="weather" items="${weatherAllList}" begin="1" end="7">
			      		<fmt:parseDate var="fmtDate" value="${weather.tmEf }" pattern="yyyy-MM-dd HH:mm"/>
			      		<td><fmt:formatDate value="${fmtDate }" pattern="MM/dd E"/></td>			      		
			      	</c:forEach>
			      </tr>
			      
			      <tr>
			      	<c:forEach var="weather" items="${weatherAllList}" begin="1" end="7">
			      		<td><img src="${root}/img/weatherImg/${weather.wf }" width="50px"/></td>
			      	</c:forEach>
			      </tr>
			      <tr>
			      	<c:forEach var="weather" items="${weatherAllList}" begin="1" end="7">
			      		<td>${weather.tmn } ~ ${weather.tmx }</td>
			      	</c:forEach>			      	
			      </tr>		      
			     <tr>
			     </tr>
			    </tbody>
			  </table>
			</div>
			
		<br/>
		</div>
	<div class="modalPageTwo" style="text-align:center;">
		<input type="hidden" id="gameCode" value="${recordDto.gameCode }">
	<br/>
		<label class="control-label" style="text-align:center; font-weight: bold;">승리 팀</label>
	<div>
		<div style="text-align:center; width:100%; ">
		<br/>
			<div style="width:33%; text-align: center; float:left; display:inline-block;"><input name="result" type="radio" value="${myTeamDto.teamName}" ></div>
		 	<div style="width:33%; text-align: center; float:left; display:inline-block;"><input name="result" type="radio" value="무"></div>
		  	<div style="width:33%; text-align: center; float:left; display:inline-block;"><input name="result" type="radio" value="${otherTeamDto.teamName}"></div>
		</div>
		<br/><br/>
		<div class="btn-group btn-group-justified" style="text-align:center; width:100%; margin-left: 15px;">
		  <div class="btn-group" role="group" style="width:32%; text-align: center; float:left; display:inline-block;">
		    <button type="button" class="btn btn-info" id="team1Button">${myTeamDto.teamName}</button>
		  </div>
		  <div class="btn-group" role="group" style="width:32%; text-align: center; float:left; display:inline-block;">
		    <button type="button" class="btn btn-default" id="drawButton">무승부</button>
		  </div>
		  <div class="btn-group" role="group" style="width:32%; text-align: center; float:left; display:inline-block;">
		    <button type="button" class="btn btn-success" id="team2Button">${otherTeamDto.teamName}</button>
		  </div>
		  <input type="hidden" id="winnerTeam">
		</div>
	  <br/><br/>
	  <div class="control-group">
			<div style="width:49%; display: inline-block; float:left; text-align: center;" >
				<input type="text" name="scoreTeam1" placeholder="Team 1 스코어" size="12">
			</div>
			<div style="width:1%; display: inline-block; float:left; text-align: center;">:</div>
			<div style="width:49%; display: inline-block; float:left; text-align: center;" >
				<input type="text" name="scoreTeam2"  placeholder="Team 2 스코어" size="12">
			</div>
			<input type="hidden" id="score">
			<br/><br/>
			
	  </div>
	   <div>
	  	<input type="button" class="btn btn-info" value="입력" onclick="insertMatchingResult()">
	  	<input type="button" class="btn btn-default" value="취소" onclick="showPageOne()">
	  </div>		
    </div>
	</div>
	</div>
	
	<div class="modal-footer">
		<input class="btn btn-info" type="button" value="경기 결과 입력" onclick="showPageTwo()">
		<input class="btn btn-active" type="button" value="경기장 정보" onclick="viewMatchingPlace('${root }','${myTeamDto.teamCode }','${otherTeamDto.teamCode }')">
		<input class="btn btn-default" type="button" value="상대 팀 및 팀장 정보" onclick="viewOtherTeamInfo('${root}','${otherMatchingDto.teamCode}')">
	</div>

	</c:if>
		
	
	<c:if test="${matchingDto.matchingState=='중' }">
		<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h1>매칭이 진행중입니다.</h1>
		</div>
		
		<div class="modal-body">				
			<div class="row">
			  <div class="col-md-1"></div>
			  
			  <div class="col-md-4" style="display:table-cell; text-align:center; vertical-align:middle;">			  
		    	<a href="#">
		    		<img class="img-circle" src="${root}/img/teamImg/${myTeamDto.emblem }" alt=".." width=188/>
		      	</a>
			  </div>
			  <div class="col-md-2" style="display:table-cell; text-align:center; vertical-align:middle; height:230px; padding-top:70px;"><h2>vs</h2></div>
			  <div class="col-md-4" style="display:table-cell; text-align:center; vertical-align:middle;">
		    	<a href="#">
		      		<img src="${root }/img/teamImg/searching.gif" alt="..." class="img-circle" width=188>
		    	</a>
			  </div>
			  <div class="col-md-1"></div>
			</div>				
			
			<div class="container">
			  <h2>매칭 정보</h2>
			  <br/>
			  <table class="table table-hover" style="width:100%;">
			    <tbody>
			      <tr>
			        <td style="width:20%;">팀</td>
			        <td>${myTeamDto.teamName }</td>
			      </tr>
			      <tr>
			        <td style="width:20%;">장소</td>
			        <td>${matchingDto.matchingPlace}</td>
			      </tr>
			      <tr>
			        <td style="width:20%;">요일</td>	
			        <td>${matchingDto.matchingDay}</td>
			      </tr>
			      <tr>
			        <td style="width:20%;">시간</td>
			        <td>${matchingDto.matchingTime}</td>
			      </tr>
			      
			      <tr>
			      	<td></td>
			      	<td></td>
			      </tr>
			    </tbody>
			  </table>
			</div>
			<br/>
			
			<div style="color:green;"><h5>도움말 : 매칭이 잘 이루어지지 않는다면..</h5></div>
			<h6> -> 거리, 요일, 시간대 등의 조건을 넓히면 매칭이 더욱 쉬워 질 수 있습니다. </h6>		
		</div>
		
		<div class="modal-footer">
			<button type="button" class="btn btn-warning" onclick="javascript:location.href='${root}/teamPage/deleteMatching.do?matchingCode=${matchingDto.matchingCode }&teamName=${teamName}'">
			매칭 취소하기
			</button>
			<%-- <input type="button" value="매칭 취소" onclick="javascript:location.href='${root}/teamPage/deleteMatching.do?matchingCode=${matchingDto.matchingCode }&teamName=${teamName}'"> --%>
		</div>
	</c:if>
</body>
</html>
		
