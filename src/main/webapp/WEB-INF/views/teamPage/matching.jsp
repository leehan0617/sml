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
<style>
	.map_wrap{
		position:relative;  left:5%; text-align=center;
	}
	
</style>
<body>   	
	<div class="modal-body">
		<c:if test="${matchingDto==null}">
			<form action="${root }/teamPage/searchMatching.do" name="matchingForm" method="POST" onsubmit="return matching(this,'${root}')">
				<input type="hidden" name="teamCode" value="${teamCode }"/>
				<input type="hidden" name="teamName" value="${teamName }">
				<input type="hidden" name="matchingLatlng">
				
				<div class="modalPageOne">						
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h1>매칭 등록 시작</h1>
				   	</div>
					
					<div class="modal-body">
						<h2><small>
							매칭 등록을 시작합니다.<br/>
							매칭 시스템은 홈구장의 거리, 날짜, 시간등을 계산하여 <br/>
						    매칭을 자동으로 결정해 줍니다.
						</small></h2>		
					</div>
					<div class="modal-footer">
					<button type="button" class="btn btn-info" onclick="setting1('${homeGround}')">다음단계로</button>		
					</div>		
				</div>				
				
				<div class="modalPageTwo">		
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h1>지역 설정 하기</h1>
						<%-- <h6>홈 구장 : ${homeGround }</h6> --%>
						<p class="text-info">
						홈 구장을 기준으로 매칭 가능한 거리를 설정합니다.
						(오른쪽 마우스 버튼 클릭시 거리가 입력됩니다.)
						</p>
				   	</div>
				   	
				   	<div class="modal-body">
						<div style="text-align:center;">
							<div class="map_wrap">
							    <div id="map" style="width:90%;height:90%;position:relative;overflow:hidden; border:solid black 1px;"></div>			
							    <div id="menu_wrap" class="bg_white">			        
								    <hr>
								    <ul id="placesList"></ul>
								    <div id="pagination"></div>
							    </div>
							</div>
						</div>
					</div>
					<div id="address" style="display:none"></div>
					
					<div style="text-align:center;">
						<button type="button" class="btn btn-default" id="drawingCircle" >반경 설정하기</button>
						<br/><br/>	
						<button type="button" class="btn btn-default"  id="deleteCircle" >리셋하기</button>	
						<br/><br/>					
					</div>
					<input name="matchingDistance" type="hidden" style="border: 0; padding: 0;" size="4" placeholder="0"/>							
					<input  name="matchingPlace" type="hidden" style="border: 0; padding: 0; text-align: center" size="100"/>
															

					<div class="modal-footer">						
						<button type="button" class="btn btn-warning" onclick="setting2('moveTo1')">이전단계로</button>					
						<button type="button" class="btn btn-info" onclick="setting2('moveTo3')">다음단계로</button>						
						
					</div>
				</div>
				
				<div class="modalPageThree">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h1>날짜 설정 하기</h1>
						<p class="text-info">
						희망하는 날짜와 비슷한 팀들과 매칭이 이루어집니다.
						</p>
				   	</div>
					
					<div class="modal-body">
						<h3>희망 요일</h3>
							<label class="checkbox-inline"><input type="checkbox" name="day" value="월">월</label>
							<label class="checkbox-inline"><input type="checkbox" name="day" value="화">화</label>
							<label class="checkbox-inline"><input type="checkbox" name="day" value="수">수</label>
							<label class="checkbox-inline"><input type="checkbox" name="day" value="목">목</label>
							<label class="checkbox-inline"><input type="checkbox" name="day" value="금">금</label>
							<label class="checkbox-inline"><input type="checkbox" name="day" value="토">토</label>
							<label class="checkbox-inline"><input type="checkbox" name="day" value="일">일</label>						
						<input type="hidden" name="matchingDay">
						<br/><br/>
						
						<h3>희망 경기시간</h3>
							<label class="checkbox-inline"><input type="checkbox" name="time" value="오전">오전 (12시 이전)</label>
							<label class="checkbox-inline"><input type="checkbox" name="time" value="오후">오후 (12시~ 7시)</label>
							<label class="checkbox-inline"><input type="checkbox" name="time" value="저녁">저녁 (7시 이후)</label>
							<!-- 
							<input type="checkbox" name="time" value="오전"><label>오전 (12시 이전)</label>
							<input type="checkbox" name="time" value="오후"><label>오후 (12시~ 7시)</label>
							<input type="checkbox" name="time" value="저녁"><label>저녁 (7시 이후)</label> -->
						<input type="hidden" name="matchingTime"/>
						<br/><br/>
						
						<h3>최대 검색거리</h3>
							<input type="text" name="matchingDistance" size="5" style="border: 0; padding: 0; margin-left:90px; text-align:center;" disabled="disabled"/>m
						<br/>
					</div>
					
					<div class="modal-footer" style="text-align:center">
						<button type="button" class="btn btn-warning" onclick="setting2('moveTo2')">이전단계로</button>
						<button type="submit" class="btn btn-success" id="searchMatching" >등록하기</button>
					</div>
					<!-- <div id="matchingComplete">
						매칭 등록 완료!!
						<input type="button" value="확인!" />
					</div> -->
				</div>
			</form>
		</c:if>	
		
		<c:if test="${matchingDto!=null }">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h1>매칭 시작하기 </h1>
			</div>
			<div class="modal-body">
				

				<div class="container">
				  <h2>매칭 정보</h2>
				  <p>매칭 시작하기를 누르면 매칭정보에 따라 경기가 정해집니다.</p>            
				  <table class="table table-hover" style="width:50%;">
				    <tbody>
				      <tr>
				        <td style="width:20%;">매칭 종목</td>
				        <td>${matchingDto.matchingSport }</td>
				      </tr>
				      <tr>
				        <td style="width:20%;">매칭 거리</td>
				        <td>${matchingDto.matchingDistance }</td>
				      </tr>
				      <tr>
				        <td style="width:20%;">매칭 시간</td>	
				        <td>${matchingDto.matchingTime }</td>
				      </tr>
				      <tr>
				        <td style="width:20%;">매칭 요일</td>
				        <td>${matchingDto.matchingDay }</td>
				      </tr>
				      <tr>
				        <td style="width:20%;">매칭 장소</td>
				        <td>${matchingDto.matchingPlace }</td>
				      </tr>
				      
				      <tr>
				      	<td></td>
				      	<td></td>
				      </tr>
				    </tbody>
				  </table>
				</div>



				<div><span>매칭 종목 :</span><span style="color:blue;">${matchingDto.matchingSport }</span></div>
				<div><span>매칭 거리 :</span><span style="color:blue;">${matchingDto.matchingDistance }</span></div>
				<div><span>매칭 시간 :</span><span style="color:blue;">${matchingDto.matchingTime }</span></div>
				<div><span>매칭 요일 :</span><span style="color:blue;">${matchingDto.matchingDay }</span></div>
				<div><span>매칭 장소 :</span><span style="color:blue;">${matchingDto.matchingPlace }</span></div>
				<div><span>매칭 상태 :</span><span style="color:blue;">${matchingDto.matchingState }</span></div>
				<div><span>매칭 위도, 경도 :</span><span style="color:blue;">${matchingDto.matchingLatlng }</span></div>
			</div>
			
			<div class="modal-footer">
				<button type="submit" class="btn btn-warning" onclick="javascript:location.href='${root}/teamPage/deleteMatching.do?matchingCode=${matchingDto.matchingCode }&teamName=${teamName}'" >매칭 취소하기</button>
				<button type="button" class="btn btn-success" onclick="doSearching('${root}','${teamCode}','${teamName }')">매칭 시작하기</button>				
			
				<%-- <input type="button" value="매칭 시작" onclick="doSearching('${root}','${teamCode}','${teamName }')">
				<input type="button" value="매칭 취소" onclick="javascript:location.href='${root}/teamPage/deleteMatching.do?matchingCode=${matchingDto.matchingCode }&teamName=${teamName}'"> --%>
				<div id="result" style="display:none;"></div>
			</div>
		</c:if>
	</div>
	<!-- 
	<div class="modal-footer">
	</div> -->
</body>
</html>
	