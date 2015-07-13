$(function(){
	$(".teamBoardPaging").click(function(){
		var urlAddr = $(".teamBoardPaging a").attr("href");		
		
		   $.ajax({
	            url:urlAddr,
	            success:function(data){
	                alert(data);
	            }
	        })
	});
})