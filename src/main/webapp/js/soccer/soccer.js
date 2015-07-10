$(document).ready(function(){
	$("#roll").Scroll({line:1,speed:1500,timer:3000,up:"#topbtnid",down:"#btmbtnid",autoplay:'#bannerplay',autostop:'#bannerstop'});
});

function moveMatchDay(root, num, matchDay){	
		location.href=root + '/soccer/soccerMain.do?matchDay='+matchDay+'&moveMatchDay=' + num;
}

function commboard(root, boardNumber){
	window.open(root + "/soccer/readCommonBoard.do?boardNumber="+boardNumber + ", 공지사항", "width=400, height=200");
	return false; 
	target="_blank";
}

function applicate(root,teamId,leagueCode,leagueTeamNumber){
	if(teamId==""){
		alert("로그인이 필요합니다!");
		var url=root+"";
		window.open(url,"","height=350 width=350");
	}
	
	var url=root+"/league/applicate.do?teamId="+teamId+"&leagueCode="+leagueCode+"&leagueTeamNumber="+leagueTeamNumber;
	$(location).attr("href",url);
}

