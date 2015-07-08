<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>	

	<div>	
		<span>종목</span>
		<span>이름</span>
		<span>성별</span>
		<span>생년월일</span>
		<span>주소</span>
		<span>연락처</span>			
	</div>
	
	<c:if test="${refereeList==null }">
		<div>	
			<span>검색결과가 없습니다.</span>												
		</div>
	</c:if>
	
	<c:if test="${refereeList!=null}">
		<div>	
			<c:forEach var="referee" items="${refereeList}">				
				<div>	
							<span>${referee.refereeSport }</span>
							<span>${referee.refereeName}</span>
							<span>${referee.refereeGender }</span>
							<span>${referee.refereeBirth}</span>
							<span>${referee.sido} ${referee.gugun}</span>
							<span>${referee.refereePhoneNumber}</span>
							<c:if test="${referee.refereeYes==0 }">
								<input type="button" value="거절" onclick="location.href='${root}/admin/refereeDelete.do?pageNumber=${currentPage}&refereeNumber=${referee.refereeNumber }'"/>
								<input type="button" value="수락" onclick="location.href='${root}/admin/refereeAccept.do?pageNumber=${currentPage}&refereeNumber=${referee.refereeNumber }'"/>
								<span></span>	
							</c:if>
							<c:if test="${referee.refereeYes==1 }">
								<input type="button" value="삭제" onclick="location.href='${root}/admin/refereeDelete.do?pageNumber=${currentPage}&refereeNumber=${referee.refereeNumber }'"/>
							</c:if>												
				</div>
			</c:forEach>															
		</div>	
	</c:if>
	
	<!-- 심판 검색 -->
	<div>
		<form action="${root }/admin/refereeSearch.do" method="get" id="search-box" onsubmit="if(this.q.value ==' 심판 검색'){this.q.focus();return false;}">
			<input type="text" name="refereeName" style="color: #D2D2D2;" value="심판 검색" onfocus="this.value='' "/>
			<input type="submit" value="검색"/>
		</form>
	</div>
	
	<!-- 페이지 번호 -->
	<center>
		<c:if test="${count>0 }">
			<c:set var="pageBlock" value="${5}"/>
			
			<fmt:parseNumber var="pageCount" value="${count/boardSize+ (count/boardSize==0 ? 0:1) }" integerOnly="true"/>
			
			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
			<c:set var="startPage" value="${rs*pageBlock+1 }"/>
			<c:set var="endPage" value="${startPage+pageBlock-1 }"/>			
			<c:if test="${endPage>pageCount }">
				<c:set var="endPage" value="${pageCount }"/>
			</c:if>
			
			<c:if test="${startPage>pageBlock }">
				<a href="${root }/referee/refereeList.do?pageNumber=${startPage-pageBlock }">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage}">
				<a href="${root }/referee/refereeList.do?pageNumber=${i}">[${i }]</a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<a href="${root }/referee/refereeList.do?pageNumber=${startPage+pageBlock }">[다음]</a>
			</c:if>
		</c:if>
	</center>
</body>
</html>