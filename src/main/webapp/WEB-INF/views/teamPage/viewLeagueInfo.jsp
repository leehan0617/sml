<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set value="${fn:replace(team.teamName, ' ', '%20')}" var="teamNameNoSpace" />
<c:set var="root" value="${pageContext.request.contextPath }"/> 
<c:if test="${team!=null}">
	<c:set var="teamId" value="${teamId}" scope="session"/>
	<c:set var="teamGrade" value="${teamGrade}" scope="session"/>
	<c:set var="teamName" value="${teamName }" scope="session"/>
</c:if>
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
    <link href="${root}/css/teamPage/matchingMap.css" type="text/css" rel="stylesheet"/>
  	<script src="${root }/resources/js/jquery.js"></script> 	
 	<script src="${root }/resources/js/bootstrap.js"></script>
  	<script src="${root }/resources/js/jquery-ui.js"></script>  	
    <script src="${root }/resources/js/teamMain.js"></script>	
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    
     <!-- matching.jsp js/css -->
    <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1442260e0c6af86974001269a7312e42&libraries=services"></script>
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
      <script>
	 	$(function(){
			$("#goTeamPage").click(function(){
				var text = $("input[id='searchTeamName']").val();
				
				var url = "/home/team/teamMain.do?teamName="+text;
				window.open(url);
			});
	 	});
	</script>
  </head>
  <body>
      <nav class="navbar navbar-inverse ">
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
              <li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}&teamGrade=${teamGrade}" style="color:white;">팀원소개</a></li>
              <li><a href="#" onclick="viewSchedule('${root}','${team.teamName}')" style="color:white;">팀스케쥴</a></li>
              <li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${team.teamName}&teamGrade=${teamGrade}" style="color:white;">팀기록실</a></li>
              <li><a href="${root }/teamPage/viewLeagueInfo.do?teamName=${team.teamName}" style="color:white;">참가리그</a>
              
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color:white;">팀장관리실 <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                <c:if test="${teamGrade !=null }">					
                  <li><a data-toggle="modal" data-target="#modalTeamBoard" onclick="getTeamBoardData('${root}','${teamName}')">팀공지사항 관리</a></li>
                  <li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}&teamCode=${team.teamCode}&teamGrade=${teamGrade}">팀원 관리</a></li>
                  <li><a href="#" onclick="viewSchedule('${root}','${team.teamName}')">팀스케쥴 관리</a></li>
                  <li><a data-toggle="modal" data-target="#popupMatching" href="${root }/teamPage/matching.do?teamName=${teamNameNoSpace}">매칭관리</a></li>
                  <li class="divider"></li>
                  <li class="dropdown-header">Sub Menu</li>
                  <li><a data-toggle="modal" data-target="#popup" href="${root }/teamPage/manageTeamEmblem.do?teamName=${teamNameNoSpace}">팀로고 관리</a></li>
                  <li><a data-toggle="modal" data-target="#popupMyInfo" href="${root }/member/myInfoPage.do?teamName=${teamNameNoSpace }">개인정보수정</a></li>
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
  						<td style="background-color: #B2EBF4;" style="width: 100px; font-weight: bold;">리그 이름</td>
  						<td style="background-color: white;">${league.leagueName }</td>
  					</tr>
  					<tr>
  						<td style="background-color: #B2EBF4;" style="width: 100px; font-weight: bold;">리그 지역</td>
  						<td style="background-color: white;">${league.leagueRegion }</td>
  					</tr>
  					<tr>
  						<td style="background-color: #B2EBF4;" style="width: 100px; font-weight: bold;">리그 기간</td>
  						<td style="background-color: white;">${league.leagueStartDate } ~ ${league.leagueEndDate }</td>
  					</tr>
  					<tr>
  						<td style="background-color: #B2EBF4;" style="width: 100px; font-weight: bold;">리그 경기장</td>
  						<td style="background-color: white;">
  							<c:forTokens var="place" items="${league.leaguePlace }" delims=",">
  								${place}<br/>
  							</c:forTokens>
  						</td>
  					</tr>
  					<tr>
  						<td style="background-color: #B2EBF4;" style="width: 100px; font-weight: bold;">리그 요일 </td>
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