/**
 * 
 */

function insertGameResult(root , gameCode){
	alert(gameCode);
	var addr = root+"/admin/insertGameResult.do?gameCode="+gameCode;

//	$.ajax({
//		type:"get",
//		url:addr,
//		success:function(data){
//			console.log(data);
//			var boardList = data.teamBoardList;
//			var count = data.count;
//			var boardSize = data.boardSize;
//			var blockSize = data.blockSize;
//			var blockCount = data.blockCount;
//			var currentPage = data.currentPage;
//			var rs = Math.floor((currentPage-1)/blockSize);
//			var startBlock = rs*blockSize+1;
//			var endBlock = startBlock+blockSize-1;
//			
//			$.each(boardList,function(i,val){
//				$('.teamBoardTbody').append('<tr><td>'+boardList[i].rnum+"</td><td><li><a data-toggle='modal' data-target='#modalTeamBoardRead' onclick=readTeamBoard(\'"+root+"\','"+teamName+"','"+currentPage+"','"+boardList[i].boardNumber+"')>"+boardList[i].boardTitle+'</td><td>'+boardList[i].boardWriter+'</td><td>'+
//									(boardList[i].boardDate.year+1900)+'-'+(boardList[i].boardDate.month+1)+'-'+boardList[i].boardDate.date+'</td></tr>');
//			});
//			
//			if(startBlock > blockSize){
//				$('.pager').append("<li><a onclick=paging(\'"+root+"\','"+teamName+"','"+(startBlock-blockSize)+"')>"+'Previous'+"</a></li>");
//			}
//			
//			for(var i=startBlock ; i<=endBlock ; i++){
//				$('.pager').append("<li><a onclick=paging(\'"+root+"\','"+teamName+"','"+i+"')>"+i+"</a></li>");	
//			}
//			
//			if(endBlock < blockCount){
//				$('.pager').append("<li><a onclick=paging(\'"+root+"\','"+teamName+"','"+(startBlock+blockSize)+"')>"+'Next'+"</a></li>");
//			}
//		}
//	});
}