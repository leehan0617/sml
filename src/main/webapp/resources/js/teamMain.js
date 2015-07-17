function writeReply(root,teamName){
	var replyNickName = $("#replyNickName").val();
	var replyContent = $("#replyContent").val();
	var teamCode = $("#replyTeamCode").val();
	var replyPassword = $("#replyPassword").val();
	
	var addr = root+"/replyWrite?teamCode="+teamCode+"&replyNickName="+replyNickName+"&replyPassword="+replyPassword+"&replyContent="+replyContent;
	//alert(addr);
	
	$.ajax({
		type:"get",
		url:addr,
		success:function(data){
			$(".replyFirst").prepend(data);
			$("#replyNickName").val("");
			$("#replyContent").val("");
			$("#replyPassword").val("");
		}
	});
}

function moreReadReply(root,teamCode,replyPageNumber){
	
	var addr = root+"/replyMoreRead?teamCode="+teamCode+"&replyPageNumber="+replyPageNumber;
	
	$.ajax({
		type:"get",
		url:addr,
		success:function(data){
			$(".alert-warning").hide();
			$(".replyWrap").append(data);
		}
	});
}

function deleteReply(root , teamCode , replyCode){
	var addr = root+"/replyDelete?teamCode="+teamCode+"&replyCode="+replyCode;
	
	$.ajax({
		type:"get",
		url:addr,
		success:function(data){
			$("."+replyCode).remove();
		}
	});
}


//teamboard
function getTeamBoardData(root , teamName){
	var addr = root+"/teamPage/viewTeamBoard.do?teamName="+teamName;

	$.ajax({
		type:"get",
		url:addr,
		success:function(data){
			console.log(data);
			var boardList = data.teamBoardList;
			var count = data.count;
			var boardSize = data.boardSize;
			var blockSize = data.blockSize;
			var blockCount = data.blockCount;
			var currentPage = data.currentPage;
			var rs = Math.floor((currentPage-1)/blockSize);
			var startBlock = rs*blockSize+1;
			var endBlock = startBlock+blockSize-1;
			
			$.each(boardList,function(i,val){
				$('.teamBoardTbody').append('<tr><td>'+boardList[i].rnum+"</td><td><li><a data-toggle='modal' data-target='#modalTeamBoardRead' onclick=readTeamBoard(\'"+root+"\','"+teamName+"','"+currentPage+"','"+boardList[i].boardNumber+"')>"+boardList[i].boardTitle+'</td><td>'+boardList[i].boardWriter+'</td><td>'+
									(boardList[i].boardDate.year+1900)+'-'+(boardList[i].boardDate.month+1)+'-'+boardList[i].boardDate.date+'</td></tr>');
			});
			
			if(startBlock > blockSize){
				$('.pager').append("<li><a onclick=paging(\'"+root+"\','"+teamName+"','"+(startBlock-blockSize)+"')>"+'Previous'+"</a></li>");
			}
			
			for(var i=startBlock ; i<=endBlock ; i++){
				$('.pager').append("<li><a onclick=paging(\'"+root+"\','"+teamName+"','"+i+"')>"+i+"</a></li>");	
			}
			
			if(endBlock < blockCount){
				$('.pager').append("<li><a onclick=paging(\'"+root+"\','"+teamName+"','"+(startBlock+blockSize)+"')>"+'Next'+"</a></li>");
			}
		}
	});
}

function paging(root,teamName,blockNumber){
	var addr = root+"/paging?teamName="+teamName+"&currentPage="+blockNumber;
	
	$.ajax({
		type:"get",
		url:addr,
		success:function(data){
			console.log(data);
			var boardList = data.teamBoardList;
			var count = data.count;
			var boardSize = data.boardSize;
			var blockSize = data.blockSize;
			var blockCount = data.blockCount;
			var currentPage = data.currentPage;
			var rs = Math.floor((currentPage-1)/blockSize);
			var startBlock = rs*blockSize+1;
			var endBlock = startBlock+blockSize-1;

			$('.teamBoardTbody').empty();
			$('.pager').empty();
			$.each(boardList,function(i,val){
				$('.teamBoardTbody').append('<tr><td>'+boardList[i].rnum+"</td><td><li><a data-toggle='modal' data-target='#modalTeamBoardRead' onclick=readTeamBoard(\'"+root+"\','"+teamName+"','"+currentPage+"','"+boardList[i].boardNumber+"')>"+boardList[i].boardTitle+'</td><td>'+boardList[i].boardWriter+'</td><td>'+
									(boardList[i].boardDate.year+1900)+'-'+(boardList[i].boardDate.month+1)+'-'+boardList[i].boardDate.date+'</td></tr>');
			});

			if(startBlock > blockSize){
				$('.pager').append("<li><a onclick=paging(\'"+root+"\','"+teamName+"','"+(startBlock-blockSize)+"')>"+'Previous'+"</a></li>");
			}
			
			for(var i=startBlock ; i<=endBlock ; i++){
				$('.pager').append("<li><a onclick=paging(\'"+root+"\','"+teamName+"','"+i+"')>"+i+"</a></li>");	
			}
			
			if(endBlock < blockCount){
				$('.pager').append("<li><a onclick=paging(\'"+root+"\','"+teamName+"','"+(startBlock+blockSize)+"')>"+'Next'+"</a></li>");
			}
		}
	});

} 

function emptyContent(){
   //배경눌렀을때도 empty해야하는데 방법 모름;
   $(".teamBoardTbody").empty();
   $(".pager").empty();
}

function readTeamBoard(root , teamName , currentPage , boardNumber){
	   $("#modalTeamBoard").toggle();
	   var addr = root+"/teamPage/readTeamBoard.do?teamName="+teamName+"&currentPage="+currentPage+"&boardNumber="+boardNumber;
	   
	   $.ajax({
		   type:"get",
		   url:addr,
		   success:function(data){
			   console.log(data);
			   var board = data.board;
			   $("#recipient-name").attr('value' , board.boardTitle);
			   $("#message-text").text(board.boardContent);
		   }
	   });
}

function teamBoardToggle(){
	   $("#modalTeamBoard").toggle();
}

function modalWriteTeamBoard(root,teamName,teamCode){
	teamBoardToggle();
	var title = $("#teamBoardTitle").val();
	var content = $("#teamBoardContent").val();
	var addr = root+"/writeTeamBoard?teamName="+teamName+"&teamCode="+teamCode+"&title="+title+"&content="+content;
	
	$.ajax({
		url:addr,
		type:"get",
		success:function(data){
			$("#teamBoardTitle").val("");
			$("#teamBoardContent").val("");
			
			emptyContent();
			getTeamBoardData(root,teamName);
		}
	});
}


