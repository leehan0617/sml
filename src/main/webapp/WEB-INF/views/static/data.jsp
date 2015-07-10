<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function staticData(){
    StringBuilder sb = new StringBuilder();
    int interval = 16;
  
    rs = 데이터쿼리 
   
    sb.append("[['element','cnt'],");
   
    if(rsCnt > 0)
    {
        while(rs.next()) 
        {
           sb.append("['" + rs[0] + "'," + rs[1] + "],");
        }
    }
     
    sb.append("]");
    
    sb.toString()
}
</script>
</head>
<body>

</body>
</html>