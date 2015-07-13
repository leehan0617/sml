/**
 * 
 */
var root=null;
function moreTeamLog(requestRoot,endRow,teamName){
	root=requestRoot;
	//alert("Root"+requestRoot+"pageNumber"+pageNumber+"teamName"+teamName);	
	//alert("pageNumber"+pageNumber);
	var sendData="endRow="+endRow+"&teamName="+teamName;
	var url=root+"/team/teamMain.do?"+sendData;
	alert("endRow"+endRow);
	//alert(url);
	
	
	$.ajax({
		url:url,
		type:"get",
		/*dataType:"text",*/
		success:function(data){
			
			//alert(pageNumber + "," + teamName + ",");
			//alert(data);
			//$(".replyListNum1").attr("id",pageNumber);
			/*
			$(".replyListNum1").append("리스트5개"+pageNumber);
			$(".replyListNum1").css("display","block");	*/
			
			//location.reload();			// 새로고침
			
			/*	
			$("#containerNickName").text(replyNickName);
			$("#containerContent").text(replyContent);
			
			
*/		}	
	});
}
	
