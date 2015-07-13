<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="${root}/js/jquery/jquery.js"></script>
	<script src="${root}/js/admin/admin.js"></script>
	<script src="${root}/js/external/jquery-1.11.3.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<!--
	
	
	  -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
	
	<title>팀목록보기</title>
	
	<script type="text/javascript">
	$(function() {
	    $( "#leagueStartDate" ).datepicker({
	    });
	    
	    $( "#leagueEndDate" ).datepicker({
	    });
	});
	</script>	
</head>
<body>	
	<form class="" action="${root}/admin/createLeague.do" enctype="multipart/form-data" method="post">
		
	<h2>SML KOREA</h2>
	<div align="center">
	
	<h2>리그개설</h2>
	<br/><br/><br/>
	
	<span>리그명</span>	
	<input type="text" name=leagueName></input>	
	<br/><br/>
	
	<span>종목</span>	
	<select name="leagueSport" >
				<option>종목선택</option>			
				<option value="전체">전체</option>
				<option value="축구">축구</option>
				<option value="야구">야구</option>
				<option value="족구">족구</option>
				<option value="풋살">풋살</option>	
	</select>
	<br/><br/>
	
	<span>리그기간</span>
	<input type="text" id="leagueStartDate" name="leagueStartDate">
	<span>~</span>
	<input type="text" id="leagueEndDate" name="leagueEndDate">
	<br/><br/>
	
	<span>리그팀수</span>
	<input type="text" name="leagueTeamNumberValue" value="8" disabled="disabled">
	<input type="hidden" name="leagueTeamNumber" value="8">
	<br/><br/>
	
	<span>개최지</span>
	
	<select id="sido">
		<option>서울</option>
		<option>충남</option>
		<option>부산</option>
		<option>울산</option>
		<option>인천</option>
		<option>광주</option>
		<option>제주</option>
		<option>대전</option>
		<option>대구</option>
		<option>강원</option>
		<option>경북</option>
		<option>전북</option>
		<option>전남</option>
		<option>경기</option>
		<option>경남</option>
	</select>
	
	<input type="hidden" name="leagueRegion"></input>	
	
	<br/><br/>
	
	<div>
	<span>리그요일</span>
	<span>Sat</span>
	<input type="radio" name="leagueDay" value="sat">
	<span>Sun</span>
	<input type="radio" name="leagueDay" value="sun">
	</div>
	
	<br/><br/>
	
	<span>리그시간</span>
	<span>10:00</span>
	<input type="checkbox" name="time" value="10:00">
	<span>13:00</span>
	<input type="checkbox" name="time" value="13:00">
	<span>16:00</span>
	<input type="checkbox" name="time" value="16:00">
	<span>20:00</span>
	<input type="checkbox" name="time" value="20:00">
	<input type="hidden" name="leagueTime">
	<br/><br/>
	
	<span>리그 경기장</span>
	<br/>
	<input type="text" name="place1">
	<br/>
	<input type="text" name="place2">
	<br/>
	<input type="text" name="place3">
	<br/>
	<input type="button" name="searchPlace" value="경기장 찾기">
	<br/><br/>
	<input type="hidden" name="leaguePlace">
	
	<div>
		<label>리그 이미지</label> 
		<span> 
			<input type="file" name="file"/>			
		</span>
	</div>
	<br/><br/>	
	
	<input id="create" type="submit" name="createLeague" value="리그개설"></input>
	
	</div>
	</form>
</body>
</html>