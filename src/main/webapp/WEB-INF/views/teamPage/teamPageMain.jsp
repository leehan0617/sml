<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>팀페이지</title>
<script src="${root }/js/jquery/jquery.js"></script>
<script src="${root }/js/jquery/jquery-ui.js"></script>
<script src="${root }/js/teamPage/teamPage.js"></script>
<script src="${root }/js/teamPage/teamLog.js"></script>
<script src="${root }/js/teamPage/teamLogDelete.js"></script>
</head>
<body>
	<c:if test="${team!=null}">
		<c:set var="teamId" value="${teamId}" scope="session"/>
		<c:set var="teamGrade" value="${teamGrade }" scope="session"/>
		<c:set var="teamName" value="${teamName }" scope="session"/>
		
	</c:if>
	
	<div>
		<a href="${root}/mainPage.jsp"><img alt="logo" src=""></a>
		<a href="${root}/mainPage.jsp">SML Korea</a>
	</div>
	
	<c:if test="${team==null}">
	<div style="text-align:center;">
		<h1>SML KOREA</h1>
		<br/>
		<h6>해당 팀이 존재하지 않습니다.</h6>
	</div>
		
	</c:if>
	
	<c:if test="${team!=null}">
	<div>
		SML KOREA 
		<ul>
			<c:if test="${teamGrade != null }">
				<li>${teamId }님</li>
				<li><a href="${root }/teamPage/teamPageMain.do?teamName=${team.teamName}">메인</a></li>
				<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${team.teamName}">팀 공지사항</a></li>
				<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}">팀원소개</a></li>
				<li><a href="${root }/teamPage/teamSchedule.do?teamName=${team.teamName}">팀 스케쥴</a></li>
				<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${team.teamName}">팀 기록</a></li>

				<li>----------</li>
				<li><a href="${root }/teamPage/manageTeamBoard.do?teamName=${team.teamName}">공지사항관리</a></li>
				<li><a href="${root }/teamPage/manageTeamMember.do?teamName=${team.teamName}">팀원관리</a></li>
				<li><a href="${root }/teamPage/teamScheduleEdit.do">스케쥴관리</a></li>
				<li><a href="${root }/teamPage/matching.do?teamName=${team.teamName}">매칭관리</a></li>
				<li><a href="${root }/teamPage/manageTeamEmblem.do?teamName=${team.teamName}">팀 로고 관리</a></li>
				<li>-----------</li>
				<li><a href="${root}/teamPage/logout.do?teamId='${teamId}'">로그아웃</a></li>
		  	</c:if>
		  	
		  	<c:if test="${teamGrade == null }">
				<li><a href="${root }/teamPage/teamPageMain.do?teamName=${team.teamName}">메인</a></li>
				<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${team.teamName}">팀 공지사항</a></li>
				<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${team.teamName}">팀원소개</a></li>
				<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${team.teamName}">팀 기록</a></li>
				<li><a href="${root }/viewSchedule.do">팀 스케쥴</a></li>
			</c:if>

		</ul>
	</div>
	
	<div>
		<img alt="팀 로고 이미지 넣어야함" src="${root }/img/teamImg/${team.emblem}"/>
		<h3>팀 이름 : ${team.teamName}</h3>
		<input id="teamState" style="color: gray;"type="button" value="매칭 대기 중">
	</div>
	
	<div>
		팀소개 넣는칸
	</div>
	
	<div>
		공지사항 넣는칸
		<h3>공지사항</h3>
		<c:if test="${ teamBoardList==null}">
			공지사항 없음
		</c:if>
		
		<c:if test="${teamBoardList!=null }">
			<a href="${root }/teamPage/viewTeamBoard.do?teamName=${team.teamName}">more</a>
			<c:forEach var="board" items="${teamBoardList}">
				<div>
					<span>${board.boardDate}</span>
					<span><a href="#"
						onclick="window.open('${root }/teamPage/readTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}&boardNumber=${board.boardNumber}', '공지사항','width=400, height=200');return false;" target="_blank">${board.boardTitle}</a>
					</span>
				</div>
			</c:forEach>
		</c:if>
		<br/><br/>
	</div>
	
	<div>
		달력 넣는칸
	</div>
	
	<div>
		<div>
			기록실 넣는칸
			기록실 넣는칸
			
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
			<br/><br/><br/>
		</div>
		
		<div>
			자기팀에관한 정보 넣는칸
		</div>
	</div>
	
	<h3>한줄댓글 작성</h3>
		
		<div>
			<label>닉네임</label> 
			
			<input type="text" id="replyNickName"/>
			<label>비밀번호</label> 
			<input type="password" id="replyPassword"/>
			
			<input type="text" placeholder="한마디 남겨주세요" id="replyContent"/>
						
			<input type="button" value="작성" id="addTeamLog" onclick="teamLog('${root}','${team.teamName}')"/> 
		</div>		
			
		
		<h3>LIST</h3>
		<span>작성자</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>내용</span>
		
		<c:forEach var="teamLogDtoList" items="${teamLogDtoList}">
			
			<div class="replyList" id="${teamLogDtoList.replyCode}">
				<span>${teamLogDtoList.replyNickName}</span>
				<input type="text" value="${teamLogDtoList.replyContent}" disabled="disabled"></input>				
				<a href="javascript:teamLogDelete('${root}','${teamLogDtoList.replyCode}','${teamLogDtoList.replyPassword}')">삭제</a>
				<br/>			
			</div>		
			
   		</c:forEach>
		</c:if>	
</body>
</html>
