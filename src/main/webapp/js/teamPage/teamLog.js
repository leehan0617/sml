/**
 * 
 */
var root=null;
function teamLog(requestRoot,teamName){
	root=requestRoot;
	//alert("teamName"+teamName);
	
	var replyNickName=$("#replyNickName").val();
	var replyContent=$("#replyContent").val();	
	var replyPassword=$("#replyPassword").val();
	
	
	var sendData="replyNickName="+replyNickName+"&replyContent="+replyContent+"&teamName="+teamName+"&replyPassword="+replyPassword;
	var url=root+"/teamPage/teamLog.do?"+sendData;
	// alert(url);
	
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			// alert(replyNickName + "," + replyContent + ",");
			
			$("#replyNickName").val("");
			$("#replyPassword").val("");
			$("#replyContent").val("");			
			
			$(".container").css("display","block");	
			$("#containerNickName").text(replyNickName);
			$("#containerContent").text(replyContent);
			
			location.reload();			// 새로고침
		}	
	});
}
	
