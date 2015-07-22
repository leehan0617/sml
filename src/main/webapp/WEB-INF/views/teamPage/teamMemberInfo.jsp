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
  	<script src="${root }/js/member/member.js"></script>  	
    
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  </head>
  <body>
      <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">        
          <a class="navbar-brand" href="${root}/team/teamMain.do?teamName=${teamName}">SML Korea</a>
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
	        <c:if test="${teamGrade != null }">
			  <li><a href="${root }/team/teamMain.do?teamName=${teamName}">메인</a></li>
			  <li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${teamName}">팀 공지사항</a></li>		      
		      <li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${teamName}">팀 기록</a></li>
		      <li><a href="${root }/teamPage/teamScheduleEdit.do?teamName=${teamName}">팀 스케쥴</a></li>
			</c:if>            
          </ul>         
        </div>
      </div>
    </nav>
	
	 <br/><br/><br/><br/>
     <div class="container-fluid" style="background:url(${root}/resources/images/backGroundImage.jpg)">
       <span class="col-xs-2"><a href="${root}/team/teamMain.do?teamName=${teamName}"><img class="img-circle img-responsive" alt="logo" src="${root}/img/teamImg/${emblem}" width="200" height="150"></img></a></span>
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
                  <th><span class="glyphicon glyphicon-user">이름</span></th>
                  <th><span class="glyphicon glyphicon-calendar">생년월일</span></th>
                  <th><span class="glyphicon glyphicon-home">지역</span></th>
                  <th><span class="glyphicon glyphicon-tag">이메일</span></th>
                  <th><span class="glyphicon glyphicon-earphone">전화번호</span></th>
                  <th><span class="glyphicon glyphicon-heart">성별</span></th>
                </tr>               
              </thead>
              </c:if>
           <tbody>
              
            <c:if test="${count==0}">	
			  <tr>
			   <td align="center">멤버가 존재하지 않습니다.</td>
			  </tr>		
			</c:if>
			<c:choose>
			<c:when test="${teamGrade!=null}">
            <c:forEach var="member" items="${teamMemberList}">
			  <tr>
				<td>${member.rnum}</td>
				<td>${member.memberName}</td>
				<td>${member.memberBirth}</td>
				<td>${member.memberRegion}</td>
				<td>${member.memberEmail}</td>
				<td>${member.memberPhone}</td>
				<td>${member.memberGender}</td>
				<td><button class="btn btn-success" onclick="return deleteMember('${root}','${pageNumber}','${member.memberCode}','${teamName}','${teamCode}','${teamGrade}');"><span class="glyphicon glyphicon-trash">삭제</span></button></td>			
				
			  </tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
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
			</c:otherwise>
			</c:choose>
             </tbody>
            </table>               
          </div> 
                 
      </div>        
      </div> 	
		<div id="navbar" class="navbar-collapse collapse">			 
          <form class="navbar-form navbar-right" action="${root}/teamPage/searchMember.do" method="GET">
           
            <div class="form-group">
              <input type="text" placeholder="검색어를 입력하세요" class="form-control" name="searchBoxName">
              <input type="hidden" name="currentPage" value="${currentPage}">
              <input type="hidden" name="teamName" value="${teamName}">			 
			  <input type="hidden" name="teamGrade" value="${teamGrade}">
			  <input type="hidden" name="teamCode" value="${teamCode}">
            </div>             
             <button class="btn btn-success" type="submit"><span class="glyphicon glyphicon-search"></span></button>           	
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
			
			<c:if test="${count>0&&searchBoxName==null}">
			<ul class="pager">
			<c:if test="${startPage>pageBlock }">
				<li><a href="${root }/teamPage/teamMemberInfo.do?pageNumber=${startPage-pageBlock}&teamName=${teamName}&teamCode=${teamCode}&teamGrade=${teamGrade}">BACK</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li><a href="${root }/teamPage/teamMemberInfo.do?pageNumber=${i}&teamName=${teamName}&teamCode=${teamCode}&teamGrade=${teamGrade}">${i }</a></li>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<li><a href="${root }/teamPage/teamMemberInfo.do?pageNumber=${startPage+pageBlock}&teamName=${teamName}&teamCode=${teamCode}&teamGrade=${teamGrade}">NEXT</a></li>
			</c:if>
			</ul>
			</c:if>
			
			<c:if test="${count>0&&searchBoxName!=null}">
			<ul class="pager">
			<c:if test="${startPage>pageBlock }">
				<li><a href="${root }/teamPage/searchMember.do?pageNumber=${startPage-pageBlock}&teamName=${teamName}&teamCode=${teamCode}&teamGrade=${teamGrade}&searchBoxName=${searchBoxName}">BACK</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li><a href="${root }/teamPage/searchMember.do?pageNumber=${i}&teamName=${teamName}&teamCode=${teamCode}&teamGrade=${teamGrade}&searchBoxName=${searchBoxName}">${i }</a></li>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<li><a href="${root }/teamPage/searchMember.do?pageNumber=${startPage+pageBlock}&teamName=${teamName}&teamCode=${teamCode}&teamGrade=${teamGrade}&searchBoxName=${searchBoxName}">NEXT</a></li>
			</c:if>
			</ul>
			</c:if>
		</c:if>
	<br/><br/><br/>	
	</div>
	
	<div class="container">  		
  	<form role="form" action="${root}/teamPage/addMember.do" method="post">  		
  		<c:if test="${teamGrade!=null}">
  		<h2>멤버 등록</h2>
  		<p>등록하실 멤의 정보를 입력해주세요.</p>	
			
   		<div class="form-group">
      		<label for="usr">NAME</label>
       		<input placeholder="이름" type="text" class="form-control" name="memberName">
    	</div>
	    <div class="form-group">
      		<label for="usr">BIRTH</label>
       		<input type="date" class="form-control" placeholder="생일을 선택해주세요" name="memberBirth" />
    	</div>
    	
    	<div class="form-group">
		  <label for="sel1">REGION</label>
		  <select class="form-control" id="sel1" name="memberRegion">		  	
		    <option>지역을선택하세요</option>
		    <option value="서울">서울</option>
		    <option value="경기/인천">경기/인천</option>
		    <option value="경상도">경상도</option>	
		    <option value="전라도">전라도</option>	
		    <option value="충청도">충청도</option>	
		    <option value="강원도">강원도</option>		    
		    <option value="제주">부산</option>	    
		  </select>
		</div>    	
    		<div class="form-group">
      		<label for="usr">PHONE</label>
       		<input placeholder="번호" type="text" class="form-control" name="memberPhone">
    	</div>
    		<div class="form-group">
      		<label for="usr">E-MAIL</label>
       		<input placeholder="이메일" type="text" class="form-control" name="memberEmail">
    	</div>
    	
    	<div class="form-group">
		  <label for="sel1">성별:</label>
		  <select class="form-control" id="sel1" name="memberGender">		  	
		    <option value="남">남</option>
		    <option value="여">여</option>		    
		  </select>
		</div>		
			<input type="hidden" name="teamName" value="${teamName}">
			<input type="hidden" name="currentPage" value="${currentPage}">
			<input type="hidden" name="teamGrade" value="${teamGrade}">
		
			<input type="submit" class="btn btn-info" value="Submit">			
  		</c:if>
  	</form> 
  		<br/><br/>
  		<br/><br/>  		 	
  	</div>
		
		
	

   
  </body>
</html>