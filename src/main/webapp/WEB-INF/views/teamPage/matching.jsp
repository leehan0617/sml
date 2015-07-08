<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매칭페이지</title>
</head>
<script src="${root }/js/jquery/jquery.js"></script>
<script src="${root }/js/teamPage/teamPage.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1442260e0c6af86974001269a7312e42&libraries=services"></script>
<link href="${root}/css/teamPage/matchingMap.css" type="text/css" rel="stylesheet"/>
<body>
	<div>
		<a href="${root}/mainPage.jsp"><img alt="logo" src=""></a>
		<a href="${root}/mainPage.jsp">SML Korea</a>
	</div>
	<br/><br/>

	<c:if test="${teamGrade != null }">
		<li>${teamId }님</li>
		<li><a href="${root }/teamPage/teamPageMain.do?teamName=${teamName}">메인</a></li>
		<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${teamName}">팀 공지사항</a></li>
		<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${teamName}">팀원소개</a></li>
		<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${teamName}">팀 기록</a></li>
		<li><a href="${root }/viewSchedule.do">팀 스케쥴</a></li>
		<li>----------</li>
		<li><a href="${root }/teamPage/manageTeamBoard.do?teamName=${teamName}">공지사항관리</a></li>
		<li><a href="${root }/teamPage/manageTeamMember.do?teamName=${teamName}">팀원관리</a></li>
		<li><a href="${root }/manageTeamSchedule.do">스케쥴관리</a></li>
		<li><a href="${root }/startMatching.do">매칭관리</a></li>
		<li>-----------</li>
		<li><a href="${root}/teamPage/logout.do?teamId='${teamId}'">로그아웃</a></li>
  	</c:if>
  	
  	<c:if test="${teamGrade == null }">
		<li><a href="${root }/teamPage/teamPageMain.do?teamName=${teamName}">메인</a></li>
		<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${teamName}">팀 공지사항</a></li>
		<li><a href="${root }/teamPage/teamMemberInfo.do?teamName=${teamName}">팀원소개</a></li>
		<li><a href="${root }/teamPage/viewTeamRecord.do?teamName=${teamName}">팀 기록</a></li>
		<li><a href="${root }/viewSchedule.do">팀 스케쥴</a></li>
	</c:if>
	
	<h3>matching(${teamName })</h3>
	<br/>
	<h1>Start Matching</h1>
	
	<c:if test="${matchingDto==null}">
	<h4>매칭 소개 >> 지역 설정 >> 기타 설정 >> 완료</h4>
	<form action="${root }/teamPage/searchMatching.do" name="matchingForm" method="POST" onsubmit="return matching(this,'${root}')"> 
		<input type="hidden" name="teamCode" value="${teamCode }"/>
		<input type="hidden" name="teamName" value="${teamName }">
		<input type="hidden" name="matchingLatlng">
		<div id="matchingIntro">
			이곳에 매칭에 관한 소개 및 설명을 작성
			매칭은<br/>
			어떻게<br/>
			할까요<br/>
			이렇게<br/>
			합니다<br/>
			아니면<br/>
			저렇게<br/>
			하도록<br/>
			할까요<br/>
			<input type="button" value="매칭시작" onclick="setting1('${homeGround}')"/>
			<input type="button" value="취소" onclick="javascript:location.href='${root}/teamPage/teamPageMain.do?teamName=${teamName}'">
		</div>

		
		<%--매칭시작 누르면 페이지 변경 --%>
		<div id="matchingSetting1">
			<h4>지역 설정 하기</h4>
			<h6>홈 구장 : ${homeGround }</h6>
			<div>
				홈 구장을 기준으로 매칭 가능한 거리를 설정합니다.
				(마우스 이동으로 거리 조절)
			</div>
			<div class="map_wrap">
			    <div id="map" style="width:90%;height:90%;position:relative;overflow:hidden; border:solid black 1px;"></div>
			
			    <div id="menu_wrap" class="bg_white">
			        
			        <hr>
			        	<ul id="placesList"></ul>
			        	<div id="pagination"></div>
			    	</div>
			</div>
				<div id="address"></div>
				
				
			<input name="matchingPlace" type="text" placeholder="경기장"/>
			<br/>
			<input name="matchingDistance" type="text" placeholder="매칭 거리" size="5"/>m
			<br/>
			<input id="drawingCircle" type="button" value="반경 설정"/>
			<input id="deleteCircle" type="button" value="반경 설정 취소"/>
			<br/><br/>
			<input type="button" value="다음" onclick="setting2()"/>
			<input type="button" value="취소" onclick="javascript:location.href='${root}/teamPage/teamPageMain.do?teamName=${teamName}'">
		</div>
		
		<%--다음 누르면 페이지변경 --%>
		<div id="matchingSetting2">
			<h3>희망 요일</h3>
				<input type="checkbox" name="day" value="월"><label>월</label>
				<input type="checkbox" name="day" value="화"><label>화</label>
				<input type="checkbox" name="day" value="수"><label>수</label>
				<input type="checkbox" name="day" value="목"><label>목</label>
				<input type="checkbox" name="day" value="금"><label>금</label>
				<input type="checkbox" name="day" value="토"><label>토</label>
				<input type="checkbox" name="day" value="일"><label>일</label>
			<input type="hidden" name="matchingDay">
			
			<h3>희망 경기시간</h3>
				<input type="checkbox" name="time" value="오전"><label>오전 (12시 이전)</label>
				<input type="checkbox" name="time" value="오후"><label>오후 (12시~ 7시)</label>
				<input type="checkbox" name="time" value="오전"><label>저녁 (7시 이후)</label>
			<input type="hidden" name="matchingTime"/>
			
			<h3>최대 검색거리</h3>
				<input type="text" name="matchingDistance" size="5" disabled="disabled"/>m
			<br/>
			<input id="searchMatching" type="submit" value="검색시작" />
			<input type="button" value="취소" onclick="javascript:location.href='${root}/teamPage/teamPageMain.do?teamName=${teamName}'">
		</div>
		
		<%--검색시작누르면 페이지변경 --%>
		<div id="matchingComplete">
			매칭 등록 완료!!
			<input type="button" value="확인!" />
		</div>
	</form>
	</c:if>
	
	<c:if test="${matchingDto!=null }">
		<h4>매칭 정보 </h4>
		<div><span>매칭 종목 :</span><span style="color:blue;">${matchingDto.matchingSport }</span></div>
		<div><span>매칭 거리 :</span><span style="color:blue;">${matchingDto.matchingDistance }</span></div>
		<div><span>매칭 시간 :</span><span style="color:blue;">${matchingDto.matchingTime }</span></div>
		<div><span>매칭 요일 :</span><span style="color:blue;">${matchingDto.matchingDay }</span></div>
		<div><span>매칭 장소 :</span><span style="color:blue;">${matchingDto.matchingPlace }</span></div>
		<div><span>매칭 상태 :</span><span style="color:blue;">${matchingDto.matchingState }</span></div>
		<div><span>매칭 위도, 경도 :</span><span style="color:blue;">${matchingDto.matchingLatlng }</span></div>
		<input type="button" value="매칭 시작" onclick="doSearching('${root}','${teamCode}')">
		<input type="button" value="매칭 취소" onclick="javascript:location.href='${root}/teamPage/deleteMatching.do?matchingCode=${matchingDto.matchingCode }&teamName=${teamName}'">
		<input id="teamState" type="button" value="매칭 대기중">
		<div id="result" style="display:none;"></div>
	</c:if>
</body>
</html>