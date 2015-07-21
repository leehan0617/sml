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
    
    <title>팀 리스트</title>    
    

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
       	  
       <span class="col-xs-9" style="font-size:50pt;"><br/>SML KOREA</span>            
     </div>
       <br/><br/>
	
    <div class="container" style="background-color: ">    	
      <div class="row">      	   	
          <h2 class="sub-header">공지사항</h2>
          <br/>         
          <div class="table-responsive" style="background-color: ">
            <table class="table table-striped">
              <c:if test="${soccerBoardList!=null}">	
              <thead>               
               <tr align="center" style="background-color:#E2D6D6;"> 
               	  <td>작성자</td>              	                 
                  <td>제목</td>
                  <td>작성일</td>                                                                
               </tr>               
              </thead>
              </c:if>              
              <tbody id="accordion" class="panel-group panel panel-default" >
              	             
           	  <c:if test="${soccerBoardList==null}">	
			  <tr>
			   <td align="center">작성된 공지사항이 없습니다.</td>
			  </tr>		
			</c:if>
						     					
              <c:if test="${soccerBoardList!=null}">
           	  <c:forEach var="soccerBoardList" items="${soccerBoardList}">			         	 
			  <tr align="center" style="background-color:" id="#accordion">				
				<td width="10%" style="font-size:20px;"><span class="label label-danger glyphicon glyphicon-user">${soccerBoardList.boardWriter}</span></td>
				<td>
				 <div style="" class="panel-group" id="accordion">				  
    				<div class="panel panel-success">
     					 <div class="panel-heading">
        				<h4 class="panel-title">
         					 <a data-toggle="collapse" data-parent="#accordion" href="#${soccerBoardList.boardNumber}">${soccerBoardList.boardTitle}</a>
       				    </h4>
     				    </div>
     			    <div id="${soccerBoardList.boardNumber}" class="panel-collapse collapse">
        				<div class="panel-body">${soccerBoardList.boardContent}</div>
     			    </div>
                   </div>
                  </div>
               </td>
               <td width="10%"><span class="label label-info glyphicon glyphicon-calendar"><fmt:formatDate value="${soccerBoardList.boardDate}" type="date"/></span></td>
			  </tr>
			</c:forEach>			
		   </c:if>		   		
             </tbody>
            </table>               
          </div>                  
      </div>        
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
			
			<ul class="pager">
			<c:if test="${startPage>pageBlock }">
				<li><a href="${root }/soccer/soccerCommonBoardPage.do?pageNumber=${startPage-pageBlock}&sportCode=${sportCode}">BACK</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li><a href="${root }/soccer/soccerCommonBoardPage.do?pageNumber=${i}&sportCode=${sportCode}">${i }</a></li>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<li><a href="${root }/soccer/soccerCommonBoardPage.do?pageNumber=${startPage+pageBlock}&sportCode=${sportCode}">NEXT</a></li>
			</c:if>
			</ul>
					
		</c:if>
	<br/><br/><br/>		
	</div>     
  </body>
</html>

