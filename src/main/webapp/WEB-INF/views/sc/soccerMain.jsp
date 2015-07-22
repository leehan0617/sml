<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:set var="sportCode" value="0"/>
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
<!-- NAVBAR
================================================== -->
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
                    <li><a href="${root}/sc">축구</a></li>
                    <li class="divider"></li>
                    <li><a href="${root}/baseBall/baseBallMain.do">야구</a></li>
                    <li class="divider"></li>
                    <li><a href="${root }/sportLegBall/legBallMain.do">족구</a></li>
                    <li class="divider"></li>
                    <li><a href="${root}/basketBall/basketBallMain.do">농구</a></li>
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


    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class=""></li>
        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
        <li data-target="#myCarousel" data-slide-to="2" class="active"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item">
          <img class="first-slide" src="${root }/resources/images/soccer01.jpg" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>WELCOME SML SOCCER PAGE </h1>
              <p>이 페이지에는 축구에 관련된 리그 및 팀들간 정보가 있습니다.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Default Button</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="${root }/resources/images/soccerMain01.jpg" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>공지사항</h1>
              <p>축구에 관련된 실시간 소식 및 정보를 여기서 확인해주세요.</p>
              <p><a class="btn btn-lg btn-primary" role="button" data-toggle='modal' data-target='#modalSoccerBoard' onclick="viewSoccerBoard('${root}','${sportCode }','${currentPage}')">공지사항보기</a></p>
            </div>
          </div>
        </div>
        <div class="item active">
          <img class="third-slide" src="${root}/resources/images/soccerMain02.jpg" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>다른종목이 궁금하세요?</h1>
              <p>SML KOREA는 축구이외에도 야구,족구,풋살에 관한 친선및리그경기 매칭서비스를 제공하고있습니다.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">다른종목가기</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row">
        <div class="col-lg-4">
          <img class="img-circle" src="${root}/resources/images/notice.png" alt="Generic placeholder image" width="140" height="140">
          <h2>리그 게시판</h2>
          <p>현재 진행중인 리그들에 관심이 있으시면 아래 버튼을 클릭해주세요.</p>
          <p><a class="btn btn-default" href="#carousel-example-generic" role="button" id="leagueScroll">리그 보기</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="${root}/resources/images/geo.png" width="140" height="140">
          <h2>경기 대진표</h2>
          <p>실시간 경기 대진표를 보여주고 있습니다. 대진표를 보려면 여기를 눌러주세요.</p>
          <p><a class="btn btn-default" href="#onAirMatch" role="button" id="matchScroll">대진표 보기</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="${root}/resources/images/surface.png" alt="Generic placeholder image" width="140" height="140">
          <h2>통계 자료</h2>
          <p>SML 축구회원 및 팀들간 통계에 관심이 있으시면 아래 버튼을 눌러주세요</p>
          <p><a class="btn btn-default myScroll" role="button" href="#chartMain" onclick="showAgeChart('${root}','${sportCode}')">통계자료 보기</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->


      <!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">SML 리그 <span class="text-muted">현재 진행중인 리그목록들입니다.</span></h2>
          <p class="lead">상세정보는 원하는 리그명을 클릭해주세요.</p>
          	<table class="table table-hover">
          		<thead>
          			<tr><th style="width:20%">리그명</th><th style="width:30%">리그기간</th><th style="width:40%">리그장소</th><th style="width:10%">참가여부</th></tr>
          		</thead>
          		<tbody id="leagueTable">
          			
           		</tbody>
          	</table>
          
        </div>
        <div class="col-md-5">
          
          	<!--  -->
          	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="width:500px;height:500px">
			  <!-- Indicators -->
			  <ol class="carousel-indicators" id="leagueOl">
			    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			  </ol>
			
			  <!-- Wrapper for slides -->
			  <div class="carousel-inner" role="listbox" id="leagueDiv">
			     <div class="item active"><img src="${root}/resources/images/soccerLeague.jpg" alt="a">
			     	<div class="carousel-caption">
			        이곳은 현재 참가 가능한 리그목록이 있습니다. 
			      </div>
			     </div>
			     
			     
			  </div>
			
			  <!-- Controls -->
			  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			<!--  -->
          </div>
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette" id="onAirMatch">
        <div class="col-md-7 col-md-push-5">
          <h2 class="featurette-heading">경기 대진표<span class="text-muted">&nbsp;See for yourself.</span></h2>
          <p class="lead">이곳은 현재 경기 예정이 있는 팀들간 대진표들을 정렬해 놓았습니다. 경기를 예측해보세요!</p>
        </div>
        <div class="col-md-5 col-md-pull-7">
          <div class="onAirTable" style="width:480px;height:300px;">
          	<div class="alert alert-info" role="alert">Coming Soon</div>
          	<!--  -->
          	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  			</div>
            <!--  -->
          </div>
         </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette" id="chartMain">
        <div class="col-md-7">
          <h2 class="featurette-heading">차트를 구경하시고 , <span class="text-muted">탭을 눌러보세요.</span></h2>
          <p class="lead">여기는 SML 축구 이용자들의 각종 통계 및 차트를 보여주는 곳입니다. 차트와 자신의 정보를 비교해보세요. 이용자들이 많을 수록 통계는 더 정확한 정보를 보여줍니다.</p>
       	  <br/>
       	  <br/>
        </div>
        <div class="col-md-5">
          <ol class="breadcrumb">
  			<li class="active" id="ageChart" onclick="showAgeChart('${root}','${sportCode }')">연령별 통계</li>
  			<li id="cityChart" onclick="showCityChart('${root}','${sportCode }')">지역별 통계</li>
  			<li id="dayChart" onclick="showDayChart('${root}','${sportCode}')">요일별 통계</li>
		  </ol>	
          <div id="soccerPieChart" data-holder-rendered="true" style="width:460px; height:400px;"></div>
          <div id="soccerLineChart" data-holder-rendered="true" style="width:460px; height:400px;"></div>
          <div id="soccerBarChart" data-holder-rendered="true" style="width:460px; height:400px;"></div>
        </div>
      </div>

      <hr class="featurette-divider">

      <!-- FOOTER -->
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>© 2014 Company, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a></p>
      </footer>

    </div><!-- /.container -->
    
    <div class="modal fade" id="modalSoccerBoard" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
 	 <div class="modal-dialog">
    	<div class="modal-content">
    		<div class="modal-header">
    			<h3>공지사항</h3>
    		</div>
    		<div class="modal-body">
    			<table class="table table-striped">
					<thead>
						<tr> 
							<th style="width:15%">글번호</th><th style="width:45%">제목</th><th style="width:15%">작성자</th><th style="width:25%">작성일</th> 
						</tr> 
					</thead>
					<tbody class="soccerBody">	
					</tbody>
				</table>
				<nav>
  					<ul class="pager">
  					</ul>
  				</nav>
    		</div>
      		<div class="modal-footer">
            	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      		</div>
  		</div>
     </div>
   </div>
   
   <div class="modal fade" id="modalSoccerBoardRead" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
 	 <div class="modal-dialog">
    	<div class="modal-content">
    		<div class="modal-header">
    			<h3>공지사항</h3>
    		</div>
    		<div class="modal-body">
    			 <div class="form-group">
           			 <label for="recipient-name" class="control-label" id="boardTitle">Title</label>
           			 <input type="text" class="form-control" id="soccerBoardTitle" value="" disabled="disabled"/>
        		  </div>
         		 <div class="form-group">
           			 <label for="message-text" class="control-label" id="boardContent">Content</label>
           			 <textarea class="form-control" id="soccerBoardContent" disabled="disabled"></textarea>
        		  </div>
    		</div>
      		<div class="modal-footer">
            	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:modalToggle()">Close</button>
      		</div>
  		</div>
     </div>
   </div>
   
   <div class="modal fade" id="modalSoccerChart" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
   	<div class="modal-dialog">
    	<div class="modal-content">
    		<div class="modal-header">
    			<h3>통계자료</h3>
    			
    		</div>
    		<div class="modal-body">
    		</div>
      		<div class="modal-footer">
            	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:modalToggle()">Close</button>
      		</div>
  		</div>
     </div>
   </div>
   
     <div class="modal fade" id="modalLeagueInfo" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
   	<div class="modal-dialog">
    	<div class="modal-content">
    		<div class="modal-header" id="modalLeagueHeader">
    			<h3>리그정보</h3>
    		</div>
    		<div class="modal-body" id="modalLeagueBody">
    			<div class="form-horizontal">
  					<div class="form-group"><label class="col-sm-2 control-label">리그명</label>
    					<div class="col-sm-10"><input type="text" class="form-control" id="leagueName" disabled="disabled"></div>
  					</div>
  					<div class="form-group"><label class="col-sm-2 control-label">리그지역</label>
    					<div class="col-sm-10"><input type="text" class="form-control" id="leagueRegion" disabled="disabled"></div>
  					</div>
  					<div class="form-group"><label class="col-sm-2 control-label">리그기간</label>
    					<div class="col-sm-10"><input type="text" class="form-control" id="leagueDate" disabled="disabled"></div>
  					</div>
  					<div class="form-group"><label class="col-sm-2 control-label">참가가능팀수</label>
    					<div class="col-sm-10"><input type="text" class="form-control" id="limitTeam" disabled="disabled"></div>
  					</div>
  					<div class="form-group"><label class="col-sm-2 control-label">리그시간</label>
    					<div class="col-sm-10"><input type="text" class="form-control" id="leagueTime" disabled="disabled"></div>
  					</div>
  					<input type="hidden" id="hiddenCode"/>
  				</div>
    		</div>
      		<div class="modal-footer" id="modalLeagueFooter">
      		</div>
  		</div>
     </div>
   </div>
   
   
   <script>
   jQuery(document).ready(function($) {
	   showAgeChart("${root}","${sportCode}");
  		showLeagueInfo("${root}","${sportCode}");
  		leagueTable("${root}","${sportCode}",'${teamName}');
  		showRecentMatch("${root}","${sportCode}");
  		
       $(".myScroll").click(function(event){            
               event.preventDefault();
               $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
       });
       
       $("#leagueScroll").click(function(event){
    	  event.preventDefault();
    	  $('html,body').animate({scrollTop:$(this.hash).offset().top},500);
       });
	   
       $("#matchScroll").click(function(event){
    	   event.preventDefault();
    	   $('html,body').animate({scrollTop:$(this.hash).offset().top},500);
       });
	});
   
   </script>
  
 </body>
 </html>
