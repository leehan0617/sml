<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${root }/resources/css/bootstrap.css"/>
<link rel="stylesheet" type="text/css"  href="${root}/css/member/jquery-ui.css"/>

<script type="text/javascript" src="${root }/js/jquery/jquery.js"></script>
<script type="text/javascript" src="${root }/resources/js/bootstrap.js"></script>

<!-- 팀장정보 -->
<script type="text/javascript" src="${root}/js/member/member.js"></script>
<script type="text/javascript" src="${root}/js/xhr/xhr.js"></script>

<!-- 팀정보 -->
</head>
<script>
	$(function(){
		$("#teamInfo").hide();
		$("#updateMyProfil").hide();
		$("#updateTeamInfo").hide();
		
		$("#date1").datepicker({
			dateFormat:"yy-mm-dd",
			yearRange: "1950:2015",
			monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			dayNamesMin:["일","월","화","수","목","금","토"],
			showOn:"button",
			buttonImage:"${root}/js/member/달력.PNG",
			buttonImageOnly:true,
			changeYear:true,
			changeMonth:true			
		});
	})
	
	function updateProfil(){
		$("#myProfil").hide();	
		$("#teamInfo").hide();
		$("#updateMyProfil").show();
		$("#updateTeamInfo").hide();
	}
	
	function updateTeamInfo(){
		$("#myProfil").hide();	
		$("#teamInfo").hide();
		$("#updateMyProfil").hide();
		$("#updateTeamInfo").show();
	}
	
	function move2Profil(){
		$("#myProfil").show();	
		$("#teamInfo").hide();
		$("#updateMyProfil").hide();
		$("#updateTeamInfo").hide();
	}
	
	function move2teamInfo(){
		$("#myProfil").hide();	
		$("#teamInfo").show();
		$("#updateMyProfil").hide();
		$("#updateTeamInfo").hide();
	}
</script>
<style>
	
</style>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<button type="button" onclick="move2Profil()">내 프로필</button>
		<button type="button" onclick="move2teamInfo()">팀 정보</button>
	</div>
	
	<div class="modal-body">	
		<div id="myProfil">      
		  <table class="table">		    
		    <tbody>
		      <tr>
		        <td style="width:20%;">이름</td>
		        <td>${memberDto.memberName}</td>
		      </tr>
		      <tr>
		        <td style="width:20%;">생년월일</td>
		        <td>${memberDto.memberBirth}</td>
		      </tr>
		      <tr>
		        <td style="width:20%;">지역</td>
		        <td>${memberDto.memberRegion}</td>
		      </tr>
		      <tr>
		        <td style="width:20%;">이메일</td>
		        <td>${memberDto.memberEmail}</td>
		      </tr>
		      <tr>
		        <td style="width:20%;">연락처</td>
		        <td>${memberDto.memberPhone}</td>
		      </tr>
		      <tr>
		        <td style="width:20%;">성별</td>
		        <td>${memberDto.memberGender}</td>
		      </tr>
		      
		    </tbody>
		  </table>
		  
		  <button type="button" onclick="updateProfil()">수정하기</button>
		</div>
		
		<%-- <div id="myProfil">
			<h3>내 프로필</h3>
			<div>이름 : ${memberDto.memberName}</div>
			<div>생년월일 : ${memberDto.memberBirth}</div>
			<div>지역 : ${memberDto.memberRegion}</div>
			<div>이메일 : ${memberDto.memberEmail}</div>
			<div>연락처 : ${memberDto.memberPhone}</div>
			<div>성별 : ${memberDto.memberGender}</div>
			<a href="${root }/member/updateMemberInfo.do?teamName=${teamDto.teamName }">수정하기</a>
			<button type="button" onclick="updateProfil()">수정하기</button>
		</div> --%>
		
		<div id="updateMyProfil">
			<form action="${root}/member/updateMemberInfoOk.do" method="post" onsubmit="return teamCheck(this)">
				<input type="hidden" name="teamCode" value="${teamCode }"/>
				<div>
					<label>이름</label>
					<input type="text" name="memberName" value="${memberDto.memberName }"/><br/>
				    <label>생년월일:</label>
					<input type="text" id="date1" name="memberBirth" value="${memberDto.memberBirth }"/>
					<br/></br> 
				</div>
				
				<!-- <script>
					var values=new Array();
					var region="${memberDto.memberRegion}";
					values=region.split(" ");
					
					for(var i=0; values.size(); i++){
						alert(values[i]);
					}
				</script> -->
				<div>
					<label>지역:</label>
					<select id="sido" onchange="regionSido('${root }')">
						<option>시/도</option>
					</select>
					<select id="gugun">
						<option>시/구/군</option>
						<option></option>
					</select>
					<input type="hidden" name="memberRegion">
					<br/><br/>
				</div>
				
				<div>
					<label>이메일:</label>
					<input type="text" name="memberEmail" value="${memberDto.memberEmail }"/>
					<br/>
				</div>
				
				<div>
					<label>연락처:</label>
					<input type="text" name="memberPhone" value="${memberDto.memberPhone }"/>
					"-"는 생략하고 적어주십시요
					<br/>
				</div>
				
				<span>
					<label>성별</label>
					<span>
						<input type="radio" name="sexValue" value="남"/>남
						<input type="radio" name="sexValue" value="여"/>여
						<input type="hidden" name="memberGender"/>
					</span>
				</span><br/><br/>
				
				<script type="text/javascript">
					$("input[type='radio']").each(function(){
						if($(this).val()=="${memberDto.memberGender}"){
							$(this).attr("checked", true);
						}
					})
				</script>
				<input type="submit" value="수정하기"/>				
			</form>
		</div>
		
		
		
		
		<div id="teamInfo" >    
		  <table class="table">		    
		    <tbody>
		      <tr>
		        <td style="width:20%;">팀명</td>
		        <td>${teamDto.teamName }</td>
		      </tr>
		      <tr>
		        <td style="width:20%;">팀 아이디</td>
		        <td>${teamDto.teamId }</td>
		      </tr>
		      <tr>
		        <td style="width:20%;">팀장이름</td>
		        <td>${teamDto.teamLeaderName }</td>
		      </tr>
		      <tr>
		        <td style="width:20%;">팀 종목</td>
		        <td>${teamDto.sportType }</td>
		      </tr>
		      <tr>
		        <td style="width:20%;">홈구장</td>
		        <td>${homeGround }</td>
		      </tr>
		      
		    </tbody>
		  </table>
		
		  <button type="button" onclick="updateTeamInfo()">수정하기</button>
		  
			<%-- <h3>팀 정보</h3>
			<img src="${root }/img/teamImg/${teamDto.emblem}" alt="팀 로고"/>
			<div>팀명 : ${teamDto.teamName }</div>
			<div>팀 아이디 : ${teamDto.teamId }</div>
			<div>팀장이름 : ${teamDto.teamLeaderName }</div>
			<div>팀 종목 : ${teamDto.sportType }</div>	
			<div>홈구장 : ${homeGround }</div>	
			<a href="${root }/team/updateTeamInfo.do?teamName=${teamDto.teamName }">수정하기</a> --%>			
			
		</div>
		
		<div id="updateTeamInfo">		
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
			<hr/>
			<input type="submit" value="수정하기"/>
			</form>			
		</div>
	</div>
	
	<div class="modal-footer">
	
	</div>
	
	
	<div class="modal fade" id="popup">
		<div class="modal-dialog">
	    	<div class="modal-content">
    	</div>
    </div>
</div>
</body>
</html>