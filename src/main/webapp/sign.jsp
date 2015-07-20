<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<script>
	$('#step2').click(function(){
		$('#popupJoin').modal('toggle');
	});
	
	$('#prevStep1').click(function(){
		$('#popupJoin').modal('toggle');
		$('#popupJoin2').modal('toggle');
	});
	
	$("#date1").datepicker({
		dateFormat:"yy-mm-dd",
		yearRange: "1950:2015",
		dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		closeText:'닫기',
		showButtonPanel: true,
		changeYear:true,
		changeMonth:true
	});
</script>
<script src="${root }/js/xhr/xhr.js"></script>
<script src="${root }/js/teamPage/teamPage.js"></script>
<script type="text/javascript" src="${root}/resources/js/member.js"></script>
<script type="text/javascript" src="${root}/resources/js/jquery.js"></script>

<form action="${root}/member/registerMember.do" method="post" name="registerModal" onsubmit="return teamCheck(this)">
<div class="modal fade" id="popupJoin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">1번째 단계 : 팀정보입력</h4>
		      </div>
		      
		      <div class="modal-body">
		        <div class="row">
				  	<div class="col-sm-12">
					    <div class="row">
					      <div class="col-xs-8 col-sm-3"></div>
					      <div class="col-xs-8 col-sm-6">
					      	<label>팀아이디</label>
					        <div class="input-group">
							      <input type="text" class="form-control" placeholder="팀아이디를 적어주세요." name="teamId">
							      <span class="input-group-btn">
							        <button class="btn btn-default"  type="button" onclick="idCheck(registerModal,'${root}')">중복확인</button>
							      </span>
							 </div><!-- /input-group -->
					      </div>
					    </div>
					    <br/>
					    <div class="row">
					    	<div class="col-xs-8 col-sm-3"></div>
					    	<div class="col-xs-4 col-sm-6">
					    	<label>팀 비밀번호</label>
					        <input type="password" class="form-control" placeholder="팀 비밀번호를 적어주세요." name="teamPassword">
					        <input type="password" class="form-control" placeholder="비밀번호를 한번더 적어주세요." name="teamPassword2">
					      </div>
					    </div>
					    <br/>
					     <div class="row">
					    	<div class="col-xs-8 col-sm-3"></div>
					    	 <div class="col-xs-4 col-sm-6">
					    	 	<label>팀 이름</label>
						        <div class="input-group">
							      <input type="text" class="form-control" placeholder="팀이름을 적어주세요." name="teamName">
							      <span class="input-group-btn">
							        <button class="btn btn-default" type="button"  onclick="teamIdCheck(registerModal,'${root}')">중복확인</button>
							      </span>
							    </div><!-- /input-group -->
					      	</div>
					    </div>
					    <br/>
					  					    
					    <div class="row">
					    	<div class="col-xs-8 col-sm-3"></div>
					    	<div class="col-xs-4 col-sm-6">    		
								<label>종목</label>
								<select class="form-control" name="sportType">
									<option value="null">종목을 선택해주세요</option>
								    <option value="축구">축구</option>
									<option value="야구">야구</option>
									<option value="족구">족구</option>
									<option value="풋살">풋살</option>
								</select>
								<br/>
							   <label>팀 주 경기장</label>
							   <div class="input-group">
							      <input type="text" size="20" class="form-control" placeholder="경기장을 입력해주세요." name="homeGround" disabled="disabled">
							      <span class="input-group-btn">
							        <button type="button" class="btn btn-default"  onclick="searchHomeground(form,'${root}')">경기장 검색</button>
							      </span>
							  </div><!-- /input-group -->
					    	</div>
					    </div>
					    <hr/>
					    <br/>
					    
					    <div class="row">
					    	<div class="col-xs-8 col-sm-4"></div>
					    	<div class="col-xs-4 col-sm-6">
					        <input class="btn btn-info" type="button" value="다음단계로" onclick="return Check(registerModal)"data-toggle="modal" data-target="#popupJoin2" id="step2">
					        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					      </div>
					    </div>
				  	</div>
				</div>
		      </div>
		    </div>
		  </div>
	</div>
	
	<div class="modal fade" id="popupJoin2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">2번째 단계 : 팀장정보입력</h4>
		      </div>
		      
		      <div class="modal-body">
		        <div class="row">
				  	<div class="col-sm-12">
				  	
					    <div class="row">
					      <div class="col-xs-8 col-sm-3"></div>
					      <div class="col-xs-8 col-sm-6">
					      	<label>이름</label>
					        <input type="text" class="form-control" placeholder="팀장님 이름을 적어주세요" name="memberName">
					        
					        <label>생년월일</label>
							<input type="text" class="form-control" placeholder="팀장님 생일을 선택해주세요"  id="date1"name="memberBirth" />
					      </div>
					    </div>
					    <br/>
					    
					    <div class="row">
					    	<div class="col-xs-8 col-sm-3"></div>
					    	 <div class="col-xs-4 col-sm-6">
					    	 	<label>지역</label>
								<select id="sido" class="form-control" onchange="regionSido('${root }')">
									<option>시/도</option>
								</select>
								<br/>
								<select id="gugun" class="form-control">
									<option>시/구/군</option>
									<option></option>
								</select>
								<input type="hidden" name="memberRegion">		       	  
					      	</div>
					    </div>
					    <br/>
					    <div class="row">
					    	<div class="col-xs-8 col-sm-3"></div>
					    	 <div class="col-xs-4 col-sm-6">
					    	 		<label>이메일</label>
									<input type="text" name="memberEmail" class="form-control" placeholder="이메일을 입력하세요"/>
									<label>연락처</label>
									<input type="text" name="memberPhone" class="form-control" placeholder="'-'는 생략하고 적어주세요."/>
					    	 </div>
					    </div>
					    <br/>
					    <div class="row">
					    	<div class="col-xs-8 col-sm-3"></div>
					    	 <div class="col-xs-4 col-sm-6">
						    <label>성별</label>
							<span>
								<label class="radio-inline">
							  	<input type="radio" name="sexValue" id="inlineRadio1" value="남">남
								</label>
								<label class="radio-inline">
								  <input type="radio" name="sexValue" id="inlineRadio2" value="여">여
								</label>
								<label class="radio-inline">
								  <input type="radio" name="sexValue" id="inlineRadio3" value="비밀">비밀
								</label>
								<input type="hidden" name="memberGender"/>
							</span>
							</div>
						</div>
						<hr/>
						
					    <div class="row">
					    	<div class="col-xs-8 col-sm-4"></div>
					    	<div class="col-xs-4 col-sm-6">
					        <input class="btn btn-success" type="submit" value="가입요청" data-toggle="modal">
					        <button type="button" class="btn btn-warning" data-dismiss="modal"  id="prevStep1">이전단계로</button>
					      </div>
					    </div>
					 
				  	</div>
				</div>
		      </div>
		    </div>
		  </div>
	</div>
	
	<!-- <!-- map Modal -->
	  <div class="modal fade" id="mapModal" role="dialog">
	    <div class="modal-dialog">
		        <div class="modal-header">
		        </div>
		        
		        <div class="modal-content">
					<div class="modal-body">
						<div id="resultMap"></div>
					</div>
           		    <div class="modal-footer">
						     <div class="modal-footer">
					          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        </div>
		      		</div> 
	   		    </div>	
	    </div>
	   </div>			 -->
</form>