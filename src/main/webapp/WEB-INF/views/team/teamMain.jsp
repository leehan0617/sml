<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:if test="${team!=null}">
	<c:set var="teamId" value="${teamId}" scope="session"/>
	<c:set var="teamGrade" value="${teamGrade}" scope="session"/>
	<c:set var="teamName" value="${teamName }" scope="session"/>
</c:if>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title><c:out value="${teamName }"/> 페이지</title>
	
	<link rel="stylesheet" type="text/css" href="${root }/resources/css/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="${root }/resources/css/jquery-ui.css"/>
	<link href="${root}/css/teamPage/matchingMap.css" type="text/css" rel="stylesheet"/>	
	<script src="${root }/resources/js/jquery.js"></script>
    <script src="${root }/resources/js/jquery-ui.js"></script>
	<script src="${root }/resources/js/bootstrap.js"></script>
	<script src="${root }/resources/js/teamMain.js"></script>	
		

	<!-- matching.jsp js/css -->
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1442260e0c6af86974001269a7312e42&libraries=services"></script>
	<script src="${root }/js/teamPage/teamPage.js"></script>
	
	<!-- viewMatchingPlace.jsp -->
	<script src="${root }/js/teamPage/teamMatching.js"></script>
	<style>
		.modal.modal-wide .modal-dialog {
		  width: 70%;
		}
		.modal-wide .modal-body {
		 // overflow-y: auto;
		}
		
		/* irrelevant styling */
		/* body { text-align: center; }
		body p { 
		  max-width: 300px; 
		  margin: 20px auto; 
		} */
		#tallModal .modal-body p { margin-bottom: 900px }
		   
	    .ui-autocomplete { 
	    overflow-y: scroll; 
	    overflow-x: hidden;}
     </style>
	
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${root}/start.jsp" style="color:white;">SML KOREA</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="#"data-toggle="modal" data-target="#modalTeamBoard" onclick="getTeamBoardData('${root}','${team.teamName}')" style="color:white;">팀공지사항</a></li>
              <li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}&teamCode=${team.teamCode}&teamGrade=${teamGrade}" style="color:white;">팀원소개</a></li>
              <li><a href="#" onclick="viewSchedule('${root}','${team.teamName}')" style="color:white;">팀스케쥴</a></li>
              <li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${team.teamName}&teamCode=${team.teamCode}&teamGrade=${teamGrade}" style="color:white;">팀기록실</a></li>
              <li><a href="${root }/teamPage/viewLeagueInfo.do?teamName=${team.teamName}" style="color:white;">참가리그</a>
              
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color:white;">팀장관리실 <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                <c:if test="${teamGrade !=null }">					
                  <li><a data-toggle="modal" data-target="#modalTeamBoard" onclick="getTeamBoardData('${root}','${teamName}')">팀공지사항 관리</a></li>
                  <li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}&teamCode=${team.teamCode}&teamGrade=${teamGrade}">팀원 관리</a></li>
                  <li><a href="#" onclick="viewSchedule('${root}','${team.teamName}')">팀스케쥴 관리</a></li>
                  <li><a data-toggle="modal" data-target="#popupMatching" href="${root }/teamPage/matching.do?teamName=${team.teamName}">매칭관리</a></li>
                  <li class="divider"></li>
                  <li class="dropdown-header">Sub Menu</li>
                  <li><a data-toggle="modal" data-target="#popup" href="${root }/teamPage/manageTeamEmblem.do?teamName=${team.teamName}">팀로고 관리</a></li>
                  <li><a data-toggle="modal" data-target="#popupMyInfo" href="${root }/member/myInfoPage.do?teamName=${team.teamName}">개인정보수정</a></li>
                  <li><a href="#">로그아웃</a></li>
                 </c:if>
                <c:if test="${teamGrade == null }">
                	<li class="dropdown-header">로그인을 해주세요</li>
                	<li><a href="${root }/start.jsp">시작페이지로</a></li>
                </c:if>
                </ul>
                
               
                </li>
            </ul>
            
           
            <ul class="nav navbar-nav navbar-right">
            	<li>
	          		<!-- 날씨 -->
					<div class="noti" id="roll" style="padding-top:14px; height:35px; overflow:hidden;width:150px;">			
						<ul>
							<c:forEach var="weather" items="${weatherList }">		
								<li>	
									<span><font color="white">${weather.sido }</font></span>
									<span><font color="white">${weather.temp }</font></span>
									<span><img src="${root}/img/weatherImg/${weather.wfKor}" style="vertical-align:middle; width="27px" height="27px"/></span>
								</li>	
							</c:forEach>		
						</ul>
					</div>
            	</li>
            	<li>
			<form class="form-inline"  id="searchForm" name="searchForm" style="padding-top:10px;">            	
           		<li class="input-group">
	      			<input type="text" class="form-control" placeholder="팀명을 검색하세요." name="teamName" id="searchTeamName">
		    		<span class="input-group-btn">
		      		<button class="btn btn-default" type="button" id="goTeamPage">
		      		  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>이동
		      		</button>
		      		</span>
	    		</li><!-- /input-group -->
           
            </form>
            </li>
             </ul>
             
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>

	 <div class="container">
      <!-- Static navbar -->
      

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron row" style="margin-top:50px;">
      	<div class="col-md-2">
      		  <a href="${root}/team/teamMain.do?teamName=${teamName}">
	   		 <img class="img-circle img-responsive" src="${root}/img/teamImg/${team.emblem}" width="200" height="150"></img>	   
	    	</a><br/>
	    		<c:if test="${matchingDto.matchingState==null }">
	  			&nbsp;&nbsp;&nbsp;&nbsp;<input id="teamState" type="button" class="btn btn-active" value="매칭 전">
	  			</c:if>
			  	<c:if test="${matchingDto.matchingState=='전' }">
			  			&nbsp;&nbsp;&nbsp;&nbsp;<input id="teamState" type="button" class="btn btn-info" value="매칭 대기 중">
			  	</c:if>
			  	<c:if test="${matchingDto.matchingState=='중' }">
			  			&nbsp;&nbsp;&nbsp;&nbsp;<input id="teamState" type="button" class="btn btn-warning" value="매칭 중..">
			  	</c:if>
			  	<c:if test="${matchingDto.matchingState=='후' }">
			  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="teamState" type="button" class="btn btn-success" value="매칭 성사">
			  	</c:if>
			    		
		      	</div>
      	<div class="col-md-6">
      		<h1>${team.teamName}</h1>
      	</div>
      	<div class="col-md-4">
        <p>
        	<c:choose>
  				<c:when test="${team.teamIntro !=null }">
  					<p id="teamIntro">${team.teamIntro }</p>
  				</c:when>
  				<c:otherwise>
  					<p id="teamIntro">작성된 팀소개가 없습니다.</p>
  				</c:otherwise>
  			</c:choose>
        </p>
        <c:if test="${teamGrade !=null }">
  			<p><a class="btn btn-primary btn-lg" role="button" data-toggle="modal" data-target="#modalEditTeamIntro">팀소개 편집하기</a></p>
  			</c:if>
      	</div>
      </div>
      
      <!-- /end 팀소개및 팀엠블럼 div -->
	  	<c:if test="${matchingResult!=null }">
	  <div class="jumbotron row">
	   
		<div class="row well" style="text-align:center;">
		<h3>매칭 결과</h3>
			<div class="col-md-1"></div>
			<div class="col-md-4 well" style="height:150px;">
				<img class="img-circle" src="${root}/img/teamImg/${matchingResult.EMBLEM1}" style="width:30%; height:100%; float: right;">
				<table class="table table-condensed" style="float: right; width:60%; margin-right: 20px; margin-top: 0px;">
				 	<tr></tr>
  					<tr>
  						<td style="width: 30px; font-weight: bold; background-color: silver;">팀</td>
  						<td style="background-color: white;">${matchingResult.TEAMNAME1}</td>
  					</tr>
  					<tr>
  						<td style="width: 50px; font-weight: bold; background-color: silver;">통산 전적</td>
  						<td style="background-color: white;">${team1Map.gameCount } 전<br/> ${team1Map.countWin } 승 ${team1Map.countDraw } 무 ${team1Map.countLose } 패 </td>
  					</tr>
  					<tr>
  						<td style="width: 50px; font-weight: bold; background-color: silver;">승률</td>
  						<td style="background-color: white;"><fmt:formatNumber value="${team1Map.winPer }" pattern="#.#"/>%</td>
  					</tr>
  					<tr>
  						<td></td>
  						<td></td>
  					</tr>
				</table>
			</div>
			<div class="col-md-2" style="text-align:center;">
				<img src="${root}/resources/images/versusIcon.png" style="width:80%; height:80%;">
			</div>
			<div class="col-md-4 well" style="height:150px;">
				<img class="img-circle" src="${root}/img/teamImg/${matchingResult.EMBLEM2}" style="width:30%; height:100%; float:left;">
				<table class="table table-condensed" style="float: left; width:60%; margin-left: 20px; margin-top: 0px;">
				 	<tr></tr>
  					<tr>
  						<td style="width: 30px; font-weight: bold; background-color: silver;">팀</td>
  						<td style="background-color: white;">${matchingResult.TEAMNAME2}</td>
  					</tr>
  					<tr>
  						<td style="width: 50px; font-weight: bold; background-color: silver;">통산 전적</td>
  						<td style="background-color: white;">${team2Map.gameCount } 전<br/> ${team2Map.countWin } 승 ${team2Map.countDraw } 무 ${team2Map.countLose } 패 </td>
  					</tr>
  					<tr>
  						<td style="width: 50px; font-weight: bold; background-color: silver;">승률</td>
  						<td style="background-color: white;"><fmt:formatNumber value="${team2Map.winPer }" pattern="#.#"/>%</td>
  					</tr>
  					<tr>
  						<td></td>
  						<td></td>
  					</tr>
				</table>
			</div>
			<div class="col-md-1"></div>
		</div>
		 
	  </div></c:if> <!--  end 매칭결과되면 생기는 div -->
	  
	  <div class="jumbotron row">
	  	  
		  <div class="col-md-6 well" style="height: 500px;">
		  	<h3 align="center">팀 공지사항</h3><hr/>
		  	<a data-toggle="modal" data-target="#modalTeamBoard" onclick="getTeamBoardData('${root}','${teamName}')" style="color:black;">
		  		<%@include file="../teamTemplate/teamBoardTemplate.jsp" %>
		  	</a>
		  </div>
		  <div class="col-md-6 well" style="height: 500px;">
		  	<h3 align="center">팀 스케쥴</h3>
		  	<%@include file="../teamTemplate/scheduleTemplate.jsp" %> 
		  </div>
		  	
		  </div>
		  <!-- end 팀공지사항이랑 팀스케쥴 div -->
	    <div class="jumbotron row">
	    	
	  <div class="col-md-6 well" style="height: 600px;">
	  	<div class="panel panel-default">
		  <!-- Default panel contents -->
		  <div class="panel-heading"><h3>기록실 <a style="float: right;" class="btn btn-info" href="${root }/teamPage/viewTeamRecord.do?teamName=${team.teamName}">기록실로 이동</a></h3></div>
		  <div class="panel-body">
		    <h6>해당 팀의 최근 기록을 볼 수 있습니다.</h6>
		  </div>
		
		  <!-- List group -->
		  <table class="table" style="text-align:center;">
		    <thead class="active">
		    <tr>
				<td style="width:10%;">일자</td>
				<td style="width:30%;">팀</td>
				<td style="width:10%;">VS</td>
				<td style="width:30%;">팀</td>
				<td style="width:20%;">결과</td>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="record" items="${recordList }" begin="1" end="9">
				<c:if test="${record.TEAMRESULT==null }">
					<tr>
						<td style="width:10%;"><fmt:formatDate value="${record.GAMEDATE }" pattern="MM/dd"/></td>
						<td style="width:30%;">
							<img src="${root}/img/teamImg/${record.EMBLEM1}" style="width:25px; height:25px; float:right;">
							<span style="float:right; padding-right: 10px;"><a href="${root }/team/teamMain.do?teamName=${record.TEAMNAME1 }">${record.TEAMNAME1 }</a></span>
						</td>
						<td style="width:10%; font-weight: bold;">VS</td>
						<td style="width:30%;">
							<img src="${root}/img/teamImg/${record.EMBLEM2}" style="width:25px; height:25px; float: left;">
							<span style="float: left; padding-left: 10px;"><a href="${root }/team/teamMain.do?teamName=${record.TEAMNAME2 }">${record.TEAMNAME2 }</a></span>
						</td>
						<td style="width:20%;">진행 중</td>
					</tr>
				</c:if>
				<c:if test="${record.TEAMRESULT=='승'&&record.TEAMNAME1==teamName}">
					<tr class="success">
						<td style="width:10%;"><fmt:formatDate value="${record.GAMEDATE }" pattern="MM/dd"/></td>
						<td style="width:30%;">
							<img src="${root}/img/teamImg/${record.EMBLEM1}" style="width:25px; height:25px; float:right;">
							<span style="float:right; padding-right: 10px;"><a href="${root }/team/teamMain.do?teamName=${record.TEAMNAME1 }">${record.TEAMNAME1 }</a></span>
						</td>
						<td style="width:10%; font-weight: bold;" >VS</td>
						<td style="width:30%;">
							<img src="${root}/img/teamImg/${record.EMBLEM2}" style="width:25px; height:25px; float: left;">
							<span style="float: left; padding-left: 10px;"><a href="${root }/team/teamMain.do?teamName=${record.TEAMNAME2 }">${record.TEAMNAME2 }</a></span>
						</td>
						<td style="width:20%;">승리</td>
					</tr>
				</c:if>
				<c:if test="${record.TEAMRESULT=='패'&&record.TEAMNAME1!=teamName}">
					<tr class="success">
						<td style="width:10%;"><fmt:formatDate value="${record.GAMEDATE }" pattern="MM/dd"/></td>
						<td style="width:30%;">
							<img src="${root}/img/teamImg/${record.EMBLEM1}" style="width:25px; height:25px; float:right;">
							<span style="float:right; padding-right: 10px;"><a href="${root }/team/teamMain.do?teamName=${record.TEAMNAME1 }">${record.TEAMNAME1 }</a></span>
						</td>
						<td style="width:10%; font-weight: bold;" >VS</td>
						<td style="width:30%;">
							<img src="${root}/img/teamImg/${record.EMBLEM2}" style="width:25px; height:25px; float: left;">
							<span style="float: left; padding-left: 10px;"><a href="${root }/team/teamMain.do?teamName=${record.TEAMNAME2 }">${record.TEAMNAME2 }</a></span>
						</td>
						<td style="width:20%;">승리</td>
					</tr>
				</c:if>
				<c:if test="${record.TEAMRESULT=='승'&&record.TEAMNAME1!=teamName }">
					<tr class="warning">
						<td style="width:10%;"><fmt:formatDate value="${record.GAMEDATE }" pattern="MM/dd"/></td>
						<td style="width:30%;">
							<img src="${root}/img/teamImg/${record.EMBLEM1}" style="width:25px; height:25px; float:right;">
							<span style="float:right; padding-right: 10px;"><a href="${root }/team/teamMain.do?teamName=${record.TEAMNAME1 }">${record.TEAMNAME1 }</a></span>
						</td>
						<td style="width:10%; font-weight: bold;">VS</td>
						<td style="width:30%;">
							<img src="${root}/img/teamImg/${record.EMBLEM2}" style="width:25px; height:25px; float: left;">
							<span style="float: left; padding-left: 10px;"><a href="${root }/team/teamMain.do?teamName=${record.TEAMNAME2 }">${record.TEAMNAME2 }</a></span>
						</td>
						<td style="width:20%;">패배</td>
					</tr>
				</c:if>
				<c:if test="${record.TEAMRESULT=='패'&&record.TEAMNAME1==teamName }">
					<tr class="warning">
						<td style="width:10%;"><fmt:formatDate value="${record.GAMEDATE }" pattern="MM/dd"/></td>
						<td style="width:30%;">
							<img src="${root}/img/teamImg/${record.EMBLEM1}" style="width:25px; height:25px; float:right;">
							<span style="float:right; padding-right: 10px;"><a href="${root }/team/teamMain.do?teamName=${record.TEAMNAME1 }">${record.TEAMNAME1 }</a></span>
						</td>
						<td style="width:10%; font-weight: bold;">VS</td>
						<td style="width:30%;">
							<img src="${root}/img/teamImg/${record.EMBLEM2}" style="width:25px; height:25px; float: left;">
							<span style="float: left; padding-left: 10px;"><a href="${root }/team/teamMain.do?teamName=${record.TEAMNAME2 }">${record.TEAMNAME2 }</a></span>
						</td>
						<td style="width:20%;">패배</td>
					</tr>
				</c:if>
				<c:if test="${record.TEAMRESULT=='무'}">
					<tr class="active">
						<td style="width:10%;"><fmt:formatDate value="${record.GAMEDATE }" pattern="MM/dd"/></td>
						<td style="width:30%;">
							<img src="${root}/img/teamImg/${record.EMBLEM1}" style="width:25px; height:25px; float:right;">
							<span style="float:right; padding-right: 10px;"><a href="${root }/team/teamMain.do?teamName=${record.TEAMNAME1 }">${record.TEAMNAME1 }</a></span>
						</td>
						<td style="width:10%; font-weight: bold;">VS</td>
						<td style="width:30%;">
							<img src="${root}/img/teamImg/${record.EMBLEM2}" style="width:25px; height:25px; float: left;">
							<span style="float: left; padding-left: 10px;"><a href="${root }/team/teamMain.do?teamName=${record.TEAMNAME2 }">${record.TEAMNAME2 }</a></span>
						</td>
						<td style="width:20%;">무</td>
					</tr>
				</c:if>
			</c:forEach>
			</tbody>
		   </table>
		</div>
	  </div>
	  <div class="col-md-6 well" style="height: 600px;">
	  	<div class="panel panel-default">
		  <!-- Default panel contents -->
		  <div class="panel-heading"><h3>진행중인 리그 <input style="float: right;" type="button" class="btn btn-info" value="리그 정보로 이동" onclick="javascript:location.href='${root }/teamPage/viewLeagueInfo.do?teamName=${team.teamName}'"></h3></div>
		  <div class="panel-body">
		    <h6>진행중인 리그의 정보를 간단하게 볼 수 있습니다.</h6>
		   <c:if test="${leagueDto==null }">
	  		<label>참가중 리그 없음</label>
	  	</c:if>
	  	<br/>
	  	
	  	<c:if test="${leagueDto!=null }">
	  		<label>진행중인 리그</label>
	  		<br/>
	  		<br/>
	  		<div class="row">
	  		<img style="width:30%; height:30%; float:left; margin-left:5%;" src="${root }/img/leagueImg/${leagueDto.leagueImage} "/>
	  		<div style="float:left; width:50%; margin-left:10%; float:left; height: 50%;">
	  			<table class="table table-hover">
			    <tbody>
			      <tr>
			        <td style="width:20%;"><strong>리그 명</strong></td>
			        <td>${leagueDto.leagueName }</td>
			      </tr>
			      <tr>
			        <td style="width:30%;"><strong>기간</strong></td>
			        <td>${leagueDto.leagueStartDate } ~ ${leagueDto.leagueEndDate }</td>
			      </tr>
			      <tr>
			        <td style="width:20%;"><strong>지역</strong></td>	
			        <td>${leagueDto.leagueRegion }</td>
			      </tr>
			      <tr>
			      	<td></td>
			      	<td></td>
			      </tr>
			    </tbody>
			  </table>
	  		</div>
	  		</div>
	  	
	  	<label>해당 팀 순위</label>
	  	<br/><br/>
	  	<div class="row">
		    <img src="${root }/img/teamImg/${team.emblem}" alt="팀 엠블럼" style="width:30%; height:50%; margin-left:5%; float:left;">
		    <div style="float:left; width:50%; margin-left:10%; float:left; height: 50%;" >
		    	<table class="table table-hover">
			    <tbody>
			      <tr>
			        <td style="width:20%;"><strong>팀</strong></td>
			        <td>${teamName }</td>
			      </tr>
			      <tr>
			        <td style="width:30%;"><strong>전적</strong></td>
			        <td>${gameCount }전   <span style="color: green;">${countWin }</span>승   ${countDraw }무   <span style="color: red;">${countLose }</span>패 </td>
			      </tr>
			      <tr>
			        <td style="width:20%;"><strong>순위</strong></td>	
			        <td>현재 ${leagueRank+1} 위</td>
			      </tr>
			      <tr>
			      	<td></td>
			      	<td></td>
			      </tr>
			    </tbody>
			  </table>
		    </div>
		   </div>
		   </c:if>
		  </div>
		</div>	  	
	  </div>
	
	    </div><!-- end 기록실,진행중ㅇ인리그  -->
	    
   	    <div class="jumbotron row">
   	    	<input type="hidden" id="replyTeamCode" value="${team.teamCode }"/>
		<div class="col-md-12 replyWrap">
			<div class="row">
  				<div class="col-md-3">
   					 <div class="input-group">
     					 <span class="input-group-btn">
        					<button class="btn btn-default" type="button" disabled="disabled">닉네임</button>
      					</span>
      					<input type="text" class="form-control" placeholder="닉네임을 적어주세요." id="replyNickName">
    				 </div><!-- /input-group -->
  				</div>
  				<div class="col-md-3">
  					 <div class="input-group">
     					 <span class="input-group-btn">
        					<button class="btn btn-default" type="button" disabled="disabled">비밀번호</button>
      					</span>
      					<input type="password" class="form-control" placeholder="비밀번호를 적어주세요." id="replyPassword">
    				 </div><!-- /input-group -->
  				</div>
 				 <div class="col-md-6">
   					 <div class="input-group">
    					  <input type="text" class="form-control" placeholder="내용을 적어주세요." id="replyContent">
					      <span class="input-group-btn">
					        <button class="btn btn-default" type="button" onclick="writeReply('${root}','${teamName }')">한마디 남기기</button>
					      </span>
    				</div>
 				 </div>
			</div><!-- /.row -->
			<hr/>
			
			<div class="row replyList replyFirst">	
  				<c:forEach var="teamLog" items="${replyList}" begin="0" varStatus="status" end="4">
					<div class="col-md-3 ${teamLog.replyCode }">
						 <div class="input-group">
							 <span class="input-group-btn">
								<button class="btn btn-default" type="button" disabled="disabled">닉네임</button>
							</span>
							<input type="text" class="form-control" value="${teamLog.replyNickName }" id="replyNickName" disabled="disabled">
						 </div><!-- /input-group -->
					</div>
					<div class="col-md-3 ${teamLog.replyCode }">
						 <div class="input-group">
									 <span class="input-group-btn">
					  					<button class="btn btn-default" type="button" disabled="disabled">작성일</button>
										</span>
										<input type="text" class="form-control" value="<fmt:formatDate value="${teamLog.replyDate }" pattern="yy-MM-dd"/>" id="replyDate" disabled="disabled">
							 </div><!-- /input-group -->
					</div>
					<div class="col-md-6 ${teamLog.replyCode }">
						<div class="input-group">
							 <input type="text" class="form-control" value="${teamLog.replyContent }" id="replyContent" disabled="disabled">
					     <span class="input-group-btn">
					       	<button class="btn btn-danger" type="button" onclick="deleteReply('${root}','${team.teamCode }' , '${teamLog.replyCode}')">삭제</button>
					     </span>
						</div>
					</div>
				</c:forEach>

			</div><!-- /.row -->
			
			
			<div class="alert alert-warning" role="alert" onclick="moreReadReply('${root}','${team.teamCode }' , '${replyPageNumber }')"><p class="text-center">더보기</p></div>
		</div>
   	    	
		</div>    <!-- end 댓글 div -->
	  
    </div> <!-- /container -->
	<!--  -->

		
	
	
	<c:if test="${team==null}">
	<div style="text-align:center;">
		<h1>SML KOREA</h1>
		<br/>
		<h6>해당 팀이 존재하지 않습니다.</h6>
	</div>
		
	</c:if>
	

	<div class="modal fade" id="modalTeamBoard" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
 	 <div class="modal-dialog">
    	<div class="modal-content">
    		<div class="modal-header">
    			공지사항
    		</div>
    		<div class="modal-body">
    			<table class="table table-striped">
					<thead>
						<tr> 
							<th style="width:15%">글번호</th><th style="width:45%">제목</th><th style="width:15%">작성자</th><th style="width:25%">작성일</th> 
						</tr> 
					</thead>
					<tbody class="teamBoardTbody">	
					</tbody>
				</table>
				<nav>
  					<ul class="pager">
  					</ul>
  				</nav>
    		</div>
      		<div class="modal-footer">
            	<button type="button" class="btn btn-default modalTeamBoardClose" data-dismiss="modal" onclick="emptyContent()">Close</button>
            	<c:if test="${teamGrade !=null }">
       			<button type="button" data-toggle='modal' data-target='#modalTeamBoardWrite' class="btn btn-primary" onclick="teamBoardToggle()">글쓰기</button>
       			</c:if>
      		</div>
  		</div>
     </div>
   </div>
   
   <div class="modal fade" id="modalTeamBoardRead" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">공지사항.</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label" id="boardTitle">Title</label>
            <input type="text" class="form-control" id="recipient-name" value="" disabled="disabled"/>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label" id="boardContent">Content</label>
            <textarea class="form-control" id="message-text" disabled="disabled"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="teamBoardToggle()">Close</button>
        <button type="button" class="btn btn-primary">수정하기</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="modalTeamBoardWrite" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">공지사항 >> 글쓰기</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label" id="boardTitle">Title</label>
            <input type="text" class="form-control" id="teamBoardTitle"/>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label" id="boardContent">Content</label>
            <textarea class="form-control" id="teamBoardContent"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="teamBoardToggle()">Close</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal"onclick="modalWriteTeamBoard('${root}','${teamName}','${team.teamCode }')">글쓰기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="modalEditTeamIntro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
  	<div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">팀소개 편집하기.</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="message-text" class="control-label" id="boardContent">팀소개를 적어주세요.</label>
            <textarea class="form-control" id="teamIntroContent"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="editTeamIntro('${root}','${teamName}','${team.teamCode }')">편집완료</button>
      </div>
    </div>
    </div>
    </div>
    
<div class="modal modal-wide fade" id="popupMatching">
	<div class="modal-dialog">
    	<div class="modal-content">
    	</div>
    </div>
</div>

<div class="modal fade" id="popup">
	<div class="modal-dialog">
    	<div class="modal-content">
    	</div>
    </div>
</div>

<div class="modal fade" id="popupMyInfo">
	<div class="modal-dialog">
    	<div class="modal-content">
    	</div>
    </div>
</div>

<div id="stack2" class="modal fade" tabindex="-1" data-focus-on="input:first" style="display: none;">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 class="modal-title">Stack Two</h4>
  </div>
  <div class="modal-body">
    <p>One fine body…</p>
    <p>One fine body…</p>
    <input class="form-control" type="text" data-tabindex="1">
    <input class="form-control" type="text" data-tabindex="2">
    <button class="btn btn-default" data-toggle="modal" href="#stack3">Launch modal</button>
  </div>
  <div class="modal-footer">
    <button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
    <button type="button" class="btn btn-primary">Ok</button>
  </div>
</div>

<div id="listDiv" class="modal-content">
</div>



<script>
$(document).ready(function() {
	var urlAddr="/home/autocomplete";
	$("#searchTeamName").autocomplete({
		source : function(request, response) {
			$.ajax({
				url : urlAddr,
				type : "post",
				dataType : "json",
				data: { term : request.term, param1 : "param1 Value", param2 : "param2 Value"},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
				data : request,
				success : function(data) {
					var result = data;
					response(result);
				},
				error : function(data) {
					alert("에러가 발생하였습니다.");
				}
			});
		}
	});
	
	$("#goTeamPage").click(function(){
		var text = $("input[id='searchTeamName']").val();
		
		var url = "/home/team/teamMain.do?teamName="+text;
		window.open(url);
	});
});
	function editTeamIntro(root , teamName , teamCode){
		//var teamIntro = $("#teamIntroContent").val();
		var teamIntro = $("#teamIntroContent").val().replace(/\n/g, '<br>');

		var addr = root+"/editTeamIntro?teamName="+teamName+"&teamCode="+teamCode+"&teamIntro="+teamIntro;
		
		$.ajax({
			type:"get",
			url:addr,
			success:function(data){
				//console.log(data);
				//console.log(data.teamIntro.replace(/<br>/gi,"\r\n"));
				//$("#teamIntro").text(data.teamIntro.replace(/<br>/gi,"\r\n"));
				$("#teamIntro").html(data.teamIntro);
				$("#teamIntroContent").val("");
			}
		});
	}
</script>

</body>
</html>


