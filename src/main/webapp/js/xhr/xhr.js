/**
 * 
 */
var xhr=null;

function createXHR(){
	if(window.XMLHttpRequest){
		return new XMLHttpRequest;
	}else if(window.ActiveXObject){
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	return null;
}

function sendRequest(method, url, callback, params){
	xhr=createXHR();
	var httpMethod=method;
	if(httpMethod != "GET" && httpMethod != "POST") httpMethod="GET";
	
	var httpParams=(params == null || params == "") ? null : params;
	// alert(httpParams);
	
	var httpUrl=url;
	// alert(httpUrl);
	if(httpMethod == "GET" && httpParams != null) httpUrl += "?" + httpParams;
	
	xhr.open(httpMethod, httpUrl, true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send(httpMethod=="POST" ? httpParams : null);
	xhr.onreadystatechange=callback;
}