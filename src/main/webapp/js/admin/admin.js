/**
 * 
 */

$(document).ready(function(){
	var leagueTime="";
	var leaguePlace="";
	
	$("#create").bind("click",function(){
		$(":checkbox:checked").each(function(){
			leagueTime+=$(this).val()+",";
		});
		$("input[name='leagueTime']").attr("value",leagueTime);
		
		$("input[name='leagueRegion']").attr("value",$("#sido").val());
//		alert($("input[name='leagueRegion']").val());
		
		leaguePlace+=$("input[name='place1']").val() + ",";
		leaguePlace+=$("input[name='place2']").val() + ",";
		leaguePlace+=$("input[name='place3']").val() + ",";
		
		$("input[name='leaguePlace']").attr("value",leaguePlace);
	});
	
	$("input[name='searchPlace']").bind("click",function(){
		var url="/home/admin/searchPlace.do";
		window.open(url,"","width=1000,height=600");
	});
});
