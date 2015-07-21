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
	
	<script src="${root }/resources/js/jqplot.categoryAxisRenderer.js"></script>
	<script src="${root }/resources/js/jqplot.barRenderer.js"></script>
	<script src="${root }/resources/js/jqplot.pieRenderer.js"></script>
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
              	<li><a href="${root}/soccer/soccerCommonBoardPage.do?sportCode=${sportCode}">공지사항</a></li>
                <li><a href="${root}/soccer/soccerRule.do?sportCode=${sportCode}">경기규칙</a></li>
                <li><a href="${root}/soccer/soccerTeamList.do?sportCode=${sportCode}">팀리스트</a></li>
                <li><a href="${root}/referee/refereeList.do?sportCode=${sportCode}">심판현황</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">다른종목가기<span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                  	<li class="divider"></li>
                    <li><a href="${root}/soccer/soccerMain.do?legion=legion">축구</a></li>
                    <li class="divider"></li>
                    <li><a href="#">야구</a></li>
                    <li class="divider"></li>
                    <li><a href="#">족구</a></li>
                    <li class="divider"></li>
                    <li><a href="${root }/scMain">풋살</a></li>
                    <li class="divider"></li>
                  </ul>
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
	
	
     <div class="container-fluid" style="background:url(${root}/resources/images/backGroundImage.jpg)">   
       <span class="col-xs-2"><a href="${root }/scMain"><img class="img-circle img-responsive" alt="logo" src="${root}/resources/images/android@2x.png" width="200" height="150"></img></a></span> 	  
       	  
       <span class="col-xs-9" style="font-size:50pt;"><br/>SML KOREA</span>            
     </div>
       <br/><br/>
	
    <div class="container" style="background-color: ">    	
      <div class="row">      	   	
          <h2 class="sub-header">공지사항</h2>
          <br/>         
          <div class="table-responsive" style="background-color: ">
            <table class="table table-striped">
              <c:if test="${soccerBoardList!=null}">	
              <thead>               
               <tr align="center" style="background-color:#E2D6D6;"> 
               	  <td>작성자</td>              	                 
                  <td>제목</td>
                  <td>작성일</td>                                                                
               </tr>               
              </thead>
              </c:if>              
              <tbody id="accordion">
              	             
           	  <c:if test="${soccerBoardList==null}">	
			  <tr>
			   <td align="center">작성된 공지사항이 없습니다.</td>
			  </tr>		
			</c:if>
						     					
              <c:if test="${soccerBoardList!=null}">
           	  <c:forEach var="soccerBoardList" items="${soccerBoardList}">			         	 
			  <tr align="center" style="background-color:" id="#accordion">				
				<td width="10%" style="font-size:20px; padding-top:20px;"><span class="label label-danger glyphicon glyphicon-user">${soccerBoardList.boardWriter}</span></td>
				<td>
				 <div style="padding-top:10px;" class="panel-group" id="accordion">				  
    				<div class="panel panel-default">
     					 <div class="panel-heading">
        				<h4 class="panel-title">
         					 <a data-toggle="collapse" data-parent="#accordion" href="#${soccerBoardList.boardNumber}">${soccerBoardList.boardTitle}</a>
       				    </h4>
     				    </div>
     			    <div id="${soccerBoardList.boardNumber}" class="panel-collapse collapse">
        				<div class="panel-body">${soccerBoardList.boardContent}</div>
     			    </div>
                   </div>
                  </div>
               </td>
               <td width="10%" style="padding-top:25px;"><span class="label label-info glyphicon glyphicon-calendar"><fmt:formatDate value="${soccerBoardList.boardDate}" type="date"/></span></td>
               
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
				<li><a href="${root }/soccer/soccerCommonBoardPage.do?pageNumber=${startPage-pageBlock}&sportCode=${sportCode}">BACK</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li><a href="${root }/soccer/soccerCommonBoardPage.do?pageNumber=${i}&sportCode=${sportCode}">${i }</a></li>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<li><a href="${root }/soccer/soccerCommonBoardPage.do?pageNumber=${startPage+pageBlock}&sportCode=${sportCode}">NEXT</a></li>
			</c:if>
			</ul>
					
		</c:if>
	<br/><br/><br/>		
	</div>     
  </body>
</html>

