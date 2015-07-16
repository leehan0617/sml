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
    
    <title>teamRecord</title>
    
    
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
		      <li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}&teamCode=${team.teamCode}&teamGrade=${teamGrade}">멤버소개</a></li>
		      <li><a href="${root }/teamPage/teamScheduleEdit.do?teamName=${teamName}">팀 스케쥴</a></li>
			</c:if>            
          </ul>         
        </div>
      </div>
    </nav>
	
	 <br/><br/><br/><br/>
     <div class="container-fluid" style="background-color: gold; height: 100px; width: 100%;">
       <span class="col-xs-2"><a href=""><img alt="logo" src="${root }/resources/images/android@2x.png" width="200" height="150"></a></span>   	  
       <span class="col-xs-9" style="font-size:50pt;">${teamName}</span>
       <span class="col-xs-1" style="font-size:20pt"> ${allCount} 전  ${winCount} 승  ${lostCount} 패</span>
       </div>
       <br/><br/>
	
    <div class="container">    	
      <div class="row">      	   	
          <h2 class="sub-header">경기 기록</h2>          
          <div class="table-responsive">
            <table class="table table-striped">
              <c:if test="${count>0}">	
              <thead>
                <tr>
                  <th>경기번호</th>
                  <th>종목</th>
                  <th>게임종류</th>
                  <th>Home</th>
                  <th>VS</th>
                  <th>AWAY</th>
                  <th>결과</th>
                  <th>진행상황</th>
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
			  <tr>
				<td>${record.GAMECODE}</td>
				<td>${record.SPORTTYPE}</td>
				<td>${record.GAMETYPE}</td>
				<td>${record.TEAM1}</td>
				<td>VS<br/>${record.GAMEPLACE}<br/><fmt:formatDate value="${record.GAMEDATE}" pattern="MM-dd"/>&nbsp;&nbsp;${record.GAMETIME}</td>
				<td>${record.TEAM2}</td>
				<td>${record.GAMERESULT}</td>
				<td>${record.GAMESTATE}</td>								
			  </tr>
			</c:forEach>			
             </tbody>
            </table>               
          </div> 
                 
      </div>        
      </div> 	
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
		
		
	<%-- <h1>팀 기록실 </h1>
	<br/>
	<div>
		<span>게임</span>
		<span>TEAM A</span>
		<span>&nbsp;&nbsp;</span>
		<span>TEAM B</span>
		<span>RESULT</span>
		<span>PLACE</span>
		<span>STATE</span>
		<span>TYPE</span>
		<span>REFEREE</span>
	</div>
	<br/>
	<c:set var="count" value="${count}"></c:set>
	<c:set var="boardSize" value="${boardSize}"></c:set>
	<c:set var="blockSize" value="${blockSize}"></c:set>
	<c:set var="blockCount" value="${blockCount}"></c:set>
	<fmt:parseNumber var="rs" value="${(currentPage-1)/blockSize}" integerOnly="true"></fmt:parseNumber>
	
	<c:set var="startBlock" value="${rs*blockSize+1 }"></c:set>
	<c:set var="endBlock" value="${startBlock+blockSize-1}"></c:set>
	
	<c:forEach var="record" items="${recordList}">
		<div>
			<span>${record.GAMECODE}</span>
			<c:if test="${record.TEAM1==teamName }">
				<span style="color:blue;">${record.TEAM1}</span>
			</c:if>
			<c:if test="${record.TEAM1!=teamName }">
				<span>${record.TEAM1}</span>
			</c:if>
			<span style="color:red;">VS</span>
			<c:if test="${record.TEAM2==teamName }">
				<span style="color:blue;">${record.TEAM2}</span>
			</c:if>
			<c:if test="${record.TEAM2!=teamName }">
				<span>${record.TEAM2}</span>
			</c:if>
			<span>${record.GAMERESULT}</span>
			<span>${record.GAMEPLACE}</span>
			<span>${record.GAMESTATE}</span>
			<span>${record.GAMETYPE}</span>
			<span>${record.REFEREENUMBER}</span>
		</div>
	</c:forEach>
	
	<c:if test="${startBlock>blockSize}">
		<a href="${root }/teamPage/viewTeamRecord.do?teamName=${teamName}&currentPage=${startBlock-blockSize}">[이전]</a>
	</c:if>
	
	<c:if test="${endBlock>blockCount}">
		<c:set var="endBlock" value="${blockCount}"></c:set>
	</c:if>
	
	<c:forEach var="blockNumber" begin="${startBlock}" end="${endBlock}">
		<a href="${root }/teamPage/viewTeamRecord.do?teamName=${teamName}&currentPage=${blockNumber}">[${blockNumber}]</a>
	</c:forEach>
	
	<c:if test="${endBlock<blockCount}">
		<a href="${root }/teamPage/viewTeamRecord.do?teamName=${teamName}&currentPage=${startBlock+blockSize}">[다음]</a>
	</c:if> --%>

   
  </body>
</html>