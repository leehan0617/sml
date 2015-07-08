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