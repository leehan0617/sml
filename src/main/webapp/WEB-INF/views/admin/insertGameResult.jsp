<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="modal-body">
	<div style="text-align:center; width:40%; height:40%; float: left;">
	 <div class="thumbnail">
      <img src="${root }/img/teamImg/${recordMap.EMBLEM1}" alt="">
      <div class="caption">
        <h3>${recordMap.TEAM1}</h3>    
        <input type="hidden" id="team1" value="${recordMap.TEAMCODE }">    
      </div>
      <input type="hidden" id="gameCode" value="${recordMap.GAMECODE }">
    </div>
    </div>
  
    <div style="text-align:center; width:19%; height:40%; float: left; margin-top: 150px;">
	   <span style="font-weight: bold; color: red; font-size: 20px;">VS</span>
    </div>
    
    <div style="text-align:center; width:40%; height:40%; float: left;">
	 <div class="thumbnail">
      <img src="${root }/img/teamImg/${recordMap.EMBLEM2}" alt="">
      <div class="caption">
        <h3>${recordMap.TEAM2}</h3>
        <input type="hidden" id="team2" value="${recordMap.TEAMCODE2 }"> 
      </div>
    </div>
   
    
    <!--  
	<img src="${root }/img/teamImg/${recordMap.EMBLEM1}" style="width:40%; height:40%;">
	
	<img src="${root }/img/teamImg/${recordMap.EMBLEM2}" style="width:40%; height:40%;">
	-->
</div>
<br/><br/>
 <label class="control-label" style="text-align:center; font-weight: bold;">승리 팀</label>
	<div>
		<div style="text-align:center; width:100%;">
			<div style="width:33%; text-align: center; float:left; display:inline-block;"><input name="result" type="radio" value="${recordMap.TEAM1}" ></div>
		 	<div style="width:33%; text-align: center; float:left; display:inline-block;"><input name="result" type="radio" value="무"></div>
		  	<div style="width:33%; text-align: center; float:left; display:inline-block;"><input name="result" type="radio" value="${recordMap.TEAM2}"></div>
		</div>
		<br/><br/>
		<div class="btn-group btn-group-justified" style="text-align:center; width:100%;">
		  <div class="btn-group" role="group" style="width:32%; text-align: center; float:left; display:inline-block;">
		    <button type="button" class="btn btn-info" id="team1Button">${recordMap.TEAM1}</button>
		  </div>
		  <div class="btn-group" role="group" style="width:32%; text-align: center; float:left; display:inline-block;">
		    <button type="button" class="btn btn-default" id="drawButton">무승부</button>
		  </div>
		  <div class="btn-group" role="group" style="width:32%; text-align: center; float:left; display:inline-block;">
		    <button type="button" class="btn btn-success" id="team2Button">${recordMap.TEAM2}</button>
		  </div>
		  <input type="hidden" id="winnerTeam">
		</div>
	  <br/><br/>
	  <div class="control-group">
			<div style="width:49%; display: inline-block; float:left; text-align: center;" >
				<input type="text" name="scoreTeam1" placeholder="Team 1 스코어" size="5">
			</div>
			<div style="width:1%; display: inline-block; float:left; text-align: center;">:</div>
			<div style="width:49%; display: inline-block; float:left; text-align: center;" >
				<input type="text" name="scoreTeam2"  placeholder="Team 2 스코어" size="5">
			</div>
			<input type="hidden" id="score">
	  </div>
	 		
    </div>
</div>
</body>
</html>