/**
 * 
 */
var root=null;
function teamLog(requestRoot,teamName){
	root=requestRoot;
	alert("teamName"+teamName);
	
	var replyNickName=$("#replyNickName").val();
	var replyContent=$("#replyContent").val();	
	var replyPassword=$("#replyPassword").val();

	
	
	var sendData="replyNickName="+replyNickName+"&replyContent="+replyContent+"&teamName="+teamName+"&replyPassword="+replyPassword;
	var url=root+"/teamPage/teamLog.do?"+sendData;
	alert(url);
	
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			
			$(".replyList").append("<span>"+replyNickName+"</span>"+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); 
			
			$(".replyList").append("<input type='text' value="+replyContent+" disabled='disabled' </input>");
			
			$(".replyList").append("<a href=''>삭제</a>"+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			
			
			
			//alert("gggg------"+replyNickName+","+replyContent);	
	
}
	
});
}
	
