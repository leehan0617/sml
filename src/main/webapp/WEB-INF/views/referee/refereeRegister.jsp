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
    <script src="${root }/js/xhr/xhr.js"></script>
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
          </div>
        </nav>

      </div>
    </div>
	
	 <br/><br/><br/><br/>
     <div class="container-fluid" style="background:url(${root}/resources/images/refereeBackgroundImage.jpg);">
        <div align="center">
       <span class=""><a href="${root}/team/teamMain.do?teamName=${teamName}"><img class="img-circle img-responsive" alt="logo" src="${root}/img/SMLKOREA.png" width="300" height="300"></img></a></span>
       </div>       
       <br/>           
       <br/>           
     </div>
     <br/>
      <hr style="border: solid 1px ;">   
     	
	<div class="container">  		
  	<form action="${root}/referee/registerReferee.do" method="post" enctype="multipart/form-data" onsubmit="return refereeCheck(this)">  		
  		
  		<h2>심판 등록</h2>
  		<p>본인의 정보를 입력해주세요.</p>	
  		
  		<div class="form-group">
		  <label for="sel1">종목</label>
		  <select class="form-control" id="sel1" name="sportCode">		  	
		    <option>종목을 선택하세요</option>
		    <option value="0">축구</option>
		    <option value="1">야구</option>
		    <option value="2">풋살</option>	
		    <option value="3">족구</option>		     
		  </select>
		</div>
			
   		<div class="form-group">
      		<label for="usr">NAME</label>
       		<input placeholder="이름" type="text" class="form-control" name="refereeName">
    	</div>
	    <div class="form-group">
      		<label for="usr">BIRTH</label>
       		<input type="date" class="form-control" placeholder="생일을 선택해주세요" name="refereeBirth" />
    	</div>    	
    	
    	<div class="form-group">
		  <label for="sel1">지역</label>		  
		  <select class="form-control" id="sel1" name="refereeRegion">			
			<c:forEach var="sido" items="${sidoList}" >		
			<option value="${sido}">${sido}</option>				
			</c:forEach>
		  </select>
		  		   
		</div>    	
    		<div class="form-group">
      		<label for="usr">사진등록</label>
       		<input placeholder="사진을등록해주세요" type="file" class="form-control" name="file">
    	</div>
    		<div class="form-group">
      		<label for="usr">연락처</label>
       		<input placeholder="연락처를 입력해주세요" type="text" class="form-control" name="refereePhoneNumber">
    	</div>
    	
    	<div class="form-group">
		  <label for="sel1">성별:</label>
		  <select class="form-control" id="sel1" name="refereeGender">		  	
		    <option value="남">남</option>
		    <option value="여">여</option>		    
		  </select>
		</div>
				
		<input type="submit" class="btn btn-info" value="Submit">			
  		
  	</form> 
  		<br/><br/>
  		<br/><br/>  		 	
  	</div>
	
	
</body>
</html>