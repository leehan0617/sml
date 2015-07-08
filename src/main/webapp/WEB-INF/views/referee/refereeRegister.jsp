<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root }/js/external/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${root }/js/referee/referee.js"></script>
<script type="text/javascript" src="${root}/js/xhr/xhr.js"></script>
</head>
<body>
	
	<h3>심판 등록</h3>
	
	<div>
		<form action="${root}/referee/registerReferee.do" method="post" enctype="multipart/form-data" onsubmit="return refereeCheck(this)">
			<div>
				<label>지원종목</label>
				<span>${sportType }</span>
				<input type="hidden" name="sportType" value="${sportType }"/>				
			</div>

			<div>
				<label>이름</label> 
				<input type="text" name="refereeName" />				
			</div>			
			
			<div>
				<label>생년월일</label> 
				<select id="yeardropdown" name="birthYear"></select>
				<select id="monthdropdown" name="birthMonth"></select> 
				<select id="daydropdown" name="birthDay"></select> 
			</div>
			
			<div>
				<label>지역:</label>
				<select id="sido" onchange="regionSido('${root }')">
					<option>시/도</option>
				</select>
				<select id="gugun">
					<option>시/구/군</option>
					<option></option>
				</select>				
				<input type="hidden" name="sido"/>
				<input type="hidden" name="gugun"/>
				<br/><br/>
			</div>
		
			<!-- refereePicture -->
			<div>
				<label>파일명</label> 
				<span> 
					<input type="file" name="file" />
				</span>
			</div>
	
			<div>
				<label>연락처:</label>
				<input type="text" name="refereePhoneNumber"/>
				<br/>
			</div>
			
			<span>
			<label>성별</label>
			<span>
				<input type="radio" name="sexValue" value="남"/>남
				<input type="radio" name="sexValue" value="여"/>여
				<input type="hidden" name="refereeGender"/>
			</span>
		</span><br/><br/>			

			<input type="submit" value="등록 신청" />
		</form>
	</div>
</body>
</html>