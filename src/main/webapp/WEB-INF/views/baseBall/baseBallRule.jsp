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
	<script type="text/javascript" src="${root}/js/referee/referee.js"></script>
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
    
    <br/><br/>

    <div class="container">

      <div class="blog-header">
        <h1 class="blog-title">야구경기 규칙</h1>
        <p class="lead blog-description">축구 경기 규칙은 국제축구평의회(IFAB)에 의해 제정된 축구 경기의 기본 규칙이다.</p>
      </div>

      <div class="row">

        <div class="col-sm-8 blog-main">

          <div class="blog-post">
            <h2 class="blog-post-title">규칙</h2>
            <p class="blog-post-meta">2015-7-20 by <a href="${root }/start.jsp">SML KOREA</a></p>
			<hr>
            <h3>1.경기장</h3>
            <hr>
            <h4>규격</h4>
            <ul>
            	<li>경기장은 반드시 네모여야 한다.</li>
            	<li>터치 라인의 길이는 골 라인의 길이보다 길어야 한다.</li>
            	<li>길이는 최소 90m, 최대 120m이며</li>
            </ul>
            <blockquote>
              <p>너비(폭)는 최소 45m, 최대 90m이어야 한다. </p>
            </blockquote>
            
            <ul>
            	<li>국제 경기는 길이가 최소 100m에서 최대 110m이내여야 하며 너비(폭)는 최소 64m에서 최대 75m이내여야 한다.</li>
            	<li>경기는 각각 11명이 넘지 않게 평성된 두팀에 의하여 행하며, 팀 중에 한명은 골키퍼이다. 어느 한 팀이라도 7명보다 적을때 경기는 개시되지 않는다.</li>
            </ul>            
            <hr>
            <h3>2.볼</h3>
            <hr>
            <h4>1)재질</h4>
            <ul>
            	<li>볼은 둥근 모양이어야 하며 가죽 또는 알맞은 재질로 되어 있어야 한다.</li>
            	<li>둘레의 길이는 68cm(27인치)이상, 70cm(28인치) 이하이어야 하며</li>
            	<li>경기 시작시 무게는 410g(14온스) 이상, 450g(16온스) 이하이어야 한다</li>
            	<li>공기 압력은 해면에서 0.6 기압 이상, 1.1기압 이하여야 한다.</li>
            </ul>
            
            <h4>2)볼의 교체</h4>
            <ul>
            	<li> 만일 경기 중 볼이 터지거나 바람이 빠졌다면 경기를 중단하고, 교체된 볼로 처음에 결함이 발생된 장소에서 드롭 볼로 재개한다.</li>
            	<li>만일 킥오프, 골킥, 코너 킥, 프리 킥, 페널티 킥, 드로우인 등 인 플레이가 아닐 경우 경기는 상황에 따라 재개한다.</li>
            	<li>경기중에 주심의 허락없이 볼을 바꿀 수 없다.</li>            	
            </ul>            
            <blockquote>
              <p>공식 경기에서는 규칙 2에 규정된 최소한의 기술적 조건에 맞는 볼만을 사용한다</p>
            </blockquote>
            
            <hr>
            <h3>3.선수의 수</h3>
            <hr>
            <h4>1)선수</h4>
            <ul>
            	<li> 경기는 각각 11명이 넘지 않게 편성된 두 팀에 의해서 행하며, 팀 중의 한명은 골키퍼이다.</li>
            	<li>어느 한 팀이라도 7명보다 적을 때에는 경기를 개시할 수 없다.</li>            	
            </ul>
            
            <h4>2)모든 경기</h4>
            <ul>
            	<li>모든 경기에서 경기 개시 전에 교체를 위한 대기 선수의 명단을 주심에게 제출해야 한다.</li>
            	<li>교체 대기 선수 명단에 기재되지 않은 선수는 경기에 참여할 수 없다.</li>            	            	
            </ul> 
            
             <h4>3)교체 절차</h4>
             <ul>
            	<li>교체 선수로 경기자를 대체할 때는 다음 조건들이 준수되어야 한다.</li>
            	<li>주심은 교체하기 전에 교체 의사를 통보받아야 한다.</li>
            	<li>교체되어 나가는 자가 경기장을 떠난뒤 주심의 신호를 받은 후에 입장한다.</li>
            	<li>교체되어 나온 선수는 잔여 시간의 경기에 참여하지 못한다.</li>             	            	
            </ul>           
            <pre><code>골키퍼 교체) 주심에게 통보되어야 하며, 경기가 중지된 동안만 교대할수 있다.</code></pre>     
             

        </div><!-- /.blog-main -->
        
        <br/><br/>       

    <footer class="blog-footer">
      <p>built for <a href="${root }/start.jsp">SML KOREA</a></p>     
    </footer> 
     </div>
    </div> 
   </div> 
</body>
</html>