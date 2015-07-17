	function viewSoccerBoard(root,sportCode,currentPage){
		var addr = root+"/viewSoccerBoard?sportCode="+sportCode+"&currentPage="+currentPage;
		
		$.ajax({
			type:"get",
			url:addr,
			success:function(data){
				console.log(data);
				var boardSize = data.boardSize;
				var blockCount = data.blockCount;
				var blockSize = data.blockSize;
				var currentPage = data.currentPage;
				var count = data.count;
				var list = data.soccerBoardList;
				var rs = Math.floor((currentPage-1)/blockSize);
				var startBlock = rs*blockSize+1;
				var endBlock = startBlock+blockSize-1;
				
				$(".soccerBody").empty();
				$(".pager").empty();
				
				$.each(list,function(i,val){
					$('.soccerBody').append('<tr><td>'+list[i].boardNumber+"</td><td><a data-toggle='modal' data-target='#modalSoccerBoardRead' onclick=readSoccerBoard(\'"+root+"\','"+sportCode+"','"+currentPage+"','"+list[i].boardNumber+"')>"
										+list[i].boardTitle+'</td><td>'+list[i].boardWriter+'</td><td>'+
										(list[i].boardDate.year+1900)+'-'+(list[i].boardDate.month+1)+'-'+list[i].boardDate.date+'</td></tr>');
				});
				
				if(startBlock > blockSize){
					$('.pager').append("<li><a onclick=viewSoccerBoard(\'"+root+"\','"+sportCode+"','"+(startBlock-blockSize)+"')>"+'Previous'+"</a></li>");
				}
				
				for(var i=startBlock ; i<=endBlock ; i++){
					$('.pager').append("<li><a onclick=viewSoccerBoard(\'"+root+"\','"+sportCode+"','"+i+"')>"+i+"</a></li>");	
				}
				
				if(endBlock < blockCount){
					$('.pager').append("<li><a onclick=viewSoccerBoard(\'"+root+"\','"+sportCode+"','"+(startBlock+blockSize)+"')>"+'Next'+"</a></li>");
				}

			}
		});
	}
	
	function readSoccerBoard(root, sportCode , currentPage , boardNumber){
		  $("#modalSoccerBoard").toggle();
		   var addr = root+"/readSoccerBoard?sportCode="+sportCode+"&currentPage="+currentPage+"&boardNumber="+boardNumber;
		  
		   $.ajax({
			   type:"get",
			   url:addr,
			   success:function(data){
				   console.log(data);
				   var board = data.board;
				   $("#soccerBoardTitle").attr('value',board.boardTitle);
				   $("#soccerBoardContent").text(board.boardContent);
			   }
		   });
	}
	
	function modalToggle(){
		$("#modalSoccerBoard").toggle();
	}
	
	