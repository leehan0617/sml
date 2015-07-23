$(function(){	
	//롤러 스크립트
	$.fn.extend({
		Scroll:function(opt,callback){
				if(!opt) var opt={};
				var toint=function (str){
					if(str=='auto'||str.length<=0){
						str=0;
					}else{
						str=parseInt(str);
					}
					return str;
				}
				var _btnUp = $(opt.up);
				var _btnDown = $(opt.down);
				var timerID;
				var _this=this.eq(0).find("ul:first");
				var lineH=_this.find("li:first").width(), 
					line=opt.line?parseInt(opt.line,10):parseInt(this.width()/lineH,10), 
					speed=opt.speed?parseInt(opt.speed,10):500; 
					timer=opt.timer;

				if(line==0) line=1;
				var upHeight=0-line*lineH;
				

				_this.parent().css({overflow:'hidden'});
				var getWidth=function (){
					var _curli=_this.find("li:first");
					upHeight=0-_curli.height()-toint(_curli.css('margin-top'))-toint(_curli.css('margin-bottom'));
					return upHeight;
				}
				var scrollUp=function(){
					_btnUp.unbind("click",scrollUp);
					_this.animate({
							marginTop:getWidth()
					},speed,function(){
							for(i=1;i<=line;i++){
									_this.find("li:first").appendTo(_this);
							}
							_this.css({marginTop:0});
							_btnUp.bind("click",scrollUp);
					});
					return false;
				}
				var scrollDown=function(){
					_btnDown.unbind("click",scrollDown);
					for(i=1;i<=line;i++){
							_this.find("li:last").show().prependTo(_this);
					}
					_this.css({marginTop:getWidth()});
					_this.animate({
							marginTop:0
					},speed,function(){
							_btnDown.bind("click",scrollDown);
					});
					return false;
				}
				var autoPlay = function(){
						if(timer)timerID = window.setInterval(scrollUp,timer);
						return false;
				};
				var autoStop = function(){
						if(timer)window.clearInterval(timerID);
						return false;
				};
				//_this.parent().hover(autoStop,autoPlay).mouseout();
				_btnUp.css("cursor","pointer").click( scrollUp );
				_btnDown.css("cursor","pointer").click( scrollDown );
				if(timer)timerID = window.setInterval(scrollUp,timer);
		}
	})
	
	$("#roll").Scroll({line:1,speed:1500,timer:3000,up:"#topbtnid",down:"#btmbtnid",autoplay:'#bannerplay',autostop:'#bannerstop'});
});

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
			$(".firstReply").hide();
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
			var flag = count%boardSize;
			console.log(flag);
			var pageCount = (count/boardSize+((flag===0)?0:1));
			var currentPage = data.currentPage;
			var rs = Math.floor((currentPage-1)/blockSize);
			var startBlock = rs*blockSize+1;
			var endBlock = startBlock+blockSize-1;
			
			if(endBlock>pageCount){
				endBlock = pageCount;
			}
			console.log("rs:"+rs+",startBlock:"+startBlock+",endBlock:"+endBlock + ",pageCount:"+pageCount);
			//<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1)}"/>
			$.each(boardList,function(i,val){
				$('.teamBoardTbody').append('<tr><td>'+boardList[i].rnum+"</td><td><a data-toggle='modal' data-target='#modalTeamBoardRead' onclick=readTeamBoard(\'"+root+"\','"+teamName+"','"+currentPage+"','"+boardList[i].boardNumber+"')>"+boardList[i].boardTitle+'</td><td>'+boardList[i].boardWriter+'</td><td>'+
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
			var pageCount = Math.floor(count/boardSize+(count%boardSize == 0?0:1));
			var rs = Math.floor((currentPage-1)/blockSize);
			var startBlock = rs*blockSize+1;
			var endBlock = startBlock+blockSize-1;

			$('.teamBoardTbody').empty();
			$('.pager').empty();
			$.each(boardList,function(i,val){
				$('.teamBoardTbody').append('<tr><td>'+boardList[i].rnum+"</td><td><a data-toggle='modal' data-target='#modalTeamBoardRead' onclick=readTeamBoard(\'"+root+"\','"+teamName+"','"+currentPage+"','"+boardList[i].boardNumber+"')>"+boardList[i].boardTitle+'</td><td>'+boardList[i].boardWriter+'</td><td>'+
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

function viewSchedule(root,teamName){
	var popOption = "top="+(screen.availHeight/2-550/2)+", left="+(screen.availWidth/2-550/2)+",     width=550, height=550, scrollbars=no, location=no";
	var url=root+"/teamPage/teamScheduleEdit.do?teamName="+teamName;
	window.open(url,"스케쥴",popOption);
}

