<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:if test="${team!=null}">
	<c:set var="teamId" value="${teamId}" scope="session"/>
	<c:set var="teamGrade" value="${teamGrade}" scope="session"/>
	<c:set var="teamName" value="${teamName }" scope="session"/>
</c:if>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title><c:out value="${teamName }"/> 페이지</title>
	
	<link rel="stylesheet" type="text/css" href="${root }/resources/css/bootstrap.css"/>
	<script src="${root }/resources/js/jquery.js"></script>
	<script src="${root }/resources/js/bootstrap.js"></script>
	<script src="${root }/resources/js/teamMain.js"></script>
	
	<!-- before matching.jsp js/css -->
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1442260e0c6af86974001269a7312e42&libraries=services"></script>
	<link href="${root}/css/teamPage/matchingMap.css" type="text/css" rel="stylesheet"/>
	<script src="${root }/js/teamPage/teamPage.js"></script>
	
	<style>
		.modal.modal-wide .modal-dialog {
		  width: 90%;
		}
		.modal-wide .modal-body {
		  overflow-y: auto;
		}
		
		/* irrelevant styling */
		body { text-align: center; }
		body p { 
		  max-width: 350px; 
		  margin: 20px auto; 
		}
		#tallModal .modal-body p { margin-bottom: 900px }
	</style>
	
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
						<li><a data-toggle="modal" data-target="#modalTeamBoard" onclick="getTeamBoardData('${root}','${teamName}')">팀공지사항</a></li>
						<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}&teamCode=${team.teamCode}&teamGrade=${teamGrade}">팀원소개</a></li>
						<li><a href="${root }/teamPage/teamScheduleEdit.do?teamName=${teamName}">팀 스케쥴</a></li>
						<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${team.teamName}&teamCode=${team.teamCode}&teamGrade=${teamGrade}">팀 기록</a></li>
						<li><a href="${root }/teamPage/viewLeagueInfo.do?teamName=${team.teamName}">참가 중인 리그 정보</a></li>
		
						<li class="divider"></li>
						<li><a data-toggle="modal" data-target="#modalTeamBoard" onclick="getTeamBoardData('${root}','${teamName}')">팀공지사항</a></li>						
						<li><a href="${root }/teamPage/teamScheduleEdit.do?teamName=${teamName}">스케쥴관리</a></li>
						<li><a data-toggle="modal" data-target="#popupMatching" href="${root }/teamPage/matching.do?teamName=${team.teamName}">매칭관리</a></li>
						<li><a href="${root }/teamPage/manageTeamEmblem.do?teamName=${team.teamName}">팀 로고 관리</a></li>
						<li class="divider"></li>
						<li><a href="${root}/teamPage/logout.do?teamId='${teamId}'">로그아웃</a></li>
				  	</c:if>
				  	
				  	<c:if test="${teamGrade == null }">
						<li><a data-toggle="modal" data-target="#modalTeamBoard" onclick="getTeamBoardData('${root}','${teamName}')">팀공지사항</a></li>
						<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}&teamCode=${team.teamCode}">팀원소개</a></li>
						<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${team.teamName}">팀 기록</a></li>
						<li><a href="${root }/teamPage/teamScheduleEdit.do?teamName=${teamName}">팀 스케쥴</a></li>
					</c:if>
					
					
				  </ul>
				  
				</div>
	  	   </div>
	</div>
	
	<br/><br/>
	 
	 
	 <div class="row well">
	  <div class="col-md-1"></div>
	  <div class="col-md-3">
	    <a href="${root}/team/teamMain.do?teamName=${teamName}">
	    <img alt="로고이미지" class="img-circle img-responsive" alt="logo" src="${root}/resources/images/${emblem}.jpg" width="200" height="150"></img>
	    </a>	  	
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
	  <div class="col-md-10 well">
	  	<div class="jumbotron">
  			<h2>vs112</h2>
  			<c:choose>
  				<c:when test="${team.teamIntro !=null }">
  					<p id="teamIntro">${team.teamIntro }</p>
  				</c:when>
  				<c:otherwise>
  					<p id="teamIntro">작성된 팀소개가 없습니다.</p>
  				</c:otherwise>
  			</c:choose>
  			<c:if test="${teamGrade !=null }">
  			<p><a class="btn btn-primary btn-lg" role="button" data-toggle="modal" data-target="#modalEditTeamIntro">팀소개 편집하기</a></p>
  			</c:if>
		</div>
	  </div>
	  <div class="col-md-1"></div>
	</div>
	
	<br/>
	
	<div class="row well">
	  <div class="col-md-1"></div>
	  
	  <div class="col-md-4 well">
	  	<div class="row">
	  		<div class="col-xs-6 col-md-3">
    			<a href="#" class="thumbnail">
      				<img src="${root }/resources/images/android@2x.png" alt="...">
    			</a>
  			</div>
		</div>
	  </div>
	  <div class="col-md-2 well"><h3>vs</h3></div>
	  <div class="col-md-4 well">
	  	<div class="row">
	  		<div class="col-xs-6 col-md-3">
    			<a href="#" class="thumbnail">
      				<img src="${root }/resources/images/mapboxjs@2x.png" alt="...">
    			</a>
  			</div>
	  	</div>
	  </div>
	  <div class="col-md-1"></div>
	</div>
	
	<div class="row well">
	  <div class="col-md-1"></div>
	  <div class="col-md-5 well">
	  	<h3>팀 공지사항</h3><hr/>
	  	<a data-toggle="modal" data-target="#modalTeamBoard" onclick="getTeamBoardData('${root}','${teamName}')" style="color:black;">
	  		<%@include file="../teamTemplate/teamBoardTemplate.jsp" %>
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
	  	<br/><br/>
	  	<div><span>팀 A</span><span> VS </span><span>팀 B</span><span> 결과 </span></div>
	  	<br/>
	  	<c:forEach var="record" items="${recordList }" begin="1" end="5">
	  		<div>
	  			<span>${record.EMBLEM1 }</span>
	  			<span style="font-weight: bold;">${record.TEAMNAME1 }</span>
	  			<span style="color:red;">VS</span>
	  			<span>${record.EMBLEM2 }</span>
	  			<span style="font-weight: bold;">${record.TEAMNAME2 }</span>
	  			<span>${record.GAMERESULT }</span>
	  		</div>
	  	</c:forEach>
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
	  		<img style="width:500px; height:400px;" src="${root }/img/leagueImg/${leagueDto.leagueImage} "/>
	  		<br/>
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
        <button type="button" class="btn btn-primary" data-dismiss="modal"onclick="modalWriteTeamBoard('${root}','${teamName}','${team.teamCode }')">글쓰기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="modalEditTeamIntro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">팀소개 편집하기.</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="message-text" class="control-label" id="boardContent">팀소개를 적어주세요.</label>
            <textarea class="form-control" id="teamIntroContent"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="editTeamIntro('${root}','${teamName}','${team.teamCode }')">편집완료</button>
      </div>
    </div>
  </div>
</div>

<div class="modal modal-wide fade" id="popupMatching">
	<div class="modal-dialog">
    	<div class="modal-content">
    	</div>
    </div>
</div>

<script>

	function editTeamIntro(root , teamName , teamCode){
		var teamIntro = $("#teamIntroContent").val();
		var addr = root+"/editTeamIntro?teamName="+teamName+"&teamCode="+teamCode+"&teamIntro="+teamIntro;
		
		$.ajax({
			type:"get",
			url:addr,
			success:function(data){
				$("#teamIntro").text(data.teamIntro);
				$("#teamIntroContent").val("");
			}
		});
	}
</script>

</body>
</html>


