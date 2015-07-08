/**
 * 
 */
var root=null;
function teamLogDelete(requestRoot,replyCode,replyPassword){
	root=requestRoot;
	//alert("replyCode"+replyCode);	
	//alert("replyPassword"+replyPassword);
	
	var sendData="replyPassword="+replyPassword+"&replyCode="+replyCode;
	var url=root+"/teamPage/teamLogDelete.do?"+sendData;
	
	//alert(url);
	
	$.ajax({
		url:url,
		type:"get",
		
		success:function(data){
						
			$("#"+replyCode).remove();
		
			
		}
	});
}