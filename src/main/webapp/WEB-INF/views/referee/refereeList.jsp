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
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>SML Soccer Page</title>

    <!-- Bootstrap core CSS -->
    <link href="${root}/resources/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="${root}/resources/css/jquery.jqplot.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${root }/resources/css/jquery-ui.css"/>	
    <script src="${root }/resources/js/jquery.js"></script>
    <script src="${root }/resources/js/jquery-ui.js"></script>
	<script src="${root }/resources/js/bootstrap.js"></script>
	<script src="${root }/resources/js/soccerPage.js"></script>
	<script src="${root }/resources/js/jquery.jqplot.js"></script>
	<script src="${root }/resources/js/smlStart.js"></script>	
	<script type="text/javascript" src="${root }/js/referee/referee.js"></script>
	<script src="${root }/resources/js/jqplot.categoryAxisRenderer.js"></script>
	<script src="${root }/resources/js/jqplot.barRenderer.js"></script>
	<script src="${root }/resources/js/jqplot.pieRenderer.js"></script>
	<script src="${root }/js/scrollnews.js"></script>
    <!-- Custom styles for this template -->
    <link href="${root}/resources/css/soccerPage.css" rel="stylesheet" type="text/css">
    <style>
    .ui-autocomplete { 
    overflow-y: scroll; 
    overflow-x: hidden;}
    </style>
  </head>
  <body>
      <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-fixed-top">
          <div class="container-fluid">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="${root }/start.jsp">SML KOREA</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">              	
              	<c:if test="${sportCode==0}">
              	<li><a href="${root}/soccer/soccerCommonBoardPage.do?sportCode=${sportCode}">공지사항</a></li>
              	<li><a href="${root}/soccer/soccerRule.do?sportCode=${sportCode}">경기규칙</a></li>
                <li><a href="${root}/soccer/soccerTeamList.do?sportCode=${sportCode}">팀리스트</a></li>                
              	</c:if>
              	<c:if test="${sportCode==1}">
              	<li><a href="${root}/baseBall/baseBallCommonBoardPage.do?sportCode=${sportCode}">공지사항</a></li>
              	<li><a href="${root}/baseBall/baseBallRule.do?sportCode=${sportCode}">경기규칙</a></li>
                <li><a href="${root}/baseBall/baseBallTeamList.do?sportCode=${sportCode}">팀리스트</a></li> 
              	</c:if>
              	<c:if test="${sportCode==2}">
              	<li><a href="${root}/basketBall/basketBallCommonBoardPage.do?sportCode=${sportCode}">공지사항</a></li>
              	<li><a href="${root}/basketBall/basketBallRule.do?sportCode=${sportCode}">경기규칙</a></li>
              	<li><a href="${root}/basketBall/basketBallTeamList.do?sportCode=${sportCode}">팀리스트</a></li>
                
              	</c:if>
              	<c:if test="${sportCode==3}">
              	<li><a href="${root}/legBall/legBallCommonBoardPage.do?sportCode=${sportCode}">공지사항</a></li>
              	<li><a href="${root}/legBall/legBallRule.do?sportCode=${sportCode}">경기규칙</a></li>
                <li><a href="${root}/legBall/legBallTeamList.do?sportCode=${sportCode}">팀리스트</a></li>
              	</c:if>               
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">다른종목가기<span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                  	<li class="divider"></li>
                    <li><a href="${root }/sc">축구</a></li>
                    <li class="divider"></li>
                    <li><a href="${root}/baseBall/baseBallMain.do">야구</a></li>
                    <li class="divider"></li>
                    <li><a href="${root}/basketBall/basketBallMain.do">족구</a></li>
                    <li class="divider"></li>
                    <li><a href="${root }/sportLegBall/legBallMain.do">족구</a></li>
                    <li class="divider"></li>
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
		  			<div class="input-group">
		      			<input type="text" class="form-control" placeholder="팀명을 검색하세요." name="teamName" id="searchTeamName">
			    		<span class="input-group-btn">
			      		<button class="btn btn-default" type="button" id="goTeamPage">
			      		  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>이동
			      		</button>
			      		</span>
		    		</div><!-- /input-group -->
	  			  </form>
                </li>
              </ul>
            </div>
          </div>
        </nav>

      </div>
    </div>
	
	 <br/><br/><br/><br/>
     <div class="container-fluid" style="background:url(${root}/resources/images/refereeBackgroundImage.jpg);">
       <div align="center">
       <span class=""><a href="${root}/team/teamMain.do?teamName=${teamName}"><img class="img-circle img-responsive" alt="logo" src="${root}/img/teamImg/defaultEmblem.jpg" width="150" height="150"></img></a></span>
       </div>
       <div align="center" style="padding-top:10px;">
       <span class="label label-danger" style="font-size:20pt;">SML KOREA</span>
       </div>
       <br/>           
       <br/>           
     </div>
     <br/>
      <hr style="border: solid 1px ;">    
     
       
	
    <div class="container" style="background-color: ">    	
      <div class="row">      	   	
          <h2 class="sub-header">심판 LIST</h2>
          <br/>         
          <div class="table-responsive" style="background-color: ">
            <table class="table table-striped">
              <c:if test="${refereeList!=null}">	
              <thead>               
               <tr align="center" style="background-color:#E2D6D6;">
               	  <td>
               	    <div>
						<label>지역:</label>
						<select id="sido2" onchange="refereeRegion('${root}', '${sportCode}', this.value)">
						<option>선택</option>				
						<c:forEach var="sido" items="${sidoList}">												
						<option value="${sido}">${sido}</option>				
						</c:forEach>
						</select>
				    </div>
				  </td>                 
                  <td ><span class="glyphicon glyphicon-user">이름</span></td>
                  <td><span class="glyphicon glyphicon-calendar">생년월일</span></td>
                  <td><span class="glyphicon glyphicon-home">지역</span></td>                               
               </tr>               
              </thead>
              </c:if>              
              <tbody>              
           <c:if test="${refereeList==null}">	
			  <tr>
			   <td align="center">등록된 심판이 없습니다.</td>
			  </tr>		
			</c:if>
						     					
           <c:if test="${refereeList!=null}">
           	<c:forEach var="referee" items="${refereeList}">			         	 
			  <tr align="center">			
				<td><span><img class="img-circle" src="${root }/img/refereeImg/${referee.refereePicture}" width="80px" height="80px"/></span></td>					
				<td style="font-size:13pt;"><br/><span class="">${referee.refereeName }</span></td>				
				<td style="font-size:13pt;"><br/><span class="">${referee.refereeBirth }</span></td>				
				<td style="font-size:13pt;" width="20%"><br/><span class="">${referee.sido }</span></td>										
				
			  </tr>
			</c:forEach>			
		   </c:if>		   		
             </tbody>
            </table>               
          </div>                  
      </div>        
      </div> 	
	
    <div align="center">    
 			
		<c:if test="${count>0 }">
			<c:set var="pageBlock" value="${5}"/>
			<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/>
			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
			
			<c:set var="startPage" value="${rs*pageBlock+1 }"/>
			<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
			
			<c:if test="${endPage>pageCount }">
				<c:set var="endPage" value="${pageCount }"/>
			</c:if>		
			
			<ul class="pager">
			<c:if test="${startPage>pageBlock }">
				<li><a href="${root }/referee/refereeList.do?pageNumber=${startPage-pageBlock}&sportCode=${sportCode}">BACK</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li><a href="${root }/referee/refereeList.do?pageNumber=${i}&sportCode=${sportCode}">${i }</a></li>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<li><a href="${root }/referee/refereeList.do?pageNumber=${startPage+pageBlock}&sportCode=${sportCode}">NEXT</a></li>
			</c:if>
			</ul>
					
		</c:if>
	<br/><br/><br/>	
	
	<input type="button" class="btn btn-info" value="심판 지원하기" onclick="location.href='${root}/referee/registerReferee.do?sportCode=${sportCode}'">	
	
	</div>   
  </body>
</html>