<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="${root }/resources/images/favicon.ico">

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="${root }/resources/css/style.css"/>
<link rel="stylesheet" type="text/css" href="${root }/resources/css/font.css"/>
<link rel="stylesheet" type="text/css" href="${root }/resources/css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="${root }/resources/css/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="${root }/resources/css/half-slider.css"/>

<!-- SCRIPT -->
<script src="${root }/resources/js/jquery.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=1442260e0c6af86974001269a7312e42&libraries=services"></script>
<script src="${root }/resources/js/startDaumMap2.js"></script>
<script src="${root }/resources/js/startDaumMap.js"></script>
<script src="${root }/resources/js/bootstrap.js"></script>
<script src="${root }/resources/js/angular.js"></script>
<script src="${root }/resources/js/jquery-ui.js"></script>
<script src="${root }/resources/js/smlAngular.js"></script>
<script src="${root }/resources/js/smlStart.js"></script>
<script src="${root }/js/xhr/xhr.js"></script>

<title>SML Korea</title>
</head>
<body data-ng-app="app">
	<header>
		<div class="row">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-3"><h3><strong>SML KOREA</strong></h3></div>
	  		<div class="col-md-4"></div>
	  		<div class="col-md-4">
	  			<form class="form-inline"  id="searchForm" name="searchForm" style="padding-top:15px;">
		  			<div class="input-group">
		      			<input type="text" class="form-control" placeholder="팀명을 검색하세요." name="teamName" id="searchTeamName">
			    		<span class="input-group-btn">
			      		<button class="btn btn-default" type="button" id="goTeamPage">
			      		  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>이동
			      		</button>
			      		</span>
		    		</div><!-- /input-group -->
	  			</form>
	  	   </div>
	   </div>
      <a class="skip" href="#main">Skip to Content</a><ul class="nav-lang"><li class="nav-lang-koselected">한국어</li></ul>
      <div class="container">
        <div class="full">
          <h1 class="name">SML KOREA</h1>
          <br/>
          <p class="subtitle">간단한 정보 입력만으로<br/>다른팀들과 경기를 매칭시킬수 있습니다.<br/>지금 매칭을 시작해보세요.</p>
          <nav role="navigation">
            <ul class="nav">
              <li><a href="#smlInfo">SML 소개</a></li>
              <c:choose>
	              <c:when test="${teamName == null }">
	              	<li><a href="#sign" data-toggle="modal" data-target="#popupJoin">회원가입</a></li>
	              	<li><a href="#login" data-toggle="modal" data-target="#popupLogin">로그인</a></li>
	              </c:when>
	              <c:otherwise>
	              	<li><a href="${root }/teamPage/logout.do">로그아웃</a></li>
	              </c:otherwise>
              </c:choose>
              <li><a href="#nearGround">주변 경기장</a></li>
              <li><a href="#workshopper-list">게임 페이지</a></li>
              <li><a href="#helpCenter">고객센터</a></li>
            </ul>
          </nav>
          <p>
          	<span>
          		<br/>
          		<br/>
          		<br/>
          	</span> 
          </p>
        </div>
      </div>
    </header>
    
    <div id="main" role="main">
    	<section>
		    <div class="container workshop-header" id="smlInfo" style="background-color: #fff; padding-bottom:2px;">
		      <div class="full">
		        <h2 class="big-heading"><strong>What is SML Korea?</strong></h2>
		        <p>저희 <strong>SML(Sport Matching League) Korea</strong>는 원하는 지역에서 원하는 시합을 할수있도록 도와드립니다</p>
		        <nav>
<!-- 		          <ul class="inner-nav">
		            <li><a href="#sign" data-toggle="modal" data-target="#popupJoin">회원가입 하기</a></li>
		          </ul> -->
		        </nav>
		      </div>
		    </div>
		    <div class="container workshops" style="background-color: #fff; padding-top:0px;">
		      <div class="third" aria-hidden="true">
		        <div id="map2"></div>
		      </div>
		
		      <div class="third upcoming-workshoppers">
		      	<table class="table table-hover">
		      		<thead>
		      			<tr>
		        			<th><h4><strong>경기 일정</strong></h4></th>
						</tr>
					</thead>
					<tbody>
						<tr>
		        			<td><div id="recordList"></div></td>
		        		</tr>
		        	</tbody>
		        </table>	
		      </div>
		     
		
		      <div class="third anyone-can-host">
		      	<table class="table table-hover">
		      		<thead>
		      			<tr>
		        			<th><h4><strong>지금 신청하세요!.</strong></h4></th>
						</tr>
					</thead>
				</table>
		        <p id="event-count"><span>지금까지 모두 </span> <strong class="cnt">?</strong> <span>건의 경기가 있었습니다!</span></p>
		        <p><span>SML홈페이지이용은 모두 무료입니다</span></p>
		        <p><span>더많은 사람들과의 교류를 원한다면 지금바로</span></p>
		        <p><span> 신청하세요.</span></p>
			    <nav>
	 		       <ul class="inner-nav">
			         <li><a href="#sign" data-toggle="modal" data-target="#popupJoin">회원가입 하기</a></li>
			       </ul>
			    </nav>
		      </div>
		     </div>
	  </section>
  
   <section>
    <div id="workshoppers">
      <div class="container">
        <div class="full">
          <h2 class="big-heading">튜토리얼</h2>
          <p>홈페이지가 처음이신 분들을 위하여.</p>
          <nav>
            <ul class="inner-nav">
              <li><a href="#workshopper-list">팀원 등록</a></li>
              <li><a href="https://github.com/nodeschool/discussions/issues/new">매칭시작</a></li>
              <li><a href="https://github.com/nodeschool/discussions">매칭상태보기</a></li>
              <li><a href="#">경기 결과 입력</a></li>
            </ul>
          </nav>
        </div>
      </div>
      <div class="container">
        <div class="third">
          <div class="term">
            <div class="chrome">
              <span class="btn btn-term close"></span>
              <span class="btn btn-term min"></span>
              <span class="btn btn-term max"></span>
            </div>
            <div class="shell">
              <code>친선경기</code>
              <code>리그경기</code>
            </div>
          </div>
        </div>

        <div class="third">
          <div class="term">
            <div class="chrome">
              <span class="btn btn-term close"></span>
              <span class="btn btn-term min"></span>
              <span class="btn btn-term max"></span>
            </div>
            <div class="shell">
              <div class="workshopper">
                <code>» 팀생성</code>
                <code>» 팀원등록</code>
                <code>» 매칭시작!</code>
              </div>
            </div>
          </div>
        </div>

        <div class="third">
          <div id="get-going">
            <h3>시작하세요 —</h3>
            <p><span>먼저 </span> 경기별 최소 팀원 
            	<span>이 필요합니다. 다음에는 </span>  
            	<span>팀페이지에서 매칭시작을 눌러주세요. 간단한 입력만으로 경기가 성사됩니다.</span></p>
            <p><span>리그 경기는 </span> <strong>매 시즌별 공지사항</strong>
            	<span>을 확인해주세요. 종목별 리그열리는 기간</span> 
            	<span>이 다를수 있습니다.</span></p>
          </div>	
        </div>
      </div>
    </div></section>
    
    <section>
		    <div class="container workshop-header" style="background-color: #fff;">
		      <div class="full">
		        <h2 class="big-heading" id="nearGround">주변 경기장</h2>
		        <p>현재 위치를 기반으로 주위 경기장을 홈경기장으로 하고있는 팀들의 분포도 입니다.</p>
	          </div>
		    </div>
		    <div class="container workshops" style="background-color: #fff; padding-top:0px;">
		      <div id="map" style="height:500px;"> 
		      </div>
		    </div>
		    <div id="mapList" style="display:none;">dskjfhdskjfk</div>
	  </section>
	  
	  <!--  
	<section id='developers' class='developers fill-light'>
		<div class='full'  id="workshopper-list" style="padding-top: 20px;">
			<h2 class="big-heading">게임 페이지</h2>
			<br/>
			<p>현재 SML Korea에서 지원하고 있는 종목의 페이지 입니다.</p>
			<br/>
			-->
			
 <section id='developers' class='developers fill-light'>
		<div class='limiter pad4y'  id="workshopper-list">
			<div class='prose prose-big space-bottom1 pad4y space-top2 contain z1 clearfix'>
				<h1>경기 종목</h1>
				<div class="clearfix space-bottom2">
				<p class='quiet block col9'>SML Korea는 현제 축구,야구,농구,족구 총 4가지 종목을 서비스 하고있습니다.<br/> 아래 링크를 통해서 각각의 팀페이지로 이동해 실시간 리그정보 및 경기매칭을 진행해보세요.</p>
				</div>
			</div>
		</div>
		<div class="clearfix">
			<div class='section clearfix col12 keyline-top  dev-tools space-bottom2 clip'>
				<a href="${root }/sc"  class='block center col3 pad2 pad4y keyline-right keyline-bottom'>
					<img src="${root}/resources/images/startImage/ss.png" width="200" height="200">
					<span class='col12'><strong>축구</strong></span>
					<span class='col12 small quiet space-bottom1'><strong>Soccer</strong></span>
				</a>				

				<a href="${root}/baseBall/baseBallMain.do"  class='block col3 center pad2 pad4y keyline-right keyline-bottom'>
					<img src="${root}/resources/images/startImage/bb.png" width="200" height="200">
					<span class='col12'><strong>야구</strong></span>
					<span class='col12 small quiet space-bottom1'><strong>Baseball</strong></span>
				</a>

				<a href='${root}/basketBall/basketBallMain.do' class='block col3 center pad2 pad4y keyline-bottom keyline-right'>
					<img src="${root}/resources/images/basketballIcon.PNG" width="200" height="200">

					<span class='col12'><strong>농구</strong></span>
					<span class='col12 small quiet space-bottom1'><strong>Basketball</strong></span>
				</a>

				<a href='${root }/legBall/legBallMain.do' class='block center col3 pad2 pad4y keyline-bottom'>
					<img src="${root}/resources/images/startImage/lg.png" width="200" height="200">
					<span class='col12'><strong>족구</strong></span>
					<span class='col12 small quiet space-bottom1'><strong>Legball</strong></span>
				</a>

			</div>
		</div>
		</section>

		<!--  
		<div class="full" style="height:600px;">
			<div style="width:25%; float:left; height:100%;">
			<img src="${root }/resources/images/startImage/startSoccer.png" style="height:600px;">
			</div>
			<div style="width:25%; float:left;">
			<img src="${root }/resources/images/startImage/startBaseBall.png" style="height:600px;">
			</div>
			<div style="width:25%; float:left;">
			<img src="${root }/resources/images/startImage/startBasketBall.png" style="height:600px;">
			</div>
			<div style="width:25%; float:left;">
			<img src="${root }/resources/images/startImage/startLegBall.png" style="height:600px;">
			</div>
		</div>
		</div>
	</section>
	-->

    <div class="container elective-workshoppers" style="background-color: #fff; padding-top: 100px;">
      <div class="third" id="helpCenter">
        <img alt="imformation" src="${root}/resources/images/imformation.png" style="width:50px; height:50px;">
        <label style="font-size:35px;"><strong>고객센터</strong></label>
        <p>이홈페이지의 운영자들에게 직접 물어보세요.</p>
        <p><span>문제가 생기셨나요? 이곳에서 문의하세요 &gt; </span> <span></span></p>
      </div>
      <div class="third">
        <div id="functionaljavascript" class="workshopper">
          <h4><a class="js-workshop-link" href="#" target="_blank">이희재 Lee Hee Jae</a></h4>
          <p>축구에 관한 정보 및 문의를 담당하고 있습니다.</p>
          <code class="glyphicon glyphicon-envelope">&nbsp;<strong>leeheejae@gmail.com</strong></code>
        </div>
        <div id="levelmeup" class="workshopper">
          <h4><a class="js-workshop-link" href="#" target="_blank">변형린 Byun Hyung Rin</a></h4>
          <p>야구에 관한 정보 및 문의를 담당하고 있습니다.</p>
          <code class="glyphicon glyphicon-envelope">&nbsp;<strong>byunhyungrin@naver.com</strong></code>
        </div>
        <div id="expressworks" class="workshopper">
          <h4><a class="js-workshop-link" href="#" target="_blank">이한빈 Lee Han Bin</a></h4>
          <p>풋살에 관한 정보 및 문의를 담당하고 있습니다.</p>
          <code class="glyphicon glyphicon-envelope">&nbsp;<strong>newbin0617@naver.com</strong></code>
        </div>
      </div>

      <div class="third">
        <div id="shader-school" class="workshopper">
          <h4><a class="js-workshop-link" href="#" target="_blank">정성남 Jung Sung Nam</a></h4>
          <p>족구에 관한 정보 및 문의를 담당하고 있습니다.</p>
          <code class="glyphicon glyphicon-envelope">&nbsp;<strong>sungnam@daum.net</strong></code>
        </div>
        <div id="bytewiser" class="workshopper">
          <h4><a class="js-workshop-link" href="#" target="_blank">조영석 Jo Young Seok</a></h4>
          <p>홈페이지 이용사항 및 건의사항에 관한 문의를 담당하고 있습니다.</p>
          <code class="glyphicon glyphicon-envelope">&nbsp;<strong>youngseok@gmail.com</strong></code>
        </div>
      </div>
    </div>
    
    <div class="container" style="background-color: #fff;">
      <footer>
        <div class="third">
          <p><strong>SML KOREA.</strong></p>
          <small><span>Developed by</span> <a href="https://github.com/leeheejae91/SmlProject" target="_blank">이희재 변형린 이한빈 정성남 조영석</a><span></span></small>
        </div>
        <div class="two-thirds">
          <ul>
            <li><strong>연락처</strong></li>
            <li><a href="https://twitter.com/nodeschool" target="_blank" class="glyphicon glyphicon-earphone">&nbsp;010 4646 3522</a></li>
            <li><a href="https://github.com/nodeschool" target="_blank" class="glyphicon glyphicon-envelope">&nbsp;newbin0617@gmail.com</a></li>
          </ul>
          <ul>
            <li><strong>기여하기</strong></li>
            <li><a href="https://github.com/nodeschool/discussions/issues/new" target="_blank" >이슈 만들기</a></li>
            <li><a href="https://github.com/nodeschool/discussions/issues" target="_blank">질문에 답하기</a></li>
          </ul>
          <ul>
            <li><strong>About</strong></li>
            <li><a href="#">워크쇼퍼 만들기</a></li>
            <li><a href="#">워크숍 개최하기</a></li>
            <li><a href="${root }/admin/main.do">관리자 페이지</a></li>
          </ul>
        </div>
      </footer>
    </div>
  </div>
  
  <div class="sign" id="sign"></div>
  <div class="login" id="login"></div>
 
</body>
</html>
