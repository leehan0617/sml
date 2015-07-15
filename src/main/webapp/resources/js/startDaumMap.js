/**
 * 
 */
$(document).ready(function(){
	var markers=[];
	var mapList;
	var currentIdx;
	
	var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	// 마커 이미지의 이미지 크기 입니다
    var imageSize = new daum.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨 
    }; 
	
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            message = ''; // 인포윈도우에 표시될 내용입니다
	        
	        // 마커와 인포윈도우를 표시합니다
	        displayMarker(locPosition, message);
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMarker(locPosition, message);
	}
	
	
	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places();
	
	$.ajax({
	    url : "/home/map/startMap.do",
	    type : "GET",
	    success : function(data) {
	    	mapList=data.mapList;
	    	for(var i=0; i<mapList.length;i++){
	    		
	    		if(mapList[i].GROUND!=null){
	    			displayTeamMap(mapList[i]);
	    		}
	    	}
	    	
	    }
	});
	
	function displayTeamMap (mapList){
		
		ps.keywordSearch(mapList.GROUND, addMarker); 
		
		function addMarker(status, data, pagination) {
		    if (status === daum.maps.services.Status.OK) {
		    	
		        var placePosition = new daum.maps.LatLng(data.places[0].latitude, data.places[0].longitude);
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: placePosition,
		            image : markerImage, // 마커 이미지 
		            title : mapList.TEAMNAME
		        });
		        
		     // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
		        var iwContent = '<div style="padding:5px;">'+ mapList.TEAMNAME+'</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

		        // 인포윈도우를 생성합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content : iwContent
		        });
		        
		     // 마커에 마우스오버 이벤트를 등록합니다
		        daum.maps.event.addListener(marker, 'mouseover', function() {
		          // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		            infowindow.open(map, marker);
		        });

		        // 마커에 마우스아웃 이벤트를 등록합니다
		        daum.maps.event.addListener(marker, 'mouseout', function() {
		            // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
		            infowindow.close();
		        });
		    }
		}
	}

	
	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {
	
	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({  
	        map: map, 
	        position: locPosition
	    }); 
	        
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);      
	}
	
	//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new daum.maps.MapTypeControl();
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	
	});
