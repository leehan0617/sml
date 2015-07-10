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
 		
   	   
   	var gangWon=null;var seoul=null;var gyeonggi=null;daejeon=null;daegu=null;busan=null;
    var seoulCount=0;var gangWonCount=0;var gyeonggiCount=0;daejeonCount=0;daeguCount=0;busanCount=0;
   	 for(var i in obj.cardsList){
   		 if(obj.cardsList[i].MEMBERREGION.split(" ")[0]=="서울"){
   			seoul=obj.cardsList[i].MEMBERREGION;
   			seoulCount=seoulCount+1;
   		}else if(obj.cardsList[i].MEMBERREGION.split(" ")[0]=="강원"){
   			gangWon=obj.cardsList[i].MEMBERREGION;
   			gangWonCount=gangWonCount+1;
   		}else if(obj.cardsList[i].MEMBERREGION.split(" ")[0]=="경기"){
   			gyeonggi=obj.cardsList[i].MEMBERREGION;
   			gyeonggiCount=gyeonggiCount+1;
   		}else if(obj.cardsList[i].MEMBERREGION.split(" ")[0]=="대전"){
   			daejeon=obj.cardsList[i].MEMBERREGION;
   			daejeonCount=daejeonCount+1;
   		}else if(obj.cardsList[i].MEMBERREGION.split(" ")[0]=="대구"){
   			daegu=obj.cardsList[i].MEMBERREGION;
   			daeguCount=daeguCount+1;
   		}else if(obj.cardsList[i].MEMBERREGION.split(" ")[0]=="부산"){
   			busan=obj.cardsList[i].MEMBERREGION;
   			busanCount=daejeonCount+1;
   		} 
   	  }
   	 
   	   google.load("visualization", "1", {packages:["corechart"]});
       google.setOnLoadCallback(drawChart);
       function drawChart() {
         var data = google.visualization.arrayToDataTable([
           ['Task', 'Hours per Day'],
           ['서울',seoulCount],
           ['강원', gangWonCount],
           ['경기',gyeonggiCount],
           ['대전',daejeonCount],
           ['대구',daegu],
           ['부산',busanCount],
         ]);

         var options = {
           title: '지역별 통계',
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