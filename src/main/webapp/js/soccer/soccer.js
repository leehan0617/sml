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
		alert("로그인후 이용해주시기 바랍니다!");
		return false;
	}
	
	var url=root+"/league/applicate.do?teamId="+teamId+"&leagueCode="+leagueCode+"&leagueTeamNumber="+leagueTeamNumber;
	$(location).attr("href",url);
}


function sModal(root,boardNumber){
	var addr=root+"/soccer/readCommonBoard.do?boardNumber="+boardNumber;
	$.ajax({
		type:"get",
		url:addr,
		success:function(data){
			console.log(data);
			var boardNum=data.commonBoard.boardNumber;
			var boardTitle=data.commonBoard.boardTitle;
			var boardContent=data.commonBoard.boardContent;
			var date=data.commonBoard.boardDate.year+1900+'-'+(data.commonBoard.boardDate.month+1)+'-'+data.commonBoard.boardDate.date
			
			$('.soccerBoardTbody').append('<tr><td>'+boardNum+'</td>'+'<td>'+boardTitle+'</td>'+'<td>'+boardContent+'</td>'+'<td>'+date+'</td></tr>');
		}
	});
}


