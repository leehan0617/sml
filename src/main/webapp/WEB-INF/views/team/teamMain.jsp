<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:if test="${team!=null}">
	<c:set var="teamId" value="${teamId}" scope="session"/>
	<c:set var="teamGrade" value="${teamGrade }" scope="session"/>
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
	
	<!-- 정성남 댓글 스크립트 -->
	<script src="${root }/js/teamPage/teamLog.js"></script>
	<script src="${root }/js/teamPage/teamLogDelete.js"></script>
	<script src="${root }/js/teamPage/moreTeamLog.js"></script>
	
	
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
						<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}">팀원소개</a></li>
						<li><a href="${root }/teamPage/teamScheduleEdit.do?teamName=${teamName}">팀 스케쥴</a></li>
						<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${team.teamName}">팀 기록</a></li>
		
						<li class="divider"></li>
						<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${team.teamName}" data-toggle="modal" data-target="#modalBoard">공지사항관리</a></li>
						<li><a href="${root }/teamPage/manageTeamMember.do?teamName=${team.teamName}">팀원관리</a></li>
						<li><a href="${root }/teamPage/teamScheduleEdit.do?teamName=${teamName}">스케쥴관리</a></li>
						<li><a href="${root }/teamPage/matching.do?teamName=${team.teamName}">매칭관리</a></li>
						<li><a href="${root }/teamPage/manageTeamEmblem.do?teamName=${team.teamName}">팀 로고 관리</a></li>
						<li class="divider"></li>
						<li><a href="${root}/teamPage/logout.do?teamId='${teamId}'">로그아웃</a></li>
				  	</c:if>
				  	
				  	<c:if test="${teamGrade == null }">
						<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${team.teamName}" data-toggle="modal" data-target="#modalBoard">팀공지사항</a></li>
						<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}">팀원소개</a></li>
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
	  	<%@include file="../teamTemplate/teamBoardTemplate.jsp" %>
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
	
	<div class="row well">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="row">					
			<div class="col-md-2">
				<input type="text" class="form-control" name="nickName" id="replyNickName" placeholder="닉네임">
			</div>
			<div class="col-md-2">
				<input type="password" class="form-control" name="password" id="replyPassword" placeholder="암호">
			</div>
			<div class="col-md-8">
				<div class="input-group">
			      <input type="text" class="form-control" name="content" id="replyContent" placeholder="한줄 답글을써주세요.">
			      <span class="input-group-btn">
			        <button class="btn btn-default" type="button" id="addTeamLog" onclick="teamLog('${root}','${team.teamName}')">작성</button>
			      </span>
			    </div><!-- /input-group -->
			</div>
			</div>
		
			<br/>
			<div class="col-md-10">
				<hr/>
				<div class="row">
					<div class="col-md-2 alert alert-success" style="padding:10px;"><span>작성자</span></div>
					<div class="col-md-1"></div>
					<div class="col-md-7 alert alert-success" style="padding:10px;"><span>내용</span></div>
					<div class="col-md-2"></div>
				</div>
				<hr/>			
				
				<div id="container" class="container" style="display:none;">
					<div class="col-md-2 alert alert-warning" role="alert" style="padding:10px;">
						<span id="containerNickName"></span>
					</div>
					
					<div class="col-md-7 alert alert-info" role="alert" style="padding:10px;">
						<span id="containerContent"></span>
					</div>
					
					<div class="col-md-2">
						<a class="btn btn-danger" role="button">삭제</a>
					</div>
				</div>				
				
				${startRow}
				${endRow}				
				<c:forEach var="teamLogDtoList" items="${teamLogDtoList}" begin="0" end="${endRow}">					
					<div class="replyList row" id="${teamLogDtoList.replyCode}">
						<div class="col-md-2 alert alert-warning" role="alert" style="padding:10px;">							
							<span>${teamLogDtoList.replyNickName}</span>				
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-7 alert alert-info" role="alert" style="padding:10px;">							
							<span>${teamLogDtoList.replyContent}</span>
						</div>
						<div class="col-md-2">
							<c:if test="${teamGrade !=null }">
							<a class="btn btn-danger" href="javascript:teamLogDelete('${root}','${teamLogDtoList.replyCode}','${teamLogDtoList.replyPassword}')" role="button">삭제</a>
							<br/>
							</c:if>
						</div>			
					</div>				
				</c:forEach>
								   			
			</div>
		</div>
		<div class="col-md-1"></div>	  
	</div>
	
	<%-- <c:if test="${endPage<pageCount }">
				<a href="javascript:moreTeamLog('${root}','${pageNumber}','${team.teamName}')">댓글 ${count}개 더보기</a>				
	</c:if> --%>
		
	
	<c:if test="${team==null}">
	<div style="text-align:center;">
		<h1>SML KOREA</h1>
		<br/>
		<h6>해당 팀이 존재하지 않습니다.</h6>
	</div>
		
	</c:if>
	
	<!-- 페이지 번호 -->
	
	<div>
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
				<a href="javascript:moreTeamLog('${root}','${startPage-pageBlock}','${team.teamName}')">[이전]</a>
				<%-- <a href="${root }/team/teamMain.do?pageNumber=${startPage-pageBlock}&teamName=${teamName}">[이전]</a> --%>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="${root }/team/teamMain.do?pageNumber=${i}&teamName=${teamName}">[${i}]</a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<a href="${root }/team/teamMain.do?pageNumber=${startPage+pageBlock}&teamName=${teamName}">[다음]</a>
			</c:if>
		</c:if>
	</div>
	
	
	<a href="javascript:moreTeamLog('${root}','${endRow}','${team.teamName}')">댓글 ${count}개 더보기</a>
	
	 <div class="sign" id="sign"></div>
	 <div class="modal fade" id="modalBoard" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">      
		    </div>
		  </div>
	</div>
</body>
</html>
