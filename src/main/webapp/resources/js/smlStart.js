var urlAddr="/home/autocomplete";
$(document).ready(function() {
	$("#searchTeamName").autocomplete({
		source : function(request, response) {
			$.ajax({
				url : urlAddr,
				type : "post",
				dataType : "json",
				data: { term : request.term, param1 : "param1 Value", param2 : "param2 Value"},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
				data : request,
				success : function(data) {
					var result = data;
					response(result);
				},
				error : function(data) {
					alert("에러가 발생하였습니다.");
				}
			});
		}
	});
	
	$("#goTeamPage").click(function(){
		var text = $("input[id='searchTeamName']").val();
		
		var url = "/home/team/teamMain.do?teamName="+text;
		window.open(url);
	});
});