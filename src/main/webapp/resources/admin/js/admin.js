/**
 * 
 */

$(document).ready(function(){
	var score="";
	var params="";
	
	$("#insertButton").bind("click", function(){
//		alert("ok");
		score+=$("input[name='scoreTeam1']").val() + ":"+$("input[name='scoreTeam2']").val();
		$("#score").attr("value", score);
		
//		alert($("#gameCode").val());
//		alert($("#score").val());
//		alert($('input:radio[name="result"]:checked').val());
//	
		var gameCode=$("#gameCode").val();
		var resultScore=$("#score").val();
		var result=$('input:radio[name="result"]:checked').val();
		
//		location.href="/home/admin/insertGameResultOk.do?gameCode="+gameCode+"&resultScore="+resultScore+"&result="+result;
		
		$.ajax ({
		      type: 'get', // POST 로 전송
		      url:'/home/admin/insertGameResultOk.do', // 호출 URL
		      data: {'gameCode':gameCode,'resultScore':resultScore,'result':result}, // 파라메터 정보 전달
		      success:function(data){
		    		  location.reload();
		      },
		      error:function(e) {
		        // alert(e.responseText);
		      }
		});
		 location.reload();
		
	});
});