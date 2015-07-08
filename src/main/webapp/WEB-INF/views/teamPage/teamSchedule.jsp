<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
    <head>
         <title> ½ºÄÉÁì°ü¸® </title>
<link rel='stylesheet' href='${root}/css/carlendar/fullcalendar.css' />
<script type="text/javascript" src='${root}/css/carlendar/jquery.min.js'></script>
<script type="text/javascript" src='${root}/css/carlendar/moment.min.js'></script>
<script type="text/javascript" src='${root}/css/carlendar/fullcalendar.js'></script>
<link rel='stylesheet' type='text/css' href='${root}/css/carlendar/fullcalendar.css' />
<script type='text/javascript' src='${root}/css/carlendar/jquery.min.js'></script>
<script type='text/javascript' src='${root}/css/carlendar/jquery-ui.custom.min.js'></script>
<script type='text/javascript' src='${root}/css/carlendar/fullcalendar.min.js'></script>
<script type="text/javascript">
 $(document).ready(function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
    	events: [
    	         // events here
    	     ],
    	     editable: true,
    	     eventDrop: function(event,dayDelta,minuteDelta,allDay,revertFunc) {

    	         alert(
    	             event.title + " was moved " +
    	             dayDelta + " days and " +
    	             minuteDelta + " minutes."
    	         );

    	         if (allDay) {
    	             alert("Event is now all-day");
    	         }else{
    	             alert("Event has a time-of-day");
    	         }

    	         if (!confirm("Are you sure about this change?")) {
    	             revertFunc();
    	         }

    	     }
    })

}); 

</script>
</head>

    <body>

        <div id='calendar'></div>

    </body>
</html>