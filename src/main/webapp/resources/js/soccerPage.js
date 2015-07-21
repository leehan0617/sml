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
	   
	   function showAgeChart(root,sportCode){
		   var addr = root+"/showAgeChart?sportCode="+sportCode;
		   
		   $.ajax({
			  type:"GET",
			  url:addr,
			  success:function(data){
				  $("#soccerLineChart").hide();
				  $("#soccerBarChart").hide();
				  $("#soccerPieChart").show();
				  date = new Date();first=0;second=0;third=0;fourth=0;fifth=0;others=0;list = data.list;
				  for(var i = 0 ; i < list.length ; i++){
					  if(date.getFullYear()-list[i].memberBirth.substr(0,4) >=10 && date.getFullYear()-list[i].memberBirth.substr(0,4) <20 ){
						  first ++;
					  }else if(date.getFullYear()-list[i].memberBirth.substr(0,4) >=20 && date.getFullYear()-list[i].memberBirth.substr(0,4) <30){
						  second ++;
					  }else if(date.getFullYear()-list[i].memberBirth.substr(0,4) >=30 && date.getFullYear()-list[i].memberBirth.substr(0,4) <40){
						  third ++;
					  }else if(date.getFullYear()-list[i].memberBirth.substr(0,4) >=40 && date.getFullYear()-list[i].memberBirth.substr(0,4) <50){
						  fourth ++;
					  }else if(date.getFullYear()-list[i].memberBirth.substr(0,4) >=50 && date.getFullYear()-list[i].memberBirth.substr(0,4) <60){
						  fifth ++;
					  }else{
						  others ++;
					  }
				  }
				  $.jqplot('soccerPieChart',[[['10대',first],['20대' , second] , ['30대' , third] , ['40대' , fourth] , ['50대' , fifth] , ['기타' , others]]],
							{  
	 					seriesDefaults:{
	 						renderer : $.jqplot.PieRenderer,
	 						rendererOptions:{
	 							showDataLabels:true,
	 							animation:{
	 								speed:2500
	 							}
	 						}
	 					},
	 					title:'연령별 통계',
	 					legend:{show:true,location:'e'}
	 				});
			  }
		   });
	   }
	    
	   function showCityChart(root,sportCode){
		   var addr = root+"/showCityChart?sportCode="+sportCode;
		   
		   $.ajax({
			  type:"GET",
			  url:addr,
			  success:function(data){
				  console.log(data);
				  $("#soccerPieChart").hide();
				  $("#soccerLineChart").hide();
				  $("#soccerBarChart").show();
				  
				  first=0;second=0;third=0;fourth=0;fifth=0;sixth=0;others=0;
				  list=data.list;
				  for(var i=0;i<list.length;i++){
					  if(list[i].memberRegion.substr(0,2) =='서울'){
						  first++;
					  }else if(list[i].memberRegion.substr(0,2)=='경기' || list[i].memberRegion.substr(0,2)=='인천' ){
						second++;  
					  }else if(list[i].memberRegion.substr(0,2)=='강원'){
						third++;  
					  }else if(list[i].memberRegion.substr(0,2)=='충청' || list[i].memberRegion.substr(0,2)=='대전'){
						fourth++;  
					  }else if(list[i].memberRegion.substr(0,2)=='경상' || list[i].memberRegion.substr(0,2)=='부산' || list[i].memberRegion.substr(0,2)=='대구' || list[i].memberRegion.substr(0,2)=='울산'){
						fifth++;  
					  }else if(list[i].memberRegion.substr(0,2)=='전라' || list[i].memberRegion.substr(0,2)=='광주'){
						sixth++;  
					  }else{
						others++;  
					  }
				  }
				  $.jqplot('soccerBarChart',[[['서울',first],['경기' , second] , ['강원' , third] , ['충청도' , fourth] , ['경상도' , fifth] , ['전라도' , sixth],['기타',others]]],
						  {
		   				title:'지역별 통계',
		   				series:[{renderer:$.jqplot.BarRenderer}],
		   				axes:{
		   					xaxis:{
		   						renderer:$.jqplot.CategoryAxisRenderer,
		   						label:'지역'
		   						},
		   					yaxis:{
		   						label:'회원수'
		   						}
		   					}
		   				}				  
				  );

			  }
		   });
		  		
	   }
	   
	   function showDayChart(root,sportCode){
		   var addr = root+"/showDayChart?sportCode="+sportCode;
		   
		   $.ajax({
			  type:"get",
			  url:addr,
			  success:function(data){
				console.log(data);
				list=data.list;
				spring=0;summer=0;fall=0;winter=0;
				for(var i=0;i<list.length;i++){
					if(list[i].month == null){
						garbage++;
					}
					if(list[i].month>=3 && list[i].month<=5){
						spring++;
					}else if(list[i].month>=6 && list[i].month<=8){
						summer++;
					}else if(list[i].month>=9 && list[i].month<=11){
						fall++;
					}else if(list[i].month>=12 || list[i].month<=2){
						winter++;
					}
				}
				
				$("#soccerPieChart").hide();
				$("#soccerBarChart").hide();
				$("#soccerLineChart").show();
				 $.jqplot('soccerLineChart',[[spring,summer,fall,winter]],
				  			{
							title:'연령별 통계',
							axes:{
								xaxis:{
									label:'시즌'
									},
								yaxis:{
									label:'계절별 게임 진행 횟수'
									}
								}
						});

				
			  }
		  
		   });
	   }
	   
	   function showLeagueInfo(root,sportCode){
		   var addr = root+"/showLeagueInfo?sportCode="+sportCode;
		   
		   $.ajax({
			  type:"GET",
			  url:addr,
			  success:function(data){
				  console.log(data);
				 		
				  for(value in data.list){
					  var src = root +'/img/leagueImg/';
					  var img = data.list[value].leagueImage;
					  var imgSrc = src+img;
					  var text = '<div class="item">' +"<img src="+imgSrc+"/><div class='carousel-caption'>"+data.list[value].leagueName+'</div></div>';
					
					  $('#leagueOl').append('<li data-target="#carousel-example-generic" data-slide-to='+(value+1)+'</li>');
					  $('#leagueDiv').append(text);	
				  }
				
				   			  
				}
		   });
	   }
	   
	   function leagueTable(root , sportCode,teamName){
		   var addr = root +"/leagueTable?sportCode="+sportCode;
		   $("#leagueTable").empty();
		   //alert(teamName);
		   $.ajax({
			  type:"GET",
			  url:addr,
			  success:function(data){
				  console.log(data);
				  leagueList = data.leaguelist;
				  leagueJoin = data.leagueJoin;
				  
				  var check="YES";
				  for(index in leagueList){
					  $("#leagueTable").append('<tr><td><a data-toggle="modal" data-target="#modalLeagueInfo" onclick=modalLeague('+'"'+root+'",'+leagueList[index].leagueCode+',"'+leagueList[index].leagueName+'","'+leagueList[index].leagueRegion+'",'+leagueList[index].leagueTeamNumber+',"'+leagueList[index].leagueDay+'","'+leagueList[index].leagueTime+'","'+leagueList[index].leagueStartDate+'","'+leagueList[index].leagueEndDate+'","'+check+'","'+teamName+'")>'+leagueList[index].leagueName+"</a></td><td>"+leagueList[index].leagueStartDate+" ~ "+leagueList[index].leagueEndDate+"</td><td>"+leagueList[index].leagueRegion+"</td><td>"+check+"</td></tr>");
				  }
			  }
		   });
	   }
	   
	   function modalLeague(root,leagueCode,name,region,limitNumber,leagueDay,leagueTime,startDate,endDate,check,teamName){
		   //alert(root+","+code+','+name+','+region+','+limitNumber+','+leagueDay+','+leagueTime+','+startDate+','+endDate);
		   $('#modalLeagueFooter').empty();
		   $('#leagueName').val(name);
		   $('#leagueRegion').val(region);
		   $('#leagueDate').val(startDate + " ~ " + endDate);
		   $('#limitTeam').val(limitNumber+"팀");
		   $('#leagueTime').val(leagueTime+"시");
		   $('#hiddenCode').val(leagueCode);
		   if(check == "YES"){
			   if(teamName == null || teamName ==''){
				   alert("리그신청은 로그인후 이용해 주세요.");
			   }else{
				   var url=root+"/league/applicate.do?leagueCode="+leagueCode+"&teamName="+teamName+"&leagueTeamNumber="+limitNumber;
				   //alert(url);
				   $('#modalLeagueFooter').prepend("<a class='btn btn-success' role='button' data-dismiss='modal' onclick=joinLeague(\'"+url+"') >리그신청</a>");
			   }
		   }else{
			   $('#modalLeagueFooter').prepend('<button type="button" class="btn btn-danger" data-dismiss="modal">정원초과</button>');
		   }
		   $('#modalLeagueFooter').append('<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>');

	   }
	   
	   /**
	   function joinLeague(code,root,teamName){
		   var addr = root+'/joinLeague?leagueCode='+code+'&teamName='+teamName;
		   
		   $.ajax({
			  url:addr,
			  type:'get',
			  success:function(data){
				  if(data.value > 0){
					  alert('리그신청이 완료되었습니다. ');  
				  }else{
					  alert('이미 신청한 리그입니다.');
				  }
			  }
		   });
	   }
	   */
	   
	   function joinLeague(addr){
		  // alert(addr);
		  // var addr = url;
		  location.href=addr;
		 
		  
	   }
	   
	   function showRecentMatch(root,sportCode){
		   var addr = root+'/showRecentMatch?sportCode='+sportCode;
		   var array=['headingOne','headingTwo','headingThree','headingFour','headingFive'];
		   var array2=['collapseOne' , 'collapseTwo','collapseThree','collapseFour','collapseFive'];
		   
		   $.ajax({
			  type:"GET",
			  url:addr,
			  success:function(data){
				  console.log(data);
				  var teamA,teamB;
				  for(var i in data.recordList){  
					  $.ajax({
						 type:"GET",
						 url:root+'/findMatchTeams?teamCode='+data.recordList[i].teamCode+'&teamCode2='+data.recordList[i].teamCode2,
						 async:false,
						 success:function(data2){
							 console.log(data2);
							 teamA=data2.teamA;
							 teamB=data2.teamB;
						 }
					  });
					  
					  $("#accordion").append('<div class="panel panel-default"><div class="panel-heading" role="tab" id="'+array[i]+'"><h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#'+array2[i]+'" aria-expanded="true" aria-controls="'+array2[i]+'">'+(data.recordList[i].gameDate.year+1900)+"/"+data.recordList[i].gameDate.month+"/"+data.recordList[i].gameDate.day+":"+teamA+"&nbsp;vs&nbsp;"+teamB+'</a></h4></div><div id="'+array2[i]+'" class="panel-collapse collapse" role="tabpanel" aria-labelledby="'+array[i]+'"><div class="panel-body">'+"경기시간:"+data.recordList[i].gameTime+"<br/>"+"경기장소:"+data.recordList[i].gamePlace+"<br/>"+'</div></div>');   
				  }
				  
			  }
		   });
	   }

	