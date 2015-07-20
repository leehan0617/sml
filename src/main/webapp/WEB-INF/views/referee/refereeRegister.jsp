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
    
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">        
          <a class="navbar-brand" href="${root }/scMain">SML Korea</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
          	<c:choose>
          	<c:when test="${teamGrade == null }">          		
            	<li><a href="${root }/teamPage/login.do">로그인</a></li>            	
            </c:when>
            <c:otherwise>
	        	<li><a href="${root }/teamPage/logout.do">로그아웃</a></li>
	        </c:otherwise>
	        </c:choose>	       
			  <li><a href="${root }/scMain">메인</a></li>			            
          </ul>         
        </div>
      </div>
    </nav>
	
	 <br/><br/><br/><br/>
     <div class="container-fluid" style="background:url(${root}/resources/images/backGroundImage.jpg)">   
       <span class="col-xs-2"><a href="${root }/scMain"><img class="img-circle img-responsive" alt="logo" src="${root}/resources/images/android@2x.png" width="200" height="150"></img></a></span> 	  
       	  
       <span class="col-xs-9" style="font-size:50pt;"><br/>${teamName}</span>         
     </div>
       <br/><br/>	
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