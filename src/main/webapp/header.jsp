<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!-- test login session -->
<c:set var="teamId" value="${teamId}" scope="session"/>
<c:set var="teamName" value="${teamName }" scope="session"/>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${root }/resources/css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="${root }/resources/css/jquery-ui.css"/>

<script src="${root }/resources/js/jquery.js"></script>
<script src="${root }/resources/js/bootstrap.js"></script>
<%-- <script src="${root }/resources/js/smlStart.js"></script> --%>

<script>
$(function(){	
	//롤러 스크립트
	$.fn.extend({
		Scroll:function(opt,callback){
				if(!opt) var opt={};
				var toint=function (str){
					if(str=='auto'||str.length<=0){
						str=0;
					}else{
						str=parseInt(str);
					}
					return str;
				}
				var _btnUp = $(opt.up);
				var _btnDown = $(opt.down);
				var timerID;
				var _this=this.eq(0).find("ul:first");
				var lineH=_this.find("li:first").width(), 
					line=opt.line?parseInt(opt.line,10):parseInt(this.width()/lineH,10), 
					speed=opt.speed?parseInt(opt.speed,10):500; 
					timer=opt.timer;

				if(line==0) line=1;
				var upHeight=0-line*lineH;
				

				_this.parent().css({overflow:'hidden'});
				var getWidth=function (){
					var _curli=_this.find("li:first");
					upHeight=0-_curli.height()-toint(_curli.css('margin-top'))-toint(_curli.css('margin-bottom'));
					return upHeight;
				}
				var scrollUp=function(){
					_btnUp.unbind("click",scrollUp);
					_this.animate({
							marginTop:getWidth()
					},speed,function(){
							for(i=1;i<=line;i++){
									_this.find("li:first").appendTo(_this);
							}
							_this.css({marginTop:0});
							_btnUp.bind("click",scrollUp);
					});
					return false;
				}
				var scrollDown=function(){
					_btnDown.unbind("click",scrollDown);
					for(i=1;i<=line;i++){
							_this.find("li:last").show().prependTo(_this);
					}
					_this.css({marginTop:getWidth()});
					_this.animate({
							marginTop:0
					},speed,function(){
							_btnDown.bind("click",scrollDown);
					});
					return false;
				}
				var autoPlay = function(){
						if(timer)timerID = window.setInterval(scrollUp,timer);
						return false;
				};
				var autoStop = function(){
						if(timer)window.clearInterval(timerID);
						return false;
				};
				//_this.parent().hover(autoStop,autoPlay).mouseout();
				_btnUp.css("cursor","pointer").click( scrollUp );
				_btnDown.css("cursor","pointer").click( scrollDown );
				if(timer)timerID = window.setInterval(scrollUp,timer);
		}
	})
	
	$("#roll").Scroll({line:1,speed:1500,timer:3000,up:"#topbtnid",down:"#btmbtnid",autoplay:'#bannerplay',autostop:'#bannerstop'});
});


</script>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">        
          <a class="navbar-brand" href="${root}/team/teamMain.do?teamName=${teamName}"><font color="white"><strong>SML Korea</strong></font></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse  navbar-left">
        	<ul class="nav navbar-nav">
        		<li><a href="${root}/soccer/soccerMain.do?legion=legion">축구</a></li>
		        <li><a href="#">야구</a></li>
		        <li><a href="#">풋살</a></li>
		        <li><a href="#">족구</a></li>
		    </ul>
		</div>
        <div id="navbar" class="navbar-collapse collapse  navbar-right">
        	<div class="row">
	          <ul class="nav navbar-nav">
	          	<li>
	          		<!-- 날씨 -->
					<div class="noti" id="roll" style="padding-top:14px; height:35px; overflow:hidden;width:150px;">			
						<ul>
							<c:forEach var="weather" items="${weatherList }">		
								<li>	
									<span><font color="white">서울</font></span>
									<span><font color="white">28 C</font></span>
									<span><img src="${root}/img/weatherImg/01.png" style="vertical-align:middle; width="27px" height="27px"/></span>
								</li>	
							</c:forEach>		
						</ul>
					</div>
	          	</li>
	          
	            <li>
			        <form class="form-inline"  id="searchForm" name="searchForm" style="padding-top:10px;">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="팀명을 검색하세요." name="teamName" id="searchTeamName">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" id="goTeamPage">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>
							</span>
						</div><!-- /input-group -->			
					</form>
		        </li> 
	          	
		        <li>
			        <c:if test="${teamId!=null }">
				        <li class="dropdown">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${teamId }님 <span class="caret"></span></a>
				          <ul class="dropdown-menu" role="menu">
				            <li><a href="${root }/team/teamMain.do?teamName=${teamName}">${teamName }팀</a></li>
				            <li class="divider"></li>
				            <li><a href="${root}/teamPage/logout.do?teamId='${teamId}">로그아웃</a></li>
				          </ul>
				        </li>
				    </c:if>
	          	</li>
		        <li style="padding-top:10px;">			       	
					  <button type="button"  class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					    <span class="glyphicon glyphicon-th-large"></span>
					  </button>
					  <ul class="dropdown-menu" role="menu">					      
				    	  <c:if test="${teamGrade != null }">	    
							<li><a href="${root }/member/myInfoPage.do?teamName=${teamName }">${teamId }님</a></li>
							<li><a data-toggle="modal" data-target="#modalTeamBoard" onclick="getTeamBoardData('${root}','${teamName}')">팀공지사항</a></li>
							<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}&teamCode=${team.teamCode}&teamGrade=${teamGrade}">팀원소개</a></li>
							<li><a href="${root }/teamPage/teamScheduleEdit.do?teamName=${teamName}">팀 스케쥴</a></li>
							<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${team.teamName}">팀 기록</a></li>
			
							<li class="divider"></li>
							<li><a data-toggle="modal" data-target="#modalTeamBoard" onclick="getTeamBoardData('${root}','${teamName}')">팀공지사항</a></li>
							<li><a href="${root }/teamPage/manageTeamMember.do?teamName=${team.teamName}&teamCode=${team.teamCode}&teamGrade=${teamGrade}">팀원관리</a></li>
							<li><a href="${root }/teamPage/teamScheduleEdit.do?teamName=${teamName}">스케쥴관리</a></li>
							<li><a href="${root }/teamPage/matching.do?teamName=${team.teamName}">매칭관리</a></li>
							<li><a href="${root }/teamPage/manageTeamEmblem.do?teamName=${team.teamName}">팀 로고 관리</a></li>
							<li class="divider"></li>
							<li><a href="${root}/teamPage/logout.do?teamId='${teamId}'">로그아웃</a></li>
					  	</c:if>
					  	
					  	<c:if test="${teamGrade == null }">
							<li><a data-toggle="modal" data-target="#modalTeamBoard" onclick="getTeamBoardData('${root}','${teamName}')">팀공지사항</a></li>
							<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}&teamCode=${team.teamCode}">팀원소개</a></li>
							<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${team.teamName}">팀 기록</a></li>
							<li><a href="${root }/teamPage/teamScheduleEdit.do?teamName=${teamName}">팀 스케쥴</a></li>
						</c:if>	
					  </ul>							
		        </li>		         
	          </ul> 
			</div>       
        </div>
      </div>
    </nav> 





	<p>This is a sample text.This is a sample text.This is a sample text.
   		This is a sample text.</p>
   		
   		
</body>
</html>