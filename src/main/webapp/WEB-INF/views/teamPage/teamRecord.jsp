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
    
    <title>${teamName}의 리그기록</title>    
    

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
			</c:if>            
          </ul>         
        </div>
      </div>
    </nav>
	
	 <br/><br/><br/><br/>
     <div class="container-fluid" style="background:url(${root}/resources/images/backgroundMain2.jpg)">
       <div align="center">
       <span class=""><a href="${root}/team/teamMain.do?teamName=${teamName}"><img class="img-circle img-responsive" alt="logo" src="${root}/img/teamImg/${emblem}" width="150" height="150"></img></a></span>
       </div>
       <div align="center" style="padding-top:10px;">
       <span class="label label-danger" style="font-size:20pt;">${teamName}</span>
       </div>             
     </div>
      <hr style="border: solid 2px ;"> 
	
    <div class="container" style="background-color: ">    	
      <div class="row">      	   	
          <h2 class="sub-header">경기 기록</h2>
          <div id="navbar" class="navbar-collapse collapse">			 
          <form class="navbar-form navbar-right" action="${root}/teamPage/searchRecord.do" method="GET">
           
            <div class="form-group">
              <input type="text" placeholder="검색어를 입력하세요" class="form-control" name="searchBoxName">
              <input type="hidden" name="currentPage" value="${currentPage}">
              <input type="hidden" name="teamName" value="${teamName}">
			  		  
            </div>             
             <button class="btn btn-success" type="submit"><span class="glyphicon glyphicon-search"></span></button>           	
          </form>
        </div>
          
          <br/>         
          <div class="table-responsive" style="background-color: ">
            <table class="table table-striped">
              <c:if test="${count>0}">	
              <thead>
               <%--  <tr align="center" style="background:url(${root}/resources/images/soccer_icon.jpg)"> --%>
               <tr align="center" style="background-color:#E2D6D6;">
                  <td>경기번호</td>
                  <td>종목</td>
                  <td>게임종류</td>
                  <td><span class="label label-primary">HOME</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;경기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="label label-danger">AWAY</span></td>                 
                  <td>결과</td>
                  <td>진행상황</td>                             
               </tr>               
              </thead>
              </c:if>
              
              <tbody>
              
           <c:if test="${count==0}">	
			  <tr>
			   <td align="center">멤버가 존재하지 않습니다.</td>
			  </tr>		
			</c:if>						
           <c:forEach var="record" items="${recordList}">           	 
			  <tr align="center">			
				<td style="font-size:20px;"><br/><br/><span>#${record.GAMECODE}</span></td>	
				<c:if test="${record.SPORTTYPE=='축구'}">		
				<td><br/><br/><img class="img-circle img-responsive" src="${root}/resources/images/soccerBallImg.jpg" width="50" height="60"></img><br/></td>
				</c:if>	
				
				<c:if test="${record.GAMETYPE==0}">
				<td><br/><br/><br/><span class="label label-primary" style="font-size:13pt;">친선경기</span></td>
				</c:if>
				<c:if test="${record.GAMETYPE!=0}">
				<td><br/><br/><br/><span class="label label-success" style="font-size:13pt;">리그경기</span></td>
				</c:if>
				<td>
				    <br/>				   
					<a href="${root}/team/teamMain.do?teamName=${record.TEAM1}"><img class="img-circle" src="${root}/img/teamImg/${record.EMBLEM1}" width="50" height="60"><img></a>
					<span>${record.TEAM1}</span>									
					<img src="${root}/resources/images/versusIcon.png" width="30" height="30"></img>&nbsp;
					<span>${record.TEAM2}</span>				
					<a href="${root}/team/teamMain.do?teamName=${record.TEAM2}"><img class="img-circle" src="${root}/img/teamImg/${record.EMBLEM2}" width="50" height="60"></img></a>&nbsp;
					<br/>			
					<br/>
					<span class="glyphicon glyphicon-calendar"> <fmt:formatDate value="${record.GAMEDATE}" pattern="MM-dd"/></span>&nbsp;&nbsp;
					<span class="glyphicon glyphicon-time">${record.GAMETIME}</span>					
					<br/>					
					<span class="glyphicon glyphicon-home">${record.GAMEPLACE}</span>
				</td>				
				<td style="font-size:20px; "><br/><br/><span class="label label-default">${record.GAMERESULT}</span></td>
				<c:if test="${record.TEAMRESULT=='승'&&record.TEAM1==teamName}">
					<td><br/><br/><br/><span style="color:green; font-weight: bold;">승리</span></td>
				</c:if>	
				<c:if test="${record.TEAMRESULT=='승'&&record.TEAM1!=teamName}">
					<td><br/><br/><br/><span style="color:red; font-weight: bold;">패배</span></td>
				</c:if>
				<c:if test="${record.TEAMRESULT=='패'&&record.TEAM1==teamName}">
					<td><br/><br/><br/><span style="color:red; font-weight: bold;">패배</span></td>
				</c:if>	
				<c:if test="${record.TEAMRESULT=='패'&&record.TEAM1!=teamName}">
					<td><br/><br/><br/><span style="color:green; font-weight: bold;">승리</span></td>
				</c:if>
				<c:if test="${record.TEAMRESULT=='무'}">
					<td><br/><br/><br/><span >무</span></td>
				</c:if>	
				<c:if test="${record.TEAMRESULT==null}">
					<td><br/><br/><br/><span >진행 중</span></td>
				</c:if>						
			  </tr>
			  
			</c:forEach>			
             </tbody>
            </table>               
          </div> 
                 
      </div>        
      </div> 	
		
    <div align="center">    
 			
		<c:if test="${count>0&&searchBoxName==null}">			
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
				<li><a href="${root }/teamPage/viewTeamRecord.do?pageNumber=${startPage-pageBlock}&teamName=${teamName}">BACK</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li><a href="${root }/teamPage/viewTeamRecord.do?pageNumber=${i}&teamName=${teamName}">${i }</a></li>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<li><a href="${root }/teamPage/viewTeamRecord.do?pageNumber=${startPage+pageBlock}&teamName=${teamName}">NEXT</a></li>
			</c:if>
			</ul>					
		</c:if>
		
		<c:if test="${count>0&&searchBoxName!=null}">		
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
				<li><a href="${root }/teamPage/searchRecord.do?pageNumber=${startPage-pageBlock}&teamName=${teamName}&searchBoxName=${searchBoxName}">BACK</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li><a href="${root }/teamPage/searchRecord.do?pageNumber=${i}&teamName=${teamName}&searchBoxName=${searchBoxName}">${i }</a></li>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<li><a href="${root }/teamPage/searchRecord.do?pageNumber=${startPage+pageBlock}&teamName=${teamName}&searchBoxName=${searchBoxName}">NEXT</a></li>
			</c:if>
			</ul>					
		</c:if>
	<br/><br/><br/>	
	</div>   
  </body>
</html>
