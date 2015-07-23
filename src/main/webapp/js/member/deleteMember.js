function deleteMember(root,rnum,pageNumber,memberCode,teamName,teamCode,teamGrade){		
	
	var value=confirm("정말로 삭제하시겠습니까?");
	if(value==true){
		location.href=root+"/teamPage/deleteMember.do?pageNumber="+pageNumber + "&memberCode=" + memberCode+ "&teamName=" + teamName+ "&teamCode=" + teamCode+ "&teamGrade=" + teamGrade;
	}
	}
