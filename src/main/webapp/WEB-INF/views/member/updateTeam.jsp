<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>팀정보 수정</title>
<script type="text/javascript" src="${root}/js/member/jquery.js"></script>
<script type="text/javascript" src="${root}/js/member/member.js"></script>
<script type="text/javascript" src="${root }/js/xhr/xhr.js"></script>

<script src="${root }/resources/js/jquery.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=1442260e0c6af86974001269a7312e42&libraries=services"></script>
<script src="${root }/resources/js/startDaumMap.js"></script>
<script src="${root }/resources/js/bootstrap.js"></script>
<script src="${root }/resources/js/angular.js"></script>
<script src="${root }/resources/js/jquery-ui.js"></script>
<script src="${root }/resources/js/smlAngular.js"></script>
<script src="${root }/resources/js/smlStart.js"></script>
</head>
<body>
	<div>
		<a href="${root}/start.jsp"><img alt="logo" src=""></a>
		<a href="${root}/start.jsp">SML Korea</a>
	</div>
	<h3>팀정보 수정</h3>
	
	<div>
	  <form action="${root}/team/updateTeamInfoOk.do" method="post" name="registerModal" onsubmit="return Check(this)">
	  	<label>팀 아이디</label>
		<span>
			<input placeholder="팀 아이디" type="text" name="teamId" value="${teamDto.teamId }" disabled="disabled"/>
		</span><br/><br/>
		<label>비밀번호</label>
		<input placeholder="새 비밀번호" type="password" name="teamPassword"/><br/>
		<label>새 비밀번호</label>
		<input placeholder="새 비밀번호 확인" type="password" name="teamPassword2"/>
	<br/><br/>
		
		<label>팀 이름</label>
		<span>
			<input placeholder="팀 이름" type="text" name="teamName" value="${teamDto.teamName }"/>
		</span><br/><br/><br/>
		<span>
			
			<label>종목</label>
			<select name="sportType">
				<option value="${teamDto.sportType}">${teamDto.sportType}</option>
				<option value="축구">축구</option>
				<option value="야구">야구</option>
				<option value="족구">족구</option>
				<option value="풋살">풋살</option>
			</select>
			<script>	 
				var sportType="${teamDto.sportType}";
				$("select").children().each(function(index, element){										
					if(element.value==(sportType)&&index>0){
						$("option:eq("+index+")").remove();
					} 					
				});
			</script>
			
			<br/>
			<a>홈구장</a>
			<input type="text" name="homeGround" value="${homeGround }">
			<input type="button" value="지도로 찾기" onclick="searchHomeground(form,'${root}')"> 
			<br/><br/>
		</span>
	
	<input type="submit" value="수정하기"/>
	</form>
	</div>
	
</body>
</html>