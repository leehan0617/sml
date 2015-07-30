var rroot="/home";
var idChk;
var teamIdChk;
/*var idChk="X";
var teamIdChk="X";*/
$(document).ready(function(){
	var url=rroot+"/member/searchRegion.do";
	
	sendRequest("GET", url, fromSido, null);
	
	function fromSido(){
		if(xhr.readyState==4&&xhr.status==200){
			var div=document.getElementById("sido");
			if(div!=null){
				div.innerHTML=xhr.responseText;
			}
			if($("#sido").val()=="서울"){
				var params="sido=서울";
				sendRequest("GET", url, fromServer, params);
			}
		}
	}		
});

function regionSido(root){
	var url=root+"/member/searchRegion.do";
	
	if($("#sido").val()!="시/도"){
		var params="sido="+$("#sido").val();
		sendRequest("GET", url, fromServer, params);
	}else{
		var div=document.getElementById("gugun");
		div.innerHTML="<option>시/구/군</option><option></option>"
	}
}

function fromServer(){
	if(xhr.readyState==4&&xhr.status==200){
		var div=document.getElementById("gugun");
		div.innerHTML=xhr.responseText;
	}
}

function Check(form){
	//아이디 입력여부 검사
	if($("input[name='teamId']").val()==""){
		alert("아이디를 입력하세요");
		$("input[name='teamId']").focus();
		//$("#step2").attr("data-target", "#");
		return false;
	}       
	
	//아이디 유효성 검사 (영문소문자, 숫자만 허용)
	for (var i=0;i<$("input[name='teamId']").val().length ;i++ ){
	 var ch=$("input[name='teamId']").val().charAt(i);
	  if (!(ch>='0' && ch<='9') && !(ch>='a' && ch<='z')){
		  alert ("아이디는 소문자, 숫자만 입력가능합니다.");
		  return false;
	  }
	}
	//아이디에 공백 사용하지 않기
	if ($("input[name='teamId']").val().indexOf(" ")>=0)	{
	 alert("아이디에 공백을 사용할 수 없습니다.");
	 return false;
	}
	//아이디 길이 체크 (6~12자)
	if ($("input[name='teamId']").val().length<6 || $("input[name='teamId']").val().length>12)	{
	 alert ("아이디를 6~12자까지 입력해주세요.");
	 $("input[name='teamId']").focus();
	 return false;
	}
	
	if($("input[name='teamPassword']").val()==""){
		alert("비밀번호를 입력하세요");
		$("input[name='teamPassword']").focus();
		return false;
	}	
	
	if($("input[name='teamPassword2']").val()==""){
		alert("비밀번호를 입력하세요");
		$("input[name='teamPassword2']").focus();
		return false;
	}	
	
	if($("input[name='teamPassword']").val()!=$("input[name='teamPassword2']").val()){
		alert("비밀번호가 맞지않습니다");
		$("input[name='teamPassword']").focus();
		return false;
	}	

	//비밀번호 길이 체크(4~8자 까지 허용)
	if ($("input[name='teamPassword']").val().length<4 || $("input[name='teamPassword']").val().length>8){
		alert ("비밀번호를 4~8자까지 입력해주세요.")
		$("input[name='teamPassword']").focus();
		return
	}
	
	if(form.teamName.value==""){
		alert("팀명을 입력하세요");
		form.teamName.focus();
		return false;
	}
	
	//alert("form:"+form.sportType.value);
	if(form.sportType.value=='null'){
		alert("종목을 체크해주세요");
		return false;
	}
	
	if($("input[name='homeGround']").val()==""){
		alert("경기장을 입력하세요");
		$("input[name='homeGround']").focus();
		return false;
	}	
		
}

function idCheck(form,root){
/*	alert("ok");
	alert("idCheck:"+form.teamId.value+","+root);*/

	if($("input[name='teamId']").val()==""){
		alert("아이디를 입력하세요");
		$("input[name='teamId']").focus();
		return false;
	}
	var url=root+"/member/idCheck.do?teamId="+form.teamId.value;
		$.ajax({
			url:url,
			data:"get",
			dataType:"html",
			success:function(data){
				$('#resultAlert').html(data);
				//alert(idChk + " + " + teamIdChk );
			}
		});
	}

function teamCheck(form){

	//아이디 입력여부 검사
	if($("input[name='teamId']").val()==""){
		alert("아이디를 입력하세요");
		$("input[name='teamId']").focus();
		//$("#step2").attr("data-target", "#");
		return false;
	}       
	
	//아이디 유효성 검사 (영문소문자, 숫자만 허용)
	for (var i=0;i<$("input[name='teamId']").val().length ;i++ ){
	 var ch=$("input[name='teamId']").val().charAt(i);
	  if (!(ch>='0' && ch<='9') && !(ch>='a' && ch<='z')){
		  alert ("아이디는 소문자, 숫자만 입력가능합니다.");
		  return false;
	  }
	}
	//아이디에 공백 사용하지 않기
	if ($("input[name='teamId']").val().indexOf(" ")>=0)	{
	 alert("아이디에 공백을 사용할 수 없습니다.");
	 return false;
	}
	//아이디 길이 체크 (6~12자)
	if ($("input[name='teamId']").val().length<6 || $("input[name='teamId']").val().length>12)	{
	 alert ("아이디를 6~12자까지 입력해주세요.");
	 $("input[name='teamId']").focus();
	 return false;
	}
	
	if($("input[name='teamPassword']").val()==""){
		alert("비밀번호를 입력하세요");
		$("input[name='teamPassword']").focus();
		return false;
	}	
	
	if($("input[name='teamPassword2']").val()==""){
		alert("비밀번호를 입력하세요");
		$("input[name='teamPassword2']").focus();
		return false;
	}	
	
	if($("input[name='teamPassword']").val()!=$("input[name='teamPassword2']").val()){
		alert("비밀번호가 맞지않습니다");
		$("input[name='teamPassword']").focus();
		return false;
	}	

	//비밀번호 길이 체크(4~8자 까지 허용)
	if ($("input[name='teamPassword']").val().length<4 || $("input[name='teamPassword']").val().length>8){
		alert ("비밀번호를 4~8자까지 입력해주세요.")
		$("input[name='teamPassword']").focus();
		return
	}
	
	if(form.teamName.value==""){
		alert("팀명을 입력하세요");
		form.teamName.focus();
		return false;
	}
	
	//alert("form:"+form.sportType.value);
	if(form.sportType.value=='null'){
		alert("종목을 체크해주세요");
		return false;
	}
	
	if($("input[name='homeGround']").val()==""){
		alert("경기장을 입력하세요");
		$("input[name='homeGround']").focus();
		return false;
	}	
	
	
	
	
	
	
	if($("input[name='memberName']").val()==""){
		alert("이름을 입력하세요");
		$("input[name='memberName']").focus();
		return false;
	}
	
	if($("input[name='memberBirth']").val()==""){
		alert("생년월일을 입력하세요");
		$("input[name='memberBirth']").focus();
		return false;
	}
	
	if($("input[name='memberEmail']").val()==""){
		alert("email을 입력하세요");
		$("input[name='memberEmail']").focus();
		return false;
	}
	
	if($("input[name='memberPhone']").val()==""){
		alert("핸드폰번호를 입력하세요");
		$("input[name='memberPhone']").focus();
		return false;
	}
	
	
	var sex=$("input[name='sexValue']:radio:checked").val();
	/*alert(sex);*/
	if(!sex){
		alert("성별을 선택하세요");
		return false;
	}

	//alert(idChk + " + " + teamIdChk );
	if(idChk==null){
		alert("아이디 중복검사를 하세요.");
		return false;
	}
	
	if(teamIdChk==null){
		alert("팀 중복검사를 하세요.");
		return false;
	}
	
	$("input[name='memberGender']").attr("value",sex);
	$("input[name='memberRegion']").attr("value",$("#sido").val()+" "+$("#gugun").val());
	//alert($("input[name='memberRegion']").val());
}

function teamIdCheck(form,root){
/*	alert("ok");
	alert("idCheck:"+form.teamName.value+","+root);	*/
	if(form.teamName.value==""){
		alert("팀명을 입력하세요");
		form.teamName.focus();
		return false;
	}
	var url=root+"/member/idCheckName.do?teamName="+form.teamName.value;
	$.ajax({
		url:url,
		data:"get",
		dataType:"html",
		success:function(data){
			$('#resultTeamAlert').html(data);
			//alert(idChk + " + " + teamIdChk );
		}
	});
}

function searchHomeground(form, root){
	var url=root+"/member/searchHomeGround.do";
	window.open(url,"",'width=1030,height=663');
}

function selectHomeGround(){
	window.opener.form.homeGround.value=$("#homeGround").text();
	close();
}


var rroot="/home";

$(document).ready(function(){
	var url=rroot+"/member/searchRegion.do";
	
	sendRequest("GET", url, fromSido, null);
	
	function fromSido(){
		if(xhr.readyState==4&&xhr.status==200){
			var div=document.getElementById("sido");
			div.innerHTML=xhr.responseText;
			
			if($("#sido").val()=="서울"){
				var params="sido=서울";
				sendRequest("GET", url, fromServer, params);
			}
		}
	}
	
});

function regionSido(root){
	var url=root+"/member/searchRegion.do";
	
	if($("#sido").val()!="시/도"){
		var params="sido="+$("#sido").val();
		sendRequest("GET", url, fromServer, params);
	}else{
		var div=document.getElementById("gugun");
		div.innerHTML="<option>시/구/군</option><option></option>"
	}
}

function fromServer(){
	if(xhr.readyState==4&&xhr.status==200){
		var div=document.getElementById("gugun");
		div.innerHTML=xhr.responseText;
	}
}

function deleteMember(root,pageNumber,memberCode,teamName,teamCode,teamGrade){
	
	var value=confirm("정말로 삭제하시겠습니까?");
	
	if(value==true){
		location.href=root+"/teamPage/deleteMember.do?pageNumber="+pageNumber + "&memberCode=" + memberCode+ "&teamName=" + teamName+ "&teamCode=" + teamCode+ "&teamGrade=" + teamGrade;
	}
}






