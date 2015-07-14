<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <script src="${root}/js/external/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
	var jsonData='${jsonObject}';
   	var obj=JSON.parse(jsonData);
   	var totalCount=0;
	/*연령별 통계*/
	var year=0;
	var age=0;
	/*연령 카운트*/
 	var oneCount=0;var twoCount=0;var threeCount=0;var fourCount=0;var fiveCount=0;var otherCount=0;
	for(var i in obj.cardsList){
		year=Number(obj.cardsList[i].MEMBERBIRTH.substring(0,4));
		age=2015-year;
/* 		if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[j]){ */
		if(age<20){
			oneCount++;
		}else if(age<30){
			twoCount++;
		}else if(age<40){
			threeCount++;
		}else if(age<50){
			fourCount++;
		}else if(age<60){
			fiveCount++;
		}else{
			otherCount++;
		}
		totalCount++;
	} 
	
	/* 차트 구현 */		
	   google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['Task', 'Hours per Day'],
        /*지역별 차트*/
        ['10대',oneCount],
        ['20대',twoCount],
        ['30대',threeCount],
        ['40대',fourCount],
        ['50대',fiveCount],
        ['기타',otherCount],

      ]);

      var options = {
        title: 'SML Korea 회원 지역별 통계'+"\t"+"가입회원수"+totalCount,
        is3D: true,
      };

      var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
      chart.draw(data, options);
    }
</script>
</head>
<body>
	<div id="piechart_3d" style="width: 900px; height: 500px;"></div>
</body>
</html>