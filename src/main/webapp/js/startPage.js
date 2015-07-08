/**
 * 
 */

function test(){
	alert("test");
}

function teamSearch(form, root){
//	alert(form.teamName.value);
	var url=root+"/teamPage/teamPageMain.do?teamName="+form.teamName.value;
	window.open(url,"","width=700,height=500");
}
