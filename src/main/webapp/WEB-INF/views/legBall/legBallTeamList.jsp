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
    
    <title>팀 리스트</title>    
    

   <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="${root }/resources/css/bootstrap.css"/>
    

    <!-- Custom styles for this template -->     
  
  	<script src="${root }/resources/js/jquery.js"></script> 	
 	<script src="${root }/resources/js/bootstrap.js"></script>
  	<script src="${root }/resources/js/jquery-ui.js"></script>  	
  	<script type="text/javascript" src="${root }/js/referee/referee.js"></script>
	<script type="text/javascript" src="${root}/js/xhr/xhr.js"></script> 	
    <script src="${root }/js/scrollnews.js"></script>
    
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
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
              	<li><a href="${root}/legBall/legBallCommonBoardPage.do?sportCode=${sportCode}">공지사항</a></li>
                <li><a href="${root}/legBall/legBallRule.do?sportCode=${sportCode}">경기규칙</a></li>
                <li><a href="${root}/legBall/legBallTeamList.do?sportCode=${sportCode}">팀리스트</a></li>
                <li><a href="${root}/referee/refereeList.do?sportCode=${sportCode}">심판현황</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">다른종목가기<span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
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
      <div class="container-fluid" style="background:url(${root}/resources/images/teamListBackGroundImage.jpg)">     
     <div align="center" style="padding-top:10px;">      
       <br/><br/><br/>
       <br/><br/>
       <span class="label label-danger" style="font-size:20pt;">SML KOREA</span>
       <br/><br/><br/>
       <br/>
      
       </div>             
     </div>
      <hr style="border: solid 2px ;"> 
       <br/><br/>
	
    <div class="container" style="background-color: ">    	
      <div class="row">      	   	
          <h2 class="sub-header">팀 LIST</h2>
          <br/>         
          <div class="table-responsive" style="background-color: ">
            <table class="table table-striped">
              <c:if test="${teamList!=null}">	
              <thead>               
               <tr align="center" style="background-color:#E2D6D6;"> 
               	  <td>엠블럼</td>              	                 
                  <td>팀명</td>
                  <td>리더이름</td>
                  <td>연고지</td>                               
               </tr>               
              </thead>
              </c:if>              
              <tbody>              
           <c:if test="${teamList==null}">	
			  <tr>
			   <td align="center">등록된 팀이없습니다.</td>
			  </tr>		
			</c:if>
						     					
           <c:if test="${teamList!=null}">
           	<c:forEach var="team" items="${teamList}">			         	 
			  <tr align="center" style="background-color:">			
				<td><a href="${root}/team/teamMain.do?teamName=${team.TEAMNAME}"><span><img class="img-circle" src="${root }/img/teamImg/${team.EMBLEM}" width="80px" height="80px"/></span></a></td>					
				<td style="font-size:13pt;"><br/><span class="label label-danger">${team.TEAMNAME }</span></td>				
				<td style="font-size:13pt;"><br/><span class="label label-primary">${team.TEAMLEADERNAME}</span></td>
				<td width="40%" style="font-size:13pt;" ><br/><span class="glyphicon glyphicon-home">${team.GROUND }</span></td>													
			  </tr>
			</c:forEach>			
		   </c:if>		   		
             </tbody>
            </table>               
          </div>                  
      </div>        
      </div> 	
	
    <div align="center">    
 			
		<c:if test="${teamCount>0 }">
			<c:set var="pageBlock" value="${5}"/>
			<c:set var="pageCount" value="${teamCount/boardSize+(teamCount%boardSize==0 ? 0:1)}"/>
			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
			
			<c:set var="startPage" value="${rs*pageBlock+1 }"/>
			<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
			
			<c:if test="${endPage>pageCount }">
				<c:set var="endPage" value="${pageCount }"/>
			</c:if>			
			
			<ul class="pager">
			<c:if test="${startPage>pageBlock }">
				<li><a href="${root }/soccer/soccerTeamList.do?pageNumber=${startPage-pageBlock}&sportCode=${sportCode}">BACK</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li><a href="${root }/soccer/soccerTeamList.do?pageNumber=${i}&sportCode=${sportCode}">${i }</a></li>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<li><a href="${root }/soccer/soccerTeamList.do?pageNumber=${startPage+pageBlock}&sportCode=${sportCode}">NEXT</a></li>
			</c:if>
			</ul>
					
		</c:if>
	<br/><br/><br/>		
	</div>   
  </body>
</html>