function writeSchedule(root){
	var url=root+"/teamPage/Schedule.do";
	window.open(url,"","width=500 height=500")
	
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
