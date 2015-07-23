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
    
    <title>심판현황</title>    
    

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
	<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="${root }/start.jsp"style="color:white;">SML KOREA</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
              	<li><a href="${root}/basketBall/basketBallCommonBoardPage.do?sportCode=${sportCode}"style="color:white;">공지사항</a></li>
                <li><a href="${root}/basketBall/basketBallRule.do?sportCode=${sportCode}"style="color:white;">경기규칙</a></li>
                <li><a href="${root}/basketBall/basketBallTeamList.do?sportCode=${sportCode}"style="color:white;">팀리스트</a></li>
                <li><a href="${root}/referee/refereeList.do?sportCode=${sportCode}"style="color:white;">심판현황</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"style="color:white;">다른종목가기<span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                  	<li><a href="${root }/sc">축구</a></li>
                    <li class="divider"></li>
                    <li><a href="${root}/baseBall/baseBallMain.do">야구</a></li>
                    <li class="divider"></li>
                    <li><a href="${root}/basketBall/basketBallMain.do">농구</a></li>
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
    </nav>
	
	 <br/><br/><br/><br/>
	

    <div class="container">

      <div class="blog-header">
        <h1 class="blog-title"><strong>농구경기 규칙</strong></h1>
        <p class="lead blog-description">농구 경기 규칙의 룰은 한국농구연맹(KBL)의 규정에 따른다.</p>
      </div>

      <div class="row">

        <div class="col-sm-8 blog-main">

          <div class="blog-post">
            <h2 class="blog-post-title"><strong>규칙</strong></h2>
            <p class="blog-post-meta">2015-7-20 by <a href="${root }/start.jsp">SML KOREA</a></p>
			<hr>
            <h3><b>1.경기장</b></h3>
            <hr>
            <h4>규격</h4>
            <ul>
            	<li>코트 규격은 사이드라인 28m, 베이스라인 15m 이다. 천장의 높이는 7m 이상, 경계선으로부터 장애물까지는 1m 이상, 관중석까지는 2m 이상 거리를 두어야 한다.</li>
            	<li>백보드는 가로 1.8m, 세로 1.05m의 직사각형이어야 하며 전면은 평면으로 투명해야 한다.</li>
            	<li>백보드에는 링의 중앙을 중심으로 하여 가로 59cm, 세로 45cm의 직사각형을 너비 5cm의 흰색 선으로 그려야 한다.</li>
            </ul>
            
            <ul>
            	<li>바스켓은 안지름 45cm인 오렌지색 철제 링 주위에 길이 40cm의 흰 실로 만든 네트를 친다. 각 링은 제일 윗부분이 플로어로부터 3.05m 높이에 안전하게 백보드와 수직으로 부착해야 한다. 링의 안쪽으로부터 백보드 앞면에 이르는 가장 가까운 길이는 15cm여야 한다.</li>
            	<li>자유투 거리(골대중앙까지)는 4.2m 이고 3슛 거리는 정면 거리는 7.23m 이고 사이드 거리는 6.7m 이어야 한다.</li>
            </ul>            
            <hr>
            <h3><b>2.볼</b></h3>
            <hr>
            <h4>1)재질</h4>
            <ul>
            	<li>농구공은 표면이 오렌지 색으로 되어 있어야 하며, 가죽이나 합성 재질로 된 8~12 조각으로 이어져 있어야 한다. </li>
            	<li>주입 공기는 아랫면이 1.8m 높이로 코트의 플로어에 떨어뜨렸을 때 볼의 윗면이 1.2~1.4 미터 높이까지 튀어 오르도록 공기를 넣어야 한다. </li>
            	<li>공의 둘레는 75~76cm, 무게는 600~625g이어야 한다. 여자 경기에서의 둘레는 72.4~73.7cm이고, 무게는 510~567g이어야 한다.</li>
            </ul>
            
            <blockquote>
              <p>공식 경기에서는 규칙 에 규정된 최소한의 기술적 조건에 맞는 볼만을 사용한다</p>
            </blockquote>
            
            <hr>
            <h3><b>3.선수및 심판</b></h3>
            <hr>
            <h4>1)선수</h4>
            <ul>
            	<li> 농구에서 필수로 요구하는 장비는 농구공과 코트와 선수 10명이다.</li>
            	<li>팀은 2명의 포워드, 1명의 센터, 2명의 가드, 총 5명으로 구성된다.</li> 
            	<li>어느 팀도 선수가 5명 미만으로 줄어들 수는 없다.</li>
            	<li> 만일 경기 중에 있는 선수가 5번의 반칙으로 퇴장 당해야 할 때 벤치에 있는 교대선수가 모두 5번 반칙으로 물러나 있는 상황이라면 바로 전에 5개의 파울로 물러난 선수와 교체해야 한다.</li>           	
            </ul>
            
            <h4>2)심판</h4>
            <ul>
            	<li>경기 담당 심판은 주심 1명과 부심 1명으로 구성된다. </li>
            	<li>주심과 부심은 코트를 대각선으로 2등분하여, 각각 오른쪽의 엔드 라인과 왼쪽의 사이드 라인을 따라 움직이며 규칙을 적용한다. </li>            	            	
            </ul> 
            
             <h4>3)경기 시간</h4>
             <ul>
            	<li>프로의 경우 10분씩[FIBA] 또는 12분씩[NBA] 4번 게임을 하고, 대학생의 경우 전·후반[halves] 각각 20분씩 40분이다. </li>
            	<li> 전·후반 사이에 10분간의 휴식 시간(하프 타임)이 주어진다.</li>         	            	
            </ul>           
            <pre><code>작전타임) 작전 시간은 전·후반에 각각 2회, 30초씩 요청할 수 있다.</code></pre>     
             

        </div><!-- /.blog-main -->
        
        <br/><br/>       
	</div></div>
    <footer class="blog-footer">
      <p>built for <a href="${root }/start.jsp">SML KOREA</a></p>     
    </footer>   
</body>
</html>