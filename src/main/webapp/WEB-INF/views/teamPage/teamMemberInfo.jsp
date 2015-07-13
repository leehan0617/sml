<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    <title>memberInfo</title>
    
   <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="${root }/resources/css/bootstrap.css"/>

    <!-- Custom styles for this template -->     
  
  	<script src="${root }/resources/js/jquery.js"></script> 	
 	<script src="${root }/resources/js/bootstrap.js"></script>
  	<script src="${root }/resources/js/jquery-ui.js"></script>  
    
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    
  </head>
  <body>
      <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">        
          <a class="navbar-brand" href="#">SML Korea</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">LogIn</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
          </ul>
         
        </div>
      </div>
    </nav>
	
	
    <div class="container-fluid">    	
      <div class="row">
      	  <br/><br/><br/><br/>
      	  <div style="background-color: gold; height: 100px; width: 100%;">
      	  <a href=""><img alt="logo" src="${root }/resources/images/android@2x.png" width="200" height="150"></a>   	  
       	  <label>${teamName}</label>
       	  </div>
       	  <br/><br/>  	
          <h2 class="sub-header">MEMBER LIST</h2>
          
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>번호</th>
                  <th>이름</th>
                  <th>생년월일</th>
                  <th>지역</th>
                  <th>이메일</th>
                  <th>전화번호</th>
                  <th>성별</th>
                </tr>               
              </thead>
              <tbody>
              	<c:forEach var="member" items="${teamMemberList}">
					<tr>
						<td>${member.rnum}</td>
						<td>${member.memberName}</td>
						<td>${member.memberBirth}</td>
						<td>${member.memberRegion}</td>
						<td>${member.memberEmail}</td>
						<td>${member.memberPhone}</td>
						<td>${member.memberGender}</td>
				    </tr>
				</c:forEach>
             </tbody>
            </table>               
          </div>        
      </div>        
      </div> 	
		<div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right">
           
            <div class="form-group">
              <input type="text" placeholder="검색어를 입력하세요" class="form-control">
            </div>
              <button type="submit" class="btn btn-success">Sign in</button>
          </form>
        </div>
    <div align="center">
    
    <c:if test="${startBlock>blockSize}">
		<a href="${root }/teamPage/teamMemberInfo.do?teamName=${teamName}&currentPage=${startBlock-blockSize}">[이전]</a>
	</c:if>
	
	<c:if test="${endBlock>blockCount}">
		<c:set var="endBlock" value="${blockCount}"></c:set>
	</c:if>
	
	<c:forEach var="blockNumber" begin="${startBlock}" end="${endBlock}">
		<a href="${root }/teamPage/teamMemberInfo.do?teamName=${teamName}&currentPage=${blockNumber}">[${blockNumber}]</a>
	</c:forEach>
	
	<c:if test="${endBlock<blockCount}">
		<a href="${root }/teamPage/teamMemberInfo.do?teamName=${teamName}&currentPage=${startBlock+blockSize}">[다음]</a>
	</c:if>
	
	</div>
  </body>
</html>