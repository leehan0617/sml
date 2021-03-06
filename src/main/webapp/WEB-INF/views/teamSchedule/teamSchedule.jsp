<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='${root}/css/carlendar/fullcalendar.css' rel='stylesheet' />
<link href='${root}/css/carlendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<link rel="stylesheet" type="text/css" href="${root}/resources/css/bootstrap.css"/>

<script type="text/javascript" src="${root}/resources/js/jquery.js"></script>
<script src="${root }/resources/js/bootstrap.js"></script>
<script src='${root}/js/carlendar/moment.min.js' type="text/javascript"></script>
<script src='${root}/js/carlendar/jquery.min.js' type="text/javascript"></script>
<script src='${root}/js/carlendar/fullcalendar.min.js' type="text/javascript"></script>
<script src='${root}/js/carlendar/write.js' type="text/javascript"></script>

<script>

	$(document).ready(function() {

		var toDay=new Date();
		var text='${jsonObject}';
	 	var obj=JSON.parse(text);
		
	 	if(obj.scheduleDtoList[0]!=null){
		 	var events_array = [];
		 	for(var i in obj.scheduleDtoList){
		 		var schedule_object =
		 				{
		 					title:obj.scheduleDtoList[i].scheduleTitle,
		 					url:obj.scheduleDtoList[i].scheduleNumber,
		 					start: obj.scheduleDtoList[i].startDate,
		 					end: obj.scheduleDtoList[i].endDate,	
		 				};
		 				events_array.push(schedule_object);
		 		}
	 	}
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month'
			},
			defaultDate: toDay,
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			dayNamesShort: ['일','월','화','수','목','금','토'],
			editable: false,
			eventLimit: true,
			events:events_array,
 	 		eventClick: function(event) {
 	 		   if (event.url) {
 	 			   var scheduleNumber=event.url;
 	 			 var popOption = "top="+(screen.availHeight/2-500/2)+", left="+(screen.availWidth/2-280/2)+",     width=290, height=250, scrollbars=no, location=no";
 	 			   var url="${root}/teamPage/ScheduleContent.do?scheduleNumber="+scheduleNumber;
 	 	            window.open(url,"",popOption);
 	 	            return false;
 	 	        }
			}  
		}); 
});
	
</script>
<style>
	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}
	
</style>
</head>
<body class="jumbotron">
	<div id='calendar'>
		<c:if test="${teamId!=guest}">
			<input  data-toggle="modal" data-target="#scheduleModal" type="button" id="writeButton" class="btn btn-info btn-sm" value="일정입력" onclick="writeSchedule('${root}','${teamName}')"/>
		</c:if>
			<input type="button" id="writeButton" class="btn btn-info btn-sm" value="닫기" onclick="closeSchedule('${root}','${teamName}')"/>
	</div>
	 <!-- Modal -->
	  <div class="modal fade" id="scheduleModal" role="dialog">
	    <div class="modal-dialog">
		        <div class="modal-header">
		        </div>
		        
		        <div class="modal-content">
		        	<div class="modal-body">
		        		<div id="resultEdit"></div>
		        	</div>
           		    <div class="modal-footer">
						     <div class="modal-footer">
					          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        </div>
		      		</div> 
	   		    </div>	
	    </div>
	   </div>				
</body>
</html>
