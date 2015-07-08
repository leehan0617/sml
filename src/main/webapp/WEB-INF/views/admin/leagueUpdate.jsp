<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="${root}/js/external/jquery-1.11.3.min.js"></script>	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
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
	<form class="" action="${root}/admin/leagueUpdate.do" method="post">
	<input type="hidden" name="leagueCode" value="${leagueDto.leagueCode}"/>
	<h2>SML KOREA</h2>
	<div align="center">
	
	<h2>리그개설</h2>
	<br/><br/><br/>
	
	<span>리그명</span>	
	<input type="text" name=leagueName value="${leagueDto.leagueName}"></input>	
	<br/><br/>
	
	<span>종목</span>	
	<select name="leagueSport" >
				<option>${leagueDto.leagueSport}</option>			
				<option value="전체">전체</option>
				<option value="축구">축구</option>
				<option value="야구">야구</option>
				<option value="족구">족구</option>
				<option value="풋살">풋살</option>	
	</select>
	<br/><br/>
	
	<span>리그기간</span>
	<input type="text" id="leagueStartDate" name="leagueStartDate" value="${leagueDto.leagueStartDate}">
	<span>~</span>
	<input type="text" id="leagueEndDate" name="leagueEndDate" value="${leagueDto.leagueEndDate}">
	<br/><br/>
	
	<span>리그팀수</span>
	<input type="text" name="leagueTeamNumber" value="${leagueDto.leagueTeamNumber}">	
	<br/><br/>
	
	<span>개최지</span>
	
	<input type="text" name="leagueRegion" value="${leagueDto.leagueRegion}"></input>	
	
	<br/><br/>
	
	<div>
	<span>리그요일</span>
	<c:if test="${leagueDto.leagueDay=='sat'}">
	<span>Sat</span>	
		<input type="radio" name="leagueDay" value="sat" checked="checked">
	<span>Sun</span>
		<input type="radio" name="leagueDay" value="sun">		
	</c:if>	
	
	<c:if test="${leagueDto.leagueDay=='sun'}">
	<span>Sat</span>	
		<input type="radio" name="leagueDay" value="sat">
	<span>Sun</span>		
		<input type="radio" name="leagueDay" value="sun" checked="checked">		
	</c:if>
	</div>
	
	<br/><br/>
	
	<span>리그시간</span>
	<input type="text" name="leagueTime" type="text" value="${leagueDto.leagueTime}"/>
	
	<br/><br/>
	
	<div>
			<label>파일명</label> 
			<span> 
				<input type="file" name="leagueImage" value="${leagueDto.leagueImage}"/>
				
			</span>
		</div>
	<br/><br/>	
	
	<div class="">
			<input type="submit" value="수정"/>	
			<input type="reset" value="취소"/>		
			<input type="button" value="글목록" onclick="location.href='${root}/admin/manageLeague.do?pageNumber=${pageNumber }'"/>
		</div>
	
	</div>
	</form>
</body>
</html>