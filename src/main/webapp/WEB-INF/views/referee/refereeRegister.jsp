<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>심판 등록</h3>
	
	<div>
		<form action="${root}/referee/registerReferee.do" method="post" >
			<div>
				<label class="title">지원종목</label>
				<span class="content">
					<select name="refereeSport">					
						<option></option>
						<option value="1">축구</option>
						<option value="2">풋살</option>
						<option value="3">야구</option>
						<option value="4">족구</option>
					</select>
				</span>
			</div>
			
			<div class="line">
				<label  class="title">이름</label>
				<span>
					<input type="text" name="refereeName"/>
				</span>
			</div>	
			
			<div class="line">
				<label  class="title">생년월일</label>
				<span>
					<input type="text" name="refereeBirth"/>
				</span>
			</div>				
			
			<!-- <script type="text/javascript">
				var monthtext=['1','2','3','4','5','6','7','8','9','10','11','12'];
				function populatedropdown(dayfield, monthfield, yearfield){
				var today=new Date()
				var dayfield=document.getElementById(dayfield)
				var monthfield=document.getElementById(monthfield)
				var yearfield=document.getElementById(yearfield)
				    for (var i=0; i<31; i++)
				        dayfield.options[i]=new Option(i+1, i+1)
				        dayfield.options[today.getDate()]=new Option(today.getDate(), today.getDate(), true, true) //select today's day
				    for (var m=0; m<12; m++)
				        monthfield.options[m]=new Option(monthtext[m], monthtext[m])
				        monthfield.options[today.getMonth()]=new Option(monthtext[today.getMonth()], monthtext[today.getMonth()], true, true) //select today's month
				var thisyear=today.getFullYear()
				    for (var y=0; y<20; y++){
				        yearfield.options[y]=new Option(thisyear, thisyear)
				        thisyear+=1
				    }
				    yearfield.options[0]=new Option(today.getFullYear(), today.getFullYear(), true, true) //select today's year
				}
			</script>
			<select id="daydropdown">
			</select>
			<select id="monthdropdown">
			</select>
			<select id="yeardropdown">
			</select> -->
			
			<div class="line">
				<label  class="title">주소</label>
				<span>
					<input type="text" name="refereeAddress"/>
				</span>
			</div>
			
			<div class="line">
				<label  class="title">사진</label>
				<span>
					<input type="text" name="refereePicture"/>
				</span>
			</div>
			
			<div class="line">
				<label  class="title">연락처</label>
				<span>
					<input type="text" name="refereePhoneNumber"/>
				</span>
			</div>
			
			<input type="submit" value="등록 신청"/>
		</form>
	</div>
</body>
</html>