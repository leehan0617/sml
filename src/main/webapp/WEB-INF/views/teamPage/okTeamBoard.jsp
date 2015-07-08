<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/js/external/jquery-1.11.3.min.js"></script>
<body>
	<c:if test="${writeValue!=null}">
		<c:if test="${writeValue>0}">
			<script type="text/javascript">
				alert("글이 작성되었습니다.");
				$(location).attr("href","${root }/teamPage/manageTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}"); 
			</script>
		</c:if>
		
		<c:if test="${writeValue==0}">
			<script type="text/javascript">
				alert("글 작성에 실패하였습니다.");
				$(location).attr("href","${root }/teamPage/manageTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}"); 
			</script>
		</c:if>
	</c:if>
	
	<c:if test="${deleteValue!=null}">
		<c:if test="${deleteValue>0}">
			<script type="text/javascript">
				alert("글이 삭제되었습니다.");
				$(location).attr("href","${root }/teamPage/manageTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}"); 
			</script>
		</c:if>
		
		<c:if test="${deleteValue==0}">
			<script type="text/javascript">
				alert("글 삭제에 실패하였습니다.");
				$(location).attr("href","${root }/teamPage/manageTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}"); 
			</script>
		</c:if>
	</c:if>
	
	<c:if test="${updateValue!=null}">
		<c:if test="${updateValue>0}">
			<script type="text/javascript">
				alert("글이 수정되었습니다.");
				$(location).attr("href","${root }/teamPage/manageTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}"); 
			</script>
		</c:if>
		
		<c:if test="${updateValue==0}">
			<script type="text/javascript">
				alert("글 수정에 실패하였습니다.");
				$(location).attr("href","${root }/teamPage/manageTeamBoard.do?teamName=${teamName}&currentPage=${currentPage}"); 
			</script>
		</c:if>
	</c:if>
	
	<c:if test="${memberValue!=null}">
		<c:if test="${memberValue>0}">
			<script type="text/javascript">
				alert("멤버가 추가되었습니다.");
				$(location).attr("href","${root }/teamPage/manageTeamMember.do?teamName=${teamName}&currentPage=${currentPage}"); 
			</script>
		</c:if>
		
		<c:if test="${memberValue==0}">
			<script type="text/javascript">
				alert("멤버 추가에 실패하였습니다.");
				$(location).attr("href","${root }/teamPage/manageTeamMember.do?teamName=${teamName}&currentPage=${currentPage}"); 
			</script>
		</c:if>
	</c:if>
	
	<c:if test="${deleteMemberValue!=null}">
		<c:if test="${deleteMemberValue>0}">
			<script type="text/javascript">
				alert("멤버가 삭제되었습니다.");
				$(location).attr("href","${root }/teamPage/manageTeamMember.do?teamName=${teamName}&currentPage=${currentPage}"); 
			</script>
		</c:if>
		
		<c:if test="${deleteMemberValue==0}">
			<script type="text/javascript">
				alert("멤버 삭제에 실패하였습니다.");
				$(location).attr("href","${root }/teamPage/manageTeamMember.do?teamName=${teamName}&currentPage=${currentPage}"); 
			</script>
		</c:if>
	</c:if>
	
	<c:if test="${matchingCheck!=null}">
		<c:if test="${matchingCheck>0}">
			<script type="text/javascript">
				alert("매칭이 등록되었습니다.");
				$(location).attr("href","${root }/teamPage/teamPageMain.do?teamName=${teamName}"); 
			</script>
		</c:if>
		
		<c:if test="${matchingCheck==0}">
			<script type="text/javascript">
				alert("매칭 등록에 실패하였습니다.");
				$(location).attr("href","${root }/teamPage/teamPageMain.do?teamName=${teamName}"); 
			</script>
		</c:if>
	</c:if>
	
	<c:if test="${matchingDelete!=null}">
		<c:if test="${matchingDelete>0}">
			<script type="text/javascript">
				alert("매칭이 취소되었습니다.");
				$(location).attr("href","${root }/teamPage/teamPageMain.do?teamName=${teamName}"); 
			</script>
		</c:if>
		
		<c:if test="${matchingDelete==0}">
			<script type="text/javascript">
				alert("매칭 취소에 실패하였습니다.");
				$(location).attr("href","${root }/teamPage/teamPageMain.do?teamName=${teamName}"); 
			</script>
		</c:if>
	</c:if>
</body>
</html>