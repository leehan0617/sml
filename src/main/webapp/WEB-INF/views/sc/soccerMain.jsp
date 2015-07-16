<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:set var="sportCode" value="0"/>
<!DOCTYPE html>
<html lang="ko"><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>SML Soccer Page</title>

    <!-- Bootstrap core CSS -->
    <link href="${root}/resources/css/bootstrap.css" rel="stylesheet" type="text/css">
	<script src="${root }/resources/js/jquery.js"></script>
	<script src="${root }/resources/js/bootstrap.js"></script>
    <!-- Custom styles for this template -->
    <link href="${root}/resources/css/soccerPage.css" rel="stylesheet" type="text/css">
  </head>
<!-- NAVBAR
================================================== -->
  <body>
    <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="${root }/start.jsp">SML KOREA</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
              	<li class="active"><a href="#" data-toggle='modal' data-target='#modalSoccerBoard' onclick="viewSoccerBoard('${root}','${sportCode }','${currentPage}')">공지사항</a></li>
                <li><a href="#">경기규칙</a></li>
                <li><a href="#about">팀리스트</a></li>
                <li><a href="#contact">심판현황</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">다른종목가기<span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                  	<li class="divider"></li>
                    <li><a href="#">축구</a></li>
                    <li class="divider"></li>
                    <li><a href="#">야구</a></li>
                    <li class="divider"></li>
                    <li><a href="#">족구</a></li>
                    <li class="divider"></li>
                    <li><a href="#">풋살</a></li>
                    <li class="divider"></li>
                  </ul>
                </li>
                <li>
	                <form class="form-inline"  id="searchForm" name="searchForm" style="padding-top:10px;">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="팀명을 검색하세요." name="teamName" id="searchTeamName">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" id="goTeamPage">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>
							</span>
						</div><!-- /input-group -->			
					</form>
                </li>
              </ul>
            </div>
          </div>
        </nav>

      </div>
    </div>


    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class=""></li>
        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
        <li data-target="#myCarousel" data-slide-to="2" class="active"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item">
          <img class="first-slide" src="${root }/resources/images/soccer01.jpg" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>WELCOME SML SOCCER PAGE </h1>
              <p>이 페이지에는 축구에 관련된 리그 및 팀들간 정보가 있습니다.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Default Button</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="${root }/resources/images/soccer03.jpg" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>공지사항</h1>
              <p>축구에 관련된 실시간 소식 및 정보를 여기서 확인해주세요.</p>
              <p><a class="btn btn-lg btn-primary" role="button" data-toggle='modal' data-target='#modalSoccerBoard' onclick="viewSoccerBoard('${root}','${sportCode }','${currentPage}')">공지사항보기</a></p>
            </div>
          </div>
        </div>
        <div class="item active">
          <img class="third-slide" src="${root}/resources/images/soccer04.jpg" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>다른종목이 궁금하세요?</h1>
              <p>SML KOREA는 축구이외에도 야구,족구,풋살에 관한 친선및리그경기 매칭서비스를 제공하고있습니다.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">다른종목가기</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row">
        <div class="col-lg-4">
          <img class="img-circle" src="${root}/resources/images/notice.png" alt="Generic placeholder image" width="140" height="140">
          <h2>리그 게시판</h2>
          <p>현재 진행중인 리그들에 관심이 있으시면 아래 버튼을 클릭해주세요.</p>
          <p><a class="btn btn-default" href="#" role="button">리그 보기</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="${root}/resources/images/geo.png" width="140" height="140">
          <h2>경기 대진표</h2>
          <p>실시간 경기 대진표를 보여주고 있습니다. 대진표를 보려면 여기를 눌러주세요.</p>
          <p><a class="btn btn-default" href="#" role="button">대진표 보기</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="${root}/resources/images/surface.png" alt="Generic placeholder image" width="140" height="140">
          <h2>통계 자료</h2>
          <p>SML 축구회원 및 팀들간 통계에 관심이 있으시면 아래 버튼을 눌러주세요</p>
          <p><a class="btn btn-default" href="#" role="button">통계자료 보기</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->


      <!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It'll blow your mind.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="500x500" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCIgdmlld0JveD0iMCAwIDUwMCA1MDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjE5MC4zMDQ2ODc1IiB5PSIyNTAiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MjNwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj41MDB4NTAwPC90ZXh0PjwvZz48L3N2Zz4=" data-holder-rendered="true">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7 col-md-push-5">
          <h2 class="featurette-heading">Oh yeah, it's that good. <span class="text-muted">See for yourself.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5 col-md-pull-7">
          <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="500x500" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCIgdmlld0JveD0iMCAwIDUwMCA1MDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjE5MC4zMDQ2ODc1IiB5PSIyNTAiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MjNwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj41MDB4NTAwPC90ZXh0PjwvZz48L3N2Zz4=" data-holder-rendered="true">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="500x500" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCIgdmlld0JveD0iMCAwIDUwMCA1MDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjE5MC4zMDQ2ODc1IiB5PSIyNTAiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MjNwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj41MDB4NTAwPC90ZXh0PjwvZz48L3N2Zz4=" data-holder-rendered="true">
        </div>
      </div>

      <hr class="featurette-divider">

      <!-- /END THE FEATURETTES -->


      <!-- FOOTER -->
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>© 2014 Company, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a></p>
      </footer>

    </div><!-- /.container -->
    
    <div class="modal fade" id="modalSoccerBoard" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
 	 <div class="modal-dialog">
    	<div class="modal-content">
    		<div class="modal-header">
    			<h3>공지사항</h3>
    		</div>
    		<div class="modal-body">
    			<table class="table table-striped">
					<thead>
						<tr> 
							<th style="width:15%">글번호</th><th style="width:45%">제목</th><th style="width:15%">작성자</th><th style="width:25%">작성일</th> 
						</tr> 
					</thead>
					<tbody class="soccerBody">	
					</tbody>
				</table>
				<nav>
  					<ul class="pager">
  					</ul>
  				</nav>
    		</div>
      		<div class="modal-footer">
            	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      		</div>
  		</div>
     </div>
   </div>
   
<script>
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
</script>
    
 </body>
 </html>