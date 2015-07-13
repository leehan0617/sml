/**
 * 
 */

$(document).ready(function(){
	
	$("input[name='searchPlace']").bind("click",function(){
		var url="/home/admin/searchPlace.do";
		window.open(url,"","width=1000,height=600");
	});
	
	$("#selectPlace").bind("click",function(){
		$("input[name='place1']",opener.document).val($("#place1").text());
		$("input[name='place2']",opener.document).val($("#place2").text());
		$("input[name='place3']",opener.document).val($("#place3").text());
		
		
		$("input[name='place1']",opener.document).attr("value", $("#place1").text());
		$("input[name='place2']",opener.document).attr("value", $("#place2").text());
		$("input[name='place3']",opener.document).attr("value", $("#place3").text());
		
		close();
	});
});
