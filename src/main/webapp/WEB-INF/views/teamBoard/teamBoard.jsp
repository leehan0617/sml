<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<script src="${root }/resources/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/bootstrap.css"/>
<c:set var="count" value="${count}"></c:set>
<c:set var="boardSize" value="${boardSize}"></c:set>
<c:set var="blockSize" value="${blockSize}"></c:set>
<c:set var="blockCount" value="${blockCount}"></c:set>
<fmt:parseNumber var="rs" value="${(currentPage-1)/blockSize}" integerOnly="true"></fmt:parseNumber>

<c:set var="startBlock" value="${rs*blockSize+1 }"></c:set>
<c:set var="endBlock" value="${startBlock+blockSize-1}"></c:set>
	
<div class="modal-header">
	<h3 style="text-align:center">공지사항</h3>
</div>

<div class="wrap modal-body">
<div class="ajaxPaging">
	<table class="table table-striped">
		<thead>
			<tr> <th>글번호</th> <th>제목</th> <th>작성자</th><th>작성일</th> </tr> 
		</thead>
		<tbody>
			<c:forEach var="board" items="${teamBoardList}">
			<tr>
				<td style="width:15%">${board.rnum}</td>
				<td style="width:55%">
					<a href="${root }/teamPage/readTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}&boardNumber=${board.boardNumber}"data-toggle="modal" data-target="#modalBoardRead">${board.boardTitle}</a>
				</td>
				<td style="width:15%">${board.boardWriter }</td>
				<td style="width:15%"><fmt:formatDate value="${board.boardDate }" pattern="yy-MM-dd"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
<nav>
  <ul class="pager">
  	<c:if test="${startBlock>blockSize}">
  		<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${teamName}&currentPage=${startBlock-blockSize}">Previous</a></li>
  	</c:if>
  	<c:if test="${endBlock>blockCount}">
		<c:set var="endBlock" value="${blockCount}"></c:set>
	</c:if>
	<c:forEach var="blockNumber" begin="${startBlock }" end="${endBlock }">
		<li><a onclick="paging('${root }','${teamName}','${blockNumber }')">${blockNumber }</a>
	</c:forEach>
    <c:if test="${endBlock<blockCount}">
		<li><a href="${root }/teamPage/viewTeamBoard.do?teamName=${teamName}&currentPage=${startBlock+blockSize}">Next</a></li>
	</c:if>
		<li style="float:right;"><button class="btn btn-danger" data-dismiss="modal">닫기</button></li>
	<c:if test="${teamGrade !=null }">
		<li style="float:right;"><button class="btn btn-primary">글쓰기</button></li>
	</c:if>
  </ul>
  
</nav>
	
</div>
</div>

<div class="modal fade" id="modalBoardRead" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">      
		    </div>
		  </div>
</div>

 <script>
	function paging(root,teamName,blockNumber){
		var addr = root+"/paging?teamName="+teamName+"&currentPage="+blockNumber;
		
		$.ajax({
			type:"get",
			url:addr,
			success:function(data){
				$(".ajaxPaging").remove();
				$(".wrap").append(data);
			}
		});

	}
</script>	

