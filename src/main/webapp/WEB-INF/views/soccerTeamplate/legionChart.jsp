<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

    <script src="${root}/js/external/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
	var jsonData='${jsonObject}';
   	var obj=JSON.parse(jsonData);
    /*지역별 통계*/
    var legion=new Array("서울","강원","경기","대전","대구","부산","충남","울산","인천","제주","광주","경북","전북","전남","경기","경남","세종","충북");
   	var totalCount=0;
    /*지역 카운트변수*/
    var seoulCount=0;var gangWonCount=0;var gyeonggiCount=0;var daejeonCount=0;var daeguCount=0;var busanCount=0;var chungnamCount=0;
    var ulsanCount=0;var enchanCount=0;var jaejuCount=0;var gwangjuCount=0;var kyoungbukCount=0;var jeonbukCount=0;var gyeonggiCount=0;
    var gyeonnamCount=0;var seojongCount=0;var chongbukCount=0;var jeonnamCount=0;
    
   	 for(var i in obj.cardsList){
		for(var j=0;j<legion.length;j++){
			 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[j]){
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[0])seoulCount++;
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[1])gangWonCount++;
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[2])gyeonggiCount++;
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[3])daejeonCount++;
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[4])daeguCount++;
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[5])busanCount++;
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[6])chungnamCount++;
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[7])ulsanCount++;
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[8])enchanCount++;
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[9])jaejuCount++;
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[10])gwangjuCount++;
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[11])kyoungbukCount++;
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[12])jeonbukCount++;
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[13])jeonnamCount++;
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[14])gyeonggiCount++;
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[15])gyeonnamCount++;
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[16])seojongCount++;
				 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]==legion[17])chongbukCount++; 
				 totalCount++;
			 }
		}
   	  }
   	 
	 
		 
	/* 차트 구현 */		
	   google.load("visualization", "1", {packages:["corechart"]});
       google.setOnLoadCallback(drawChart);
       function drawChart() {
         var data = google.visualization.arrayToDataTable([
           ['Task', 'Hours per Day'],
           /*지역별 차트*/
           ['서울',seoulCount],
           ['강원',gangWonCount],
           ['경기',gyeonggiCount],
           ['대전',daejeonCount],
           ['대구',daeguCount],
           ['부산',busanCount],
           ['충남',chungnamCount],
           ['울산',ulsanCount],
           ['인천',enchanCount],
           ['제주',jaejuCount],
           ['광주',gwangjuCount],
           ['경북',kyoungbukCount],
           ['전북',jeonbukCount],
           ['전남',jeonnamCount],
           ['경기',gyeonggiCount],
           ['경남',gyeonnamCount],
           ['세종',seojongCount],
           ['충북',chongbukCount],
         ]);

         var options = {
           title: 'SML Korea 회원 지역별 통계'+"\t"+"("+totalCount+")",
           is3D: true,
         };

         var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
         chart.draw(data, options);
       }
	
    </script>
 
    <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
 
