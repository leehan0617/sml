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
          <a class="navbar-brand" href="${root}/team/teamMain.do">SML Korea</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
          	<c:choose>
          	<c:when test="${teamName == null }">
            	<li><a href="${root}/teamPage/login.do">LogIn</a></li>
            </c:when>
            <c:otherwise>
	        	<li><a href="${root }/teamPage/logout.do">로그아웃</a></li>
	        </c:otherwise>
	        </c:choose>
            <li><a href="#">이동페이지</a></li>
            <li><a href="#">이동페이지</a></li>
            <li><a href="#">이동페이지</a></li>
          </ul>
         
        </div>
      </div>
    </nav>
	
	 <br/><br/><br/><br/>
     <div class="container-fluid" style="background-color: gold; height: 100px; width: 100%;">
       <span class="col-xs-2"><a href=""><img alt="logo" src="${root }/resources/images/android@2x.png" width="200" height="150"></a></span>   	  
       <span class="col-xs-9" style="font-size:50pt;">${teamName}</span>
       <span class="col-xs-1" style="font-size:20pt"> 총원:${count}</span>
       </div>
       <br/><br/>
	
    <div class="container">    	
      <div class="row">      	   	
          <h2 class="sub-header">MEMBER LIST</h2>          
          <div class="table-responsive">
            <table class="table table-striped">
              <c:if test="${count>0}">	
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
              </c:if>
              <tbody>
              
            <c:if test="${count==0}">	
			  <tr>
			   <td align="center">멤버가 존재하지 않습니다.</td>
			  </tr>		
			</c:if>
			
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
 
		<c:if test="${count>0 }">
			<c:set var="pageBlock" value="${5}"/>
			<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/>
			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
			
			<c:set var="startPage" value="${rs*pageBlock+1 }"/>
			<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
			
			<c:if test="${endPage>pageCount }">
				<c:set var="endPage" value="${pageCount }"/>
			</c:if>
			
			<c:if test="${startPage>pageBlock }">
				<a href="${root }/teamPage/teamMemberInfo.do?pageNumber=${startPage-pageBlock}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="${root }/teamPage/teamMemberInfo.do?pageNumber=${i}">[${i }]</a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<a href="${root }/teamPage/teamMemberInfo.do?pageNumber=${startPage+pageBlock}">[다음]</a>
			</c:if>
		</c:if>
	
	
	</div>
  </body>
</html>