<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:if test="${team!=null}">
	<c:set var="teamId" value="${teamId}" scope="session"/>
	<c:set var="teamGrade" value="${teamGrade }" scope="session"/>
	<c:set var="teamName" value="${teamName }" scope="session"/>
	<c:set var="teamDto" value="${teamDto }"/>
</c:if>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><c:out value="${teamName }"/> 페이지</title>
	<link rel="stylesheet" type="text/css" href="${root }/resources/css/bootstrap.css"/>
	
	<script src="${root }/resources/js/jquery.js"></script>
	<script src="${root }/resources/js/bootstrap.js"></script>
	
	<script src="${root }/resources/js/teamMain.js"></script>
	
</head>
<body>
	<div class="row">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-3"><h3><strong><a href="${root}/start.jsp">SML KOREA</a></strong></h3></div>
	  		<div class="col-md-4"></div>
	  		<div class="col-md-2"></div>
	  		<div class="col-md-2">
	  			<div class="btn-group"><br/>
				  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
				    빠른이동<span class="caret"></span>
				  </button>
				  <ul class="dropdown-menu" role="menu">
			    	  <c:if test="${teamGrade != null }">	    
						<li><a href="${root }/member/myInfoPage.do?teamName=${teamName }">${teamId }님</a></li>
						<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${team.teamName}" data-toggle="modal" data-target="#modalBoard">팀공지사항</a></li>
						<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}&teamCode=${team.teamCode}&teamGrade=${teamGrade}">팀원소개</a></li>
						<li><a href="${root }/teamPage/teamScheduleEdit.do?teamName=${teamName}">팀 스케쥴</a></li>
						<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${team.teamName}">팀 기록</a></li>
		
						<li class="divider"></li>
						<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${team.teamName}" data-toggle="modal" data-target="#modalBoard">공지사항관리</a></li>
						<li><a href="${root }/teamPage/manageTeamMember.do?teamName=${team.teamName}&teamCode=${team.teamCode}&teamGrade=${teamGrade}">팀원관리</a></li>
						<li><a href="${root }/teamPage/teamScheduleEdit.do?teamName=${teamName}">스케쥴관리</a></li>
						<li><a href="${root }/teamPage/matching.do?teamName=${team.teamName}">매칭관리</a></li>
						<li><a href="${root }/teamPage/manageTeamEmblem.do?teamName=${team.teamName}">팀 로고 관리</a></li>
						<li class="divider"></li>
						<li><a href="${root}/teamPage/logout.do?teamId='${teamId}'">로그아웃</a></li>
				  	</c:if>
				  	
				  	<c:if test="${teamGrade == null }">
						<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${team.teamName}" data-toggle="modal" data-target="#modalBoard">팀공지사항</a></li>
						<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}&teamCode=${team.teamCode}">팀원소개</a></li>
						<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${team.teamName}">팀 기록</a></li>
						<li><a href="${root }/teamPage/teamScheduleEdit.do?teamName=${teamName}">팀 스케쥴</a></li>
					</c:if>
					
					<li><a data-toggle="modal" data-target="#modalTeamBoard" onclick="getTeamBoardData('${root}','${teamName}')">팀공지사항 JSON</a></li>
					<li>${teamDto.teamLeaderName }</li>
				  </ul>
				  
				</div>
	  	   </div>
	</div>
	
	<br/><br/>
	 
	 
	 <div class="row well">
	  <div class="col-md-1"></div>
	  <div class="col-md-3">
	  	<img src="${root }/resources/images/android@2x.png" alt="로고이미지" class="img-circle img-responsive">
	  </div>
	  <div class="col-md-4">
	  	<br/><br/><br/><br/><br/><br/>
		<h3>${team.teamName}
				
		</h3>
	  </div>
	  <div class="col-md-1"></div>
	  <div class="col-md-3">
	  	<br/><br/><br/><br/><br/><br/><br/>
	  	<input id="teamState" type="button" class="btn btn-warning" value="매칭 대기 중">
	  </div>
	</div>
	
	<br/>
	
	<div class="row well">
	  <div class="col-md-1"></div>
	  <div class="col-md-10 well">안녕하세요 SML UNITED는 테스트 페이지 팀소개 입니다.</div>
	  <div class="col-md-1"></div>
	</div>
	
	<br/>
	
	<div class="row well">
	  <div class="col-md-1"></div>
	  <div class="col-md-10 well">진행중인 경기 넣어야</div>
	  <div class="col-md-1"></div>
	</div>
	
	<div class="row well">
	  <div class="col-md-1"></div>
	  <div class="col-md-5 well">
	  	<a href="${root }/teamPage/viewTeamBoard.do?teamName=${team.teamName}" data-toggle="modal" data-target="#modalBoard">
	  	
	  	<%-- <%@include file="../teamTemplate/teamBoardTemplate.jsp" %>--%>
	  	</a>
	  </div>
	  <div class="col-md-5 well">
	  	<%@include file="../teamTemplate/scheduleTemplate.jsp" %> 
	  </div>
	  <div class="col-md-1"></div>
	</div>
	
	<div class="row well">
	  <div class="col-md-1"></div>
	  <div class="col-md-5 well">
	  	기록실
	  </div>
	  <div class="col-md-5 well">
	  	팀 전적정보 
	  	<br/>
	  	<img src="${root }/img/teamImg/${team.emblem}/" alt="팀 엠블럼">
	  	팀명 : ${team.teamName }
	  	
	  	<c:if test="${leagueDto==null }">
	  		<label>참가중 리그 없음</label>
	  	</c:if>
	  	<br/>
	  	
	  	<c:if test="${leagueDto!=null }">
	  		<label>진행중인 리그</label>
	  		<br/>
	  		<img src="${root }/img/leagueImg/${leagueDto.leagueImage} "/>
	  		리그명 : ${leagueDto.leagueName }
	  	</c:if>
	  	
	  </div>
	  <div class="col-md-1"></div>
	</div>
	
	<!-- 댓글부분 -->
	<input type="hidden" id="replyTeamCode" value="${team.teamCode }"/>
	<div class="row well">
		<div class="col-md-1"></div>
		<div class="col-md-10 replyWrap">
			<div class="row">
  				<div class="col-md-3">
   					 <div class="input-group">
     					 <span class="input-group-btn">
        					<button class="btn btn-default" type="button" disabled="disabled">닉네임</button>
      					</span>
      					<input type="text" class="form-control" placeholder="닉네임을 적어주세요." id="replyNickName">
    				 </div><!-- /input-group -->
  				</div>
  				<div class="col-md-3">
  					 <div class="input-group">
     					 <span class="input-group-btn">
        					<button class="btn btn-default" type="button" disabled="disabled">비밀번호</button>
      					</span>
      					<input type="password" class="form-control" placeholder="비밀번호를 적어주세요." id="replyPassword">
    				 </div><!-- /input-group -->
  				</div>
 				 <div class="col-md-6">
   					 <div class="input-group">
    					  <input type="text" class="form-control" placeholder="내용을 적어주세요." id="replyContent">
					      <span class="input-group-btn">
					        <button class="btn btn-default" type="button" onclick="writeReply('${root}','${teamName }')">한마디 남기기</button>
					      </span>
    				</div>
 				 </div>
			</div><!-- /.row -->
			<hr/>
			
			<div class="row replyList replyFirst">	
  				<c:forEach var="teamLog" items="${replyList}" begin="0" varStatus="status" end="4">
					<div class="col-md-3 ${teamLog.replyCode }">
						 <div class="input-group">
							 <span class="input-group-btn">
								<button class="btn btn-default" type="button" disabled="disabled">닉네임</button>
							</span>
							<input type="text" class="form-control" value="${teamLog.replyNickName }" id="replyNickName" disabled="disabled">
						 </div><!-- /input-group -->
					</div>
					<div class="col-md-3 ${teamLog.replyCode }">
						 <div class="input-group">
									 <span class="input-group-btn">
					  					<button class="btn btn-default" type="button" disabled="disabled">작성일</button>
										</span>
										<input type="text" class="form-control" value="<fmt:formatDate value="${teamLog.replyDate }" pattern="yy-MM-dd"/>" id="replyDate" disabled="disabled">
							 </div><!-- /input-group -->
					</div>
					<div class="col-md-6 ${teamLog.replyCode }">
						<div class="input-group">
							 <input type="text" class="form-control" value="${teamLog.replyContent }" id="replyContent" disabled="disabled">
					     <span class="input-group-btn">
					       	<button class="btn btn-danger" type="button" onclick="deleteReply('${root}','${team.teamCode }' , '${teamLog.replyCode}')">삭제</button>
					     </span>
						</div>
					</div>
				</c:forEach>

			</div><!-- /.row -->
			
			
			<div class="alert alert-warning" role="alert" onclick="moreReadReply('${root}','${team.teamCode }' , '${replyPageNumber }')"><p class="text-center">더보기</p></div>
		</div>
		<div class="col-md-1"></div>
	</div>
	
	
	
	<c:if test="${team==null}">
	<div style="text-align:center;">
		<h1>SML KOREA</h1>
		<br/>
		<h6>해당 팀이 존재하지 않습니다.</h6>
	</div>
		
	</c:if>
	
	<div class="modal fade" id="modalTeamBoard" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
 	 <div class="modal-dialog">
    	<div class="modal-content">
    		<div class="modal-header">
    			공지사항
    		</div>
    		<div class="modal-body">
    			<table class="table table-striped">
					<thead>
						<tr> 
							<th style="width:15%">글번호</th><th style="width:45%">제목</th><th style="width:15%">작성자</th><th style="width:25%">작성일</th> 
						</tr> 
					</thead>
					<tbody class="teamBoardTbody">
					</tbody>
				</table>
				<nav>
  					<ul class="pager">
  					</ul>
  				</nav>
    		</div>
      		<div class="modal-footer">
            	<button type="button" class="btn btn-default modalTeamBoardClose" data-dismiss="modal" onclick="emptyContent()">Close</button>
            	<c:if test="${teamGrade !=null }">
       			<button type="button" data-toggle='modal' data-target='#modalTeamBoardWrite' class="btn btn-primary" onclick="teamBoardToggle()">글쓰기</button>
       			</c:if>
      		</div>
  		</div>
     </div>
   </div>
   
   <div class="modal fade" id="modalTeamBoardRead" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">공지사항.</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label" id="boardTitle">Title</label>
            <input type="text" class="form-control" id="recipient-name" value="" disabled="disabled"/>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label" id="boardContent">Content</label>
            <textarea class="form-control" id="message-text" disabled="disabled"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="teamBoardToggle()">Close</button>
        <button type="button" class="btn btn-primary">수정하기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="modalTeamBoardWrite" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">공지사항 >> 글쓰기</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label" id="boardTitle">Title</label>
            <input type="text" class="form-control" id="teamBoardTitle"/>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label" id="boardContent">Content</label>
            <textarea class="form-control" id="teamBoardContent"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="teamBoardToggle()">Close</button>
        <button type="button" class="btn btn-primary" onclick="modalWriteTeamBoard('${root}','${teamName}','${teamCode }')">글쓰기</button>
      </div>
    </div>
  </div>
</div>

<script>
	function modalWriteTeamBoard(root,teamName,teamCode){
		teamBoardToggle();
		var title = $("#teamBoardTitle").val();
		var content = $("#teamBoardContent").val();
		var addr = root+"/writeTeamBoard?teamName="+teamName+"&teamCode="+teamCode;
	}
</script>

</body>
</html>


