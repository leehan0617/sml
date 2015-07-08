$(function(){
	$('#step2').click(function(){
		$('#popupJoin').modal('toggle');
	});
	
	$('#prevStep1').click(function(){
		$('#popupJoin').modal('toggle');
		$('#popupJoin2').modal('toggle');
	});
	
	$("#date1").datepicker({
			dateFormat:"yy-mm-dd",
			yearRange: "1950:2015",
			dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
            dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			closeText:'닫기',
			showButtonPanel: true,
			changeYear:true,
			changeMonth:true
	});
});