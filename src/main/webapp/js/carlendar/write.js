function scheDule(form){
	if(form.scheduleType.value=="종류"){
		alert("일정의 종류를 입력하세요");
		form.scheduleType.focus();
		return false;
	}
}

function writeSchedule(root,teamName){
	var url=root+"/teamPage/Schedule.do?teamName="+teamName;
	$.ajax({
		url:url,
		type:"get",
		dataType:"html",
		success:function(data){
			$('#resultEdit').html(data);
		}
	});
}
function  closeSchedule(root,teamName){
	 	window.opener.location.reload();
  	 	window.close();
}

function deleteSchedule(root,scheduleNumber,teamGrade){
	var url=root+"/teamPage/deleteSchedule.do?scheduleNumber="+scheduleNumber;
	if(teamGrade=="AA"){
		$(document).ready(function(){
			$("#btn").click(function(){
				var result=confirm("삭제하시겠습니까?");
				if(result==true){
					$(location).attr('href',url);
				}
			});
		});
	}else{
		alert("권한이 없습니다!")
	}

}
