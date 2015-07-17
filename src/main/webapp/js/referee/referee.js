var rroot="/home";

$(document).ready(function(){
	var url=rroot+"/member/searchRegion.do";
	
	sendRequest("GET", url, fromSido, null);
	
	function fromSido(){
		if(xhr.readyState==4&&xhr.status==200){
			var div=document.getElementById("sido");
			if(div!=null){
				div.innerHTML=xhr.responseText;
			}
			if($("#sido").val()=="서울"){
				var params="sido=서울";
				sendRequest("GET", url, fromServer, params);
			}
		}
	
	}
	//////////////////////////////////////////////////	
	var today=new Date();
	var toyear=parseInt(today.getFullYear());
	var start=toyear-5;
	var end=toyear-70;
	
	var yeardropdown=$("#yeardropdown");
	for(var i=end;i<start + 1;i++){
		yeardropdown.append("<option value='" +i+ "'>" +i+ "</option>");
	}	
	
	var monthdropdown=$("#monthdropdown");
	for(var i=1;i<12 + 1;i++){
		monthdropdown.append("<option value='" +i+ "'>" +i+ "</option>");
	}	
	
	var daydropdown=$("#daydropdown");
	for(var i=1;i<31 + 1;i++){
		daydropdown.append("<option value='" +i+ "'>" +i+ "</option>");
	}
	
	
	//////////////////////////////////////////////////
});

function regionSido(root){
	var url=root+"/member/searchRegion.do";
	
	if($("#sido").val()!="시/도"){
		var params="sido="+$("#sido").val();
		sendRequest("GET", url, fromServer, params);
	}else{
		var div=document.getElementById("gugun");
		div.innerHTML="<option>시/구/군</option><option></option>"
	}
}

function fromServer(){
	if(xhr.readyState==4&&xhr.status==200){
		var div=document.getElementById("gugun");
		div.innerHTML=xhr.responseText;
	}
}

/*function sidoReferee(root){
	var url2=rroot+"/referee/refereeList.do";
	var params="sido=" + $("#sido2").val();
	$.ajax({
		type:"GET",
		url:url2,
		data:params,
		success:function(args){
			$("#list").html(args);
		}
	});
}*/
function refereeRegion(root, sportCode,regionSido){
	var url=root + "/referee/refereeList.do?sportCode=" + sportCode + "&regionSido=" + regionSido;
	location.replace(url);
}

function refereeCheck(){
	var sex=$("input[name='sexValue']:radio:checked").val();
	
	$("input[name='refereeGender']").attr("value",sex);
	$("input[name='sido']").attr("value", $("#sido").val());
	$("input[name='gugun']").attr("value", $("#gugun").val());
}