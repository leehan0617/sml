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
<script type="text/javascript" src="${root}/js/member/jquery-ui.js"></script>
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

<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<br/>
		<div align="left">
			<button id="2profilBtn" class="btn btn-link btn-xs" type="button" onclick="move2Profil()">내 프로필</button>
			<button id="2teamInfoBtn" class="btn btn-link btn-xs" type="button" onclick="move2teamInfo()">팀 정보</button>
		</div>
	</div>
	
	<div class="modal-body">		
		<div id="myProfil"> 
			<h3>내 프로필</h3>
			<br/>
			<div class="row">	
				<div class="col-sm-1"></div>	
				<div class="col-sm-10">
				  <table class="table" width="10">		    
				    <tbody>
				      <tr>
				        <td style="width:30%;">이름</td>
				        <td>${memberDto.memberName}</td>
				      </tr>
				      <tr>
				        <td style="width:30%;">생년월일</td>
				        <td>${memberDto.memberBirth}</td>
				      </tr>
				      <tr>
				        <td style="width:30%;">지역</td>
				        <td>${memberDto.memberRegion}</td>
				      </tr>
				      <tr>
				        <td style="width:30%;">이메일</td>
				        <td>${memberDto.memberEmail}</td>
				      </tr>
				      <tr>
				        <td style="width:30%;">연락처</td>
				        <td>${memberDto.memberPhone}</td>
				      </tr>
				      <tr>
				        <td style="width:30%;">성별</td>
				        <td>${memberDto.memberGender}</td>
				      </tr> 
				    </tbody>
				   </table>	
			  </div>
			  <div class="col-sm-1"></div>	
			</div>		   
		  <div align="right">
		 	 <button class="btn btn-success" type="button" onclick="updateProfil()">수정하기</button>
		  </div>
		</div>
		
		<div id="updateMyProfil">
			<h3>프로필 수정</h3>
			<form class="form-horizontal" action="${root}/member/updateMemberInfoOk.do" method="post" onsubmit="return teamCheck(this)" role="form">
				<input type="hidden" name="teamCode" value="${teamDto.teamCode }"/>
				
				 <div class="row">
			    	<div class="col-xs-8 col-sm-3"></div>
			    	 <div class="col-xs-4 col-sm-6">
						<div class="form-group">
							<label>이름</label>
							<input type="text" id="disabledInput" class="form-control" name="memberName" value="${memberDto.memberName }"/>
						</div>	
					</div>
				</div>
				
				<div class="row">
			    	<div class="col-xs-8 col-sm-3"></div>
			    	 <div class="col-xs-4 col-sm-6">
						<div class="form-group">
						    <label>생년월일:</label>
							<input type="text" id="date1" class="form-control" name="memberBirth" value="${memberDto.memberBirth }"/>
						</div>
					</div>
				</div>
								
				<div class="row">
			    	<div class="col-xs-8 col-sm-3"></div>
			    	 <div class="col-xs-4 col-sm-6">
						<div class="form-group">
							<label>지역:</label>
							<select id="sido" class="form-control" onchange="regionSido('${root }')">
								<option>시/도</option>
							</select>
							
							<select id="gugun" class="form-control">
								<option>시/구/군</option>
								<option></option>
							</select>
							<input type="hidden" name="memberRegion">
						</div>
					</div>
				</div>
				
				<div class="row">
			    	<div class="col-xs-8 col-sm-3"></div>
			    	 <div class="col-xs-4 col-sm-6">
						<div class="form-group">
							<label>이메일:</label>
							<input type="text" class="form-control" name="memberEmail" value="${memberDto.memberEmail }"/>
						</div>
					</div>
				</div>
				
				<div class="row">
			    	<div class="col-xs-8 col-sm-3"></div>
			    	 <div class="col-xs-4 col-sm-6">
						<div class="form-group">
							<label>연락처:</label>
							<input type="text" class="form-control" name="memberPhone" value="${memberDto.memberPhone }"/>
							"-"는 생략하고 적어주십시요
							<br/>
						</div>
				     </div>
				</div>
				
				
				<div class="row">
			    	<div class="col-xs-8 col-sm-3"></div>
			    	 <div class="col-xs-4 col-sm-6">
			    	 <div class="form-group">
						<label>성별:</label>						
						<label class="radio-inline"><input type="radio" name="sexValue" value="남">남</label>
						<label class="radio-inline"><input type="radio" name="sexValue" value="여">여</label>
						<input type="hidden" name="memberGender"/>		
						</div>				
					 </div>
				</div>
				<br/><br/>
				
				
				<script type="text/javascript">
					$("input[type='radio']").each(function(){
						if($(this).val()=="${memberDto.memberGender}"){
							$(this).attr("checked", true);
						}
					})
				</script>
				<div align="right">		
					<button type="submit" class="btn btn-success">수정하기</button>	
				</div>
			</form>
		</div>
		
		
		
		
		<div id="teamInfo" >
			<h3>팀 정보</h3>    
			<br/>
			<div class="row">	
				<div class="col-sm-1"></div>	
				<div class="col-sm-10">
				  <table class="table">		    
				    <tbody>
				      <tr>
				        <td style="width:30%;">팀명</td>
				        <td>${teamDto.teamName }</td>
				      </tr>
				      <tr>
				        <td style="width:30%;">팀 아이디</td>
				        <td>${teamDto.teamId }</td>
				      </tr>
				      <tr>
				        <td style="width:30%;">팀장이름</td>
				        <td>${teamDto.teamLeaderName }</td>
				      </tr>
				      <tr>
				        <td style="width:30%;">팀 종목</td>
				        <td>${teamDto.sportType }</td>
				      </tr>
				      <tr>
				        <td style="width:30%;">홈구장</td>
				        <td>${homeGround }</td>
				      </tr>
				      
				    </tbody>
				  </table>
				 </div>
				 <div class="col-sm-1"></div>
		   </div>
		  <div align="right">
		  	<button class="btn btn-success" type="button" onclick="updateTeamInfo()">수정하기</button>
		  </div>	
			
		</div>
		
		<div id="updateTeamInfo">	
			<h3>팀 수정</h3>	
			<form action="${root}/team/updateTeamInfoOk.do" method="post" name="registerModal" onsubmit="return Check(this)">
				<div class="row">
			    	<div class="col-xs-8 col-sm-3"></div>
			    	 <div class="col-xs-4 col-sm-6">
						<div class="form-group">
						  	<label>팀 아이디</label>
							<span>
								<input class="form-control" placeholder="팀 아이디" type="text" name="teamId" value="${teamDto.teamId }" disabled="disabled"/>
							</span>
						</div>
					 </div>
				</div>
				
				<div class="row">
			    	<div class="col-xs-8 col-sm-3"></div>
			    	 <div class="col-xs-4 col-sm-6">
						<div class="form-group">
							<label>비밀번호</label>
							<input class="form-control" placeholder="새 비밀번호" type="password" name="teamPassword"/>				
							<label>새 비밀번호</label>
							<input class="form-control" placeholder="새 비밀번호 확인" type="password" name="teamPassword2"/>
						</div>
					</div>
				</div>
				
				<div class="row">
			    	<div class="col-xs-8 col-sm-3"></div>
			    	 <div class="col-xs-4 col-sm-6">
						<div class="form-group">
							<label>팀 이름</label>
							<input class="form-control" placeholder="팀 이름" type="text" name="teamName" value="${teamDto.teamName }"/>
						</div>
					</div>
				</div>
				
				<div class="row">
			    	<div class="col-xs-8 col-sm-3"></div>
			    	 <div class="col-xs-4 col-sm-6">
						<div class="form-group">	
							<label>종목</label>
							<select class="form-control" name="sportType">
								<option value="${teamDto.sportType}">${teamDto.sportType}</option>
								<option value="축구">축구</option>
								<option value="야구">야구</option>
								<option value="족구">족구</option>
								<option value="풋살">풋살</option>
							</select>
						</div>
					</div>
				</div>
					<script>	 
						var sportType="${teamDto.sportType}";
						$("select").children().each(function(index, element){										
							if(element.value==(sportType)&&index>0){
								$("option:eq("+index+")").remove();
							} 					
						});
					</script>
					
				<div class="row">
			    	<div class="col-xs-8 col-sm-3"></div>
			    	 <div class="col-xs-4 col-sm-6">
						<div class="form-group">	
							<label>홈구장</label>
							<div class="input-group">
							<input class="form-control" type="text" name="homeGround" value="${homeGround }">
							<span class="input-group-btn">
								<button type="button" class="btn btn-default"  onclick="searchHomeground(form,'${root}')">경기장 검색</button>
							</span>
							</div>
						</div>
					</div>
				</div>
				
			<hr/>
			<div align="right">
				<input class="btn btn-success" type="submit" value="수정하기"/>
			</div>
			</form>			
		</div>
	</div>
	
	<!-- <div class="modal-footer">
	
	</div> -->
	
	
	
</div>
</body>
</html>