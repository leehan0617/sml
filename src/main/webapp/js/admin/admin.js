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
		
		leaguePlace+=$("input[name='place1']").val() + ",";
		leaguePlace+=$("input[name='place2']").val() + ",";
		leaguePlace+=$("input[name='place3']").val() + ",";
		
		$("input[name='leaguePlace']").attr("value",leaguePlace);
		
		alert($("input[name='leagueRegion']").val());
		alert($("input[name='leaguePlace']").val());
		alert($("input[name='leagueTime']").val());
	});
	
	$("input[name='searchPlace']").bind("click",function(){
		var url="/home/admin/searchPlace.do";
		window.open(url,"","width=1000,height=600");
	});
	
	$("input[name='updatePlace']").bind("click",function(){
		var url="/home/admin/searchPlace.do";
		window.open(url,"","width=1000,height=600");
	});
});

function updateLeague(time, place){
	var timeData=time.split(",");
	var placeData=place.split(",");
	
	$("input[name='time']").each(function(){
		for(var i=0;i<timeData.length;i++){
			if(timeData[i]==$(this).val()){
				$(this).attr("checked",true);
			}
		}
	});
	
	for(var i=0;i<placeData.length;i++){
		$("input[name='place"+(i+1)+"']").attr("value",placeData[i]);
	}
}

function updateOkLeague(form){
	var leagueTime="";
	var leaguePlace="";
	
	$(":checkbox:checked").each(function(){
		leagueTime+=$(this).val()+",";
	});
	$("input[name='leagueTime']").attr("value",leagueTime);
	
	$("input[name='leagueRegion']").attr("value",$("#sido").val());
//	alert($("input[name='leagueRegion']").val());
	
	leaguePlace+=$("input[name='place1']").val() + ",";
	leaguePlace+=$("input[name='place2']").val() + ",";
	leaguePlace+=$("input[name='place3']").val() + ",";
	
	$("input[name='leaguePlace']").attr("value",leaguePlace);
}
