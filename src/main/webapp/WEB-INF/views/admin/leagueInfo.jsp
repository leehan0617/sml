<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 읽기</title>
<script src="${root }/js/external/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
	function deleteFun(root, leagueCode, pageNumber){
		var url=root+"/admin/leagueDelete.do?leagueCode="+leagueCode+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;	
	}
	
	function updateFun(root, leagueCode, pageNumber){
		var url=root+"/admin/leagueUpdate.do?leagueCode="+leagueCode+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;
	}
</script>

</head>
<body>			
	<h1>리그정보 읽기</h1>	
	<input type="hidden" name="leagueCode" value="${leagueDto.leagueCode}"/>
	<span>
		<span>
			
		<select name="leagueSport" disabled="disabled" >
				<option>${leagueDto.leagueSport}</option>				
		</select>	
			
		</span>	
		
		<span class="">
			<input type="text" name="leagueImage" value="${leagueDto.leagueImage}" disabled="disabled"/>
		</span>
		
		<span class="">
			<input type="text" name="leagueRegion" value="${leagueDto.leagueRegion}" disabled="disabled">	
		</span>	
		
		<br/>			
				
		<span class="">
			<input type="text" name="leagueName" value="${leagueDto.leagueName}" disabled="disabled">	
		</span>
		
		<span class="">
			<input type="text" name="leagueTeamNumber" value="${leagueDto.leagueTeamNumber}" disabled="disabled">	
		</span>	
		
		<span class="">
			<input type="text" name="leagueDay" value="${leagueDto.leagueDay}" disabled="disabled">	
		</span>	
		
		<span class="">
			<input type="text" name="leagueTime" value="${leagueDto.leagueTime}" disabled="disabled">	
		</span>	
		
		<span class="">
			<input type="text" name="leagueStartDate" value="${leagueDto.leagueStartDate}" disabled="disabled">	
		</span>	
		
		<span class="">
			<input type="text" name="leagueEndDate" value="${leagueDto.leagueEndDate}" disabled="disabled">	
		</span>	
		
		<br/>
		
		
		<input type="button" value="글수정" onclick="updateFun('${root}','${leagueDto.leagueCode }','${pageNumber }')" />
		<input type="button" value="글삭제" onclick="deleteFun('${root}','${leagueDto.leagueCode }','${pageNumber }')"/>				
		<input type="button" value="글목록" onclick="location.href='${root}/admin/manageLeague.do?pageNumber=${pageNumber }'"/>
	</span>
</body>
</html>