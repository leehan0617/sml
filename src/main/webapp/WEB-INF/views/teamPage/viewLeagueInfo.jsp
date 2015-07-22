<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    
    <meta name="description" content="">
    <meta name="author" content="">   
    <link rel="icon" href="${root }/resources/images/android@2x.png"/>
    
    <title>leagueInfo</title>
    
    
   <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="${root }/resources/css/bootstrap.css"/>

    <!-- Custom styles for this template -->     
  
  	<script src="${root }/resources/js/jquery.js"></script> 	
 	<script src="${root }/resources/js/bootstrap.js"></script>
  	<script src="${root }/resources/js/jquery-ui.js"></script>  	
    
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  </head>
  <body>
      <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">        
          <a class="navbar-brand" href="${root}/team/teamMain.do?teamName=${teamName}">SML Korea</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
          	<c:choose>
          	<c:when test="${teamGrade == null }">
          		
            	<li><a href="${root }/teamPage/login.do">로그인</a></li>
            	
            </c:when>
            <c:otherwise>
	        	<li><a href="${root }/teamPage/logout.do">로그아웃</a></li>
	        </c:otherwise>
	        </c:choose>
	        <c:if test="${teamGrade != null }">
			  <li><a href="${root }/team/teamMain.do?teamName=${teamName}">메인</a></li>
			  <li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${teamName}">팀 공지사항</a></li>		      
		      <li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${teamName}">팀 기록</a></li>
		      <li><a href="${root }/teamPage/teamScheduleEdit.do?teamName=${teamName}">팀 스케쥴</a></li>
			</c:if>            
          </ul>         
        </div>
      </div>
    </nav>
	
	 <br/><br/><br/><br/>
	 
     <div class="container-fluid" style="background:url(${root}/resources/images/leagueInfoBackGround.jpg); border:">
       <div align="center">
       <span class=""><a href="${root}/team/teamMain.do?teamName=${teamName}"><img class="img-circle img-responsive" alt="logo" src="${root}/img/teamImg/${emblem}" width="150" height="150"></img></a></span>
       </div>
       <div align="center" style="padding-top:10px;">
       <span class="label label-danger" style="font-size:20pt;">${teamName}</span>
       </div>       
       <br/>
       <br/>
              
     </div>
     <hr style="border: solid 1px ;">
       <br/><br/>
	
	<c:if test="${league==null}">	
	<div class="container" style="width:1000px">    	
      <div class="row">      	   	
          <h2 class="sub-header">LEAGUE INFO</h2>          
          <div class="table-responsive">
            <table class="table table-striped">
				<tr>
			   		<td align="center">참가 중인 리그가 없습니다.</td>
				</tr>	
	  		</table>            
          </div>      
      	</div>        
      </div>
     
	</c:if>
			
	<c:if test="${league!=null}">
	<div class="container" style="width:1000px">    	
      <div class="row">      	   	
          <h2 class="sub-header">LEAGUE INFO</h2>          
          <div class="row well">
			  <div class="col-md-1">
			  </div>
			  <div class="col-md-3">
			  	<img src="${root }/img/leagueImg/${league.leagueImage}" alt="로고이미지" class="img-rounded img-responsive">
			  </div>
			  <div class="col-md-2">
			  </div>
			  <div class="col-md-5">
			  <br/>
				 <table class="table table-condensed">
				 	<tr></tr>
  					<tr>
  						<td class="info" style="width: 100px; font-weight: bold;">리그 이름</td>
  						<td style="background-color: white;">${league.leagueName }</td>
  					</tr>
  					<tr>
  						<td class="info" style="width: 100px; font-weight: bold;">리그 지역</td>
  						<td style="background-color: white;">${league.leagueRegion }</td>
  					</tr>
  					<tr>
  						<td class="info" style="width: 100px; font-weight: bold;">리그 기간</td>
  						<td style="background-color: white;">${league.leagueStartDate } ~ ${league.leagueEndDate }</td>
  					</tr>
  					<tr>
  						<td class="info" style="width: 100px; font-weight: bold;">리그 경기장</td>
  						<td style="background-color: white;">
  							<c:forTokens var="place" items="${league.leaguePlace }" delims=",">
  								${place}<br/>
  							</c:forTokens>
  						</td>
  					</tr>
  					<tr>
  						<td class="info" style="width: 100px; font-weight: bold;">리그 요일 </td>
  						<td style="background-color: white;">${league.leagueDay }</td>
  					</tr>
				</table>
			  
			</div>
			<div style="text-align: right; margin-right: 120px;">
			<c:if test="${league.leagueState==0 }">
				<input id="teamState" type="button" class="btn btn-warning" value="리그 진행 중">
			</c:if>
			
			<c:if test="${league.leagueState!=0 }">
				<input id="teamState" type="button" class="btn btn-info" value="참가 대기 중 ">
			</c:if>
			</div>     
      	</div>        
      </div>
      </div> 
      	
    <div class="container" style="width:1000px">    	
      <div class="row">
          <h2 class="sub-header">LEAGUE TEAM LIST</h2>          
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>순위</th>
                  <th>팀</th>
                  <th>경기</th>
                  <th>승</th>
                  <th>무</th>
                  <th>패</th>
                  <th>승점</th>
                </tr>               
              </thead>
           <tbody>
           <c:if test="${league.leagueState!=0}">
           	<c:forEach var="team" items="${joinTeamList}">
			  <tr>
				<td></td>
				<td><img style="width:25px; height:20px;" src="${root }/img/teamImg/${team.emblem}"></img>&nbsp; ${team.teamName }</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			  </tr>
			</c:forEach>
           </c:if>
            <c:if test="${league.leagueState==0}">
            <c:forEach var="team" items="${leagueRecordList}">
			  <tr>
				<td>${team.teamRank }</td>
				<td><img style="width:25px; height:20px;" src="${root }/img/teamImg/${team.emblem}"></img>&nbsp; ${team.teamName }</td>
				<td>${team.countGame}</td>
				<td>${team.countWin}</td>
				<td>${team.countDraw}</td>
				<td>${team.countLose}</td>
				<td>${team.gameScore}</td>
			  </tr>
			</c:forEach>
			</c:if>
            </tbody>
            </table>               
          </div>      
      	</div>        
      </div> 
    </c:if>	
		
  </body>
</html>