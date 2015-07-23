/**
 * 
 */
var latLng;
var currentPage = 1;
function deleteBoard(root, teamName, currentPage, boardNumber){
	var value=confirm("정말로 삭제하시겠습니까?");
	
	if(value==true){
		location.href=root+"/teamPage/deleteTeamBoard.do?teamName="+teamName+"&currentPage="+currentPage+"&boardNumber="+boardNumber;
	}
}

$(document).ready(function(){
	$("#addMemberForm").hide();
	
	$("#addMember").click(function(){
		$("#addMemberForm").toggle();
	});	
	
	$(".modalPageOne").show();
    $(".modalPageTwo").hide();
    $(".modalPageThree").hide();
    $("#modalPageFour").hide();
	
});

function addMember(form){
	form.memberGender.value=form.gender.value;
}

function setting1(homeGround){	
	$(".modalPageOne").hide();
    $(".modalPageTwo").show();   
    $(".modalPageThree").hide();
    createMap(homeGround);
}

function setting2(value){
	if(value=="moveTo1"){
		$(".modalPageOne").show();
		$(".modalPageTwo").hide();   
		$(".modalPageThree").hide();
	}else if(value=="moveTo2"){
		$(".modalPageOne").hide();
		$(".modalPageTwo").show();   
		$(".modalPageThree").hide();
	}else if(value=="moveTo3"){
		$(".modalPageOne").hide();
	    $(".modalPageTwo").hide();   
	    $(".modalPageThree").show();
	}
}

function showPageFour(){
	$("#modalPageFour").toggle();
}
function complete(){
	$("#matchingSetting2").slideUp();
	$("#matchingComplete").slideDown();
}

function createMap(homeGround){
		var markers = [];
		
		var infowindow = new daum.maps.InfoWindow({zIndex:1});

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		
		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places();
		
		var homeGroundPlace=null;
		
		ps.keywordSearch(homeGround, placesSearchCenter); 
		
		function placesSearchCenter(status, data, pagination) {
		    if (status === daum.maps.services.Status.OK) {
		    	
		    	displayPlaces(data.places);
		    	homeGroundPlace=data.places;
		    	
		    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

		        alert('검색 결과가 존재하지 않습니다.');
		        return;

		    } else if (status === daum.maps.services.Status.ERROR) {

		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;

		    }
		}
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(35, 35), // 지도의 중심좌표
		        level: 6 // 지도의 확대 레벨
		    };  

		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 주소 정보를 요청합니다
		    geocoder.coord2addr(coords, callback);
		}
		
		// 지도를 생성합니다   
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new daum.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({zIndex:1});

		// 키워드로 장소를 검색합니다
		// searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		$("#search").click(function(){
			var keyword = $("#keyword").val();

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
			    alert('키워드를 입력해주세요!');
			    return false;
			}

			    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			    ps.keywordSearch( keyword, placesSearchCB); 
		});

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(status, data, pagination) {
		    if (status === daum.maps.services.Status.OK) {

		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data.places);

		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);

		    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

		        alert('검색 결과가 존재하지 않습니다.');
		        return;

		    } else if (status === daum.maps.services.Status.ERROR) {

		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;

		    }
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new daum.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);

		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {

		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude);
		        var marker = addMarker(placePosition, i);
		        var itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다
		        
		       latLng=marker.getPosition().getLat()+","+marker.getPosition().getLng();
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);

		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title) {
		            daum.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });

		            daum.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });
		            
		            daum.maps.event.addListener(marker, 'click', function() {

		                searchAddrFromCoords(marker.getPosition(), function(status, result) {
		                    if (status === daum.maps.services.Status.OK) {
		                        $("#address").text(result[0].fullName+" " + title);
		                     
		                    }   
		                });
		                map.setCenter(marker.getPosition());
		            });

		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };

		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		            
		            itemEl.onclick=function(){
		            	map.setCenter(marker.getPosition());
		            };
		        })(marker, places[i].title);

		        fragment.appendChild(itemEl);
		    }

		    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;

		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

		    var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h5>' + places.title + '</h5>';

		    if (places.newAddress) {
		        itemStr += '    <span>' + places.newAddress + '</span>' +
		                    '   <span class="jibun gray">' +  places.address  + '</span>';
		    } else {
		        itemStr += '    <span>' +  places.address  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                '</div>';
		    
		    el.innerHTML = itemStr;
		    el.className = 'item';

		    return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new daum.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });

		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		    return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 

		    // 기존에 추가된 페이지번호를 삭제합니다
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }

		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;

		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }

		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
		    var content = '<div style="text-align:center; z-index:1;">' + title + '</div>';

		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}

		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
		

		var circles = []; // 클릭으로 그려진 원과 반경 정보를 표시하는 선과 커스텀오버레이를 가지고 있을 배열입니다
		var drawingFlag = false; // 원이 그려지고 있는 상태를 가지고 있을 변수입니다
		var centerPosition; // 원의 중심좌표 입니다
		var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
		var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
		var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
		var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다
		
//		var drawingEvent=
			function drawingEvent() {
	        
		    // 클릭 이벤트가 발생했을 때 원을 그리고 있는 상태가 아니면 중심좌표를 클릭한 지점으로 설정합니다
		    if (!drawingFlag) {    
		        
		        // 상태를 그리고있는 상태로 변경합니다
		        drawingFlag = true; 
		        
		        // 원이 그려질 중심좌표를 클릭한 위치로 설정합니다 
//		        centerPosition = mouseEvent.latLng; 

		        // 그려지고 있는 원의 반경을 표시할 선 객체를 생성합니다
		        if (!drawingLine) {
		            drawingLine = new daum.maps.Polyline({
		                strokeWeight: 3, // 선의 두께입니다
		                strokeColor: '#00a0e9', // 선의 색깔입니다
		                strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		                strokeStyle: 'solid' // 선의 스타일입니다
		            });    
		        }
		        
		        // 그려지고 있는 원을 표시할 원 객체를 생성합니다
		        if (!drawingCircle) {                    
		            drawingCircle = new daum.maps.Circle({ 
		                strokeWeight: 1, // 선의 두께입니다
		                strokeColor: '#00a0e9', // 선의 색깔입니다
		                strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		                strokeStyle: 'solid', // 선의 스타일입니다
		                fillColor: '#00a0e9', // 채우기 색깔입니다
		                fillOpacity: 0.2 // 채우기 불투명도입니다 
		            });     
		        }
		        
		        // 그려지고 있는 원의 반경 정보를 표시할 커스텀오버레이를 생성합니다
		        if (!drawingOverlay) {
		            drawingOverlay = new daum.maps.CustomOverlay({
		                xAnchor: 0,
		                yAnchor: 0,
		                zIndex: 1
		            });              
		        }
		    }
		 }
		
			var drawingMove=function (mouseEvent) {
			        
			    // 마우스무브 이벤트가 발생했을 때 원을 그리고있는 상태이면
			    if (drawingFlag) {

			        // 마우스 커서의 현재 위치를 얻어옵니다 
			        var mousePosition = mouseEvent.latLng; 
			        
			        // 그려지고 있는 선을 표시할 좌표 배열입니다. 클릭한 중심좌표와 마우스커서의 위치로 설정합니다
			        var linePath = [centerPosition, mousePosition];     
			        
			        // 그려지고 있는 선을 표시할 선 객체에 좌표 배열을 설정합니다
			        drawingLine.setPath(linePath);
			        
			        // 원의 반지름을 선 객체를 이용해서 얻어옵니다 
			        var length = drawingLine.getLength();
			        
			        if(length > 0) {
			            
			            // 그려지고 있는 원의 중심좌표와 반지름입니다
			            var circleOptions = { 
			                center : centerPosition, 
			            radius: length,                 
			            };
			            
			            // 그려지고 있는 원의 옵션을 설정합니다
			            drawingCircle.setOptions(circleOptions); 
			                
			            // 반경 정보를 표시할 커스텀오버레이의 내용입니다
			            var radius = Math.round(drawingCircle.getRadius()),   
			            content = '<div class="info">반경 <span class="number">' + radius + '</span>m</div>';
			            
			            // 반경 정보를 표시할 커스텀 오버레이의 좌표를 마우스커서 위치로 설정합니다
			            drawingOverlay.setPosition(mousePosition);
			            
			            // 반경 정보를 표시할 커스텀 오버레이의 표시할 내용을 설정합니다
			            drawingOverlay.setContent(content);
			            
			            // 그려지고 있는 원을 지도에 표시합니다
			            drawingCircle.setMap(map); 
			            
			            // 그려지고 있는 선을 지도에 표시합니다
			            drawingLine.setMap(map);  
			            
			            // 그려지고 있는 원의 반경정보 커스텀 오버레이를 지도에 표시합니다
			            drawingOverlay.setMap(map);
			            
			        } else { 
			            
			            drawingCircle.setMap(null);
			            drawingLine.setMap(null);    
			            drawingOverlay.setMap(null);
			            
			        }
			    }     
			}
			
			var drawingEnd=function (mouseEvent) {

			    if (drawingFlag) {

			        // 마우스로 오른쪽 클릭한 위치입니다 
			        var rClickPosition = mouseEvent.latLng; 

			        // 원의 반경을 표시할 선 객체를 생성합니다
			        var polyline = new daum.maps.Polyline({
			            path: [centerPosition, rClickPosition], // 선을 구성하는 좌표 배열입니다. 원의 중심좌표와 클릭한 위치로 설정합니다
			            strokeWeight: 3, // 선의 두께 입니다
			            strokeColor: '#00a0e9', // 선의 색깔입니다
			            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			            strokeStyle: 'solid' // 선의 스타일입니다
			        });
			        
			        // 원 객체를 생성합니다
			        var circle = new daum.maps.Circle({ 
			            center : centerPosition, // 원의 중심좌표입니다
			            radius: polyline.getLength(), // 원의 반지름입니다 m 단위 이며 선 객체를 이용해서 얻어옵니다
			            strokeWeight: 1, // 선의 두께입니다
			            strokeColor: '#00a0e9', // 선의 색깔입니다
			            strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			            strokeStyle: 'solid', // 선의 스타일입니다
			            fillColor: '#00a0e9', // 채우기 색깔입니다
			            fillOpacity: 0.2  // 채우기 불투명도입니다 
			        });
			        
			        var radius = Math.round(circle.getRadius()), // 원의 반경 정보를 얻어옵니다
			            content = getTimeHTML(radius); // 커스텀 오버레이에 표시할 반경 정보입니다

			        
			        // 반경정보를 표시할 커스텀 오버레이를 생성합니다
			        var radiusOverlay = new daum.maps.CustomOverlay({
			            content: content, // 표시할 내용입니다
			            position: rClickPosition, // 표시할 위치입니다. 클릭한 위치로 설정합니다
			            xAnchor: 0,
			            yAnchor: 0,
			            zIndex: 1 
			        });  

			        // 원을 지도에 표시합니다
			        circle.setMap(map); 
			        
			        // 선을 지도에 표시합니다
			        polyline.setMap(map);
			        
			        // 반경 정보 커스텀 오버레이를 지도에 표시합니다
			        radiusOverlay.setMap(map);
			        
			        // 배열에 담을 객체입니다. 원, 선, 커스텀오버레이 객체를 가지고 있습니다
			        var radiusObj = {
			            'polyline' : polyline,
			            'circle' : circle,
			            'overlay' : radiusOverlay
			        };
			        
			        // 배열에 추가합니다
			        // 이 배열을 이용해서 "모두 지우기" 버튼을 클릭했을 때 지도에 그려진 원, 선, 커스텀오버레이들을 지웁니다
			        circles.push(radiusObj);   
			    
			        // 그리기 상태를 그리고 있지 않는 상태로 바꿉니다
			        drawingFlag = false;
			        
			        // 중심 좌표를 초기화 합니다  
			        centerPosition = null;
			        
			        // 그려지고 있는 원, 선, 커스텀오버레이를 지도에서 제거합니다
			        drawingCircle.setMap(null);
			        drawingLine.setMap(null);   
			        drawingOverlay.setMap(null);
			        
			        $("input[name='matchingPlace']").attr("value",homeGround);
			        $("input[name='matchingDistance']").attr("value",parseInt(polyline.getLength())+1);
			    }
			}
		$("#drawingCircle").bind("click", function(){
			
			centerPosition=new daum.maps.LatLng(homeGroundPlace[0].latitude, homeGroundPlace[0].longitude);
			
			drawingEvent();

			// 지도에 마우스무브 이벤트를 등록합니다
			// 원을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 원의 위치와 반경정보를 동적으로 보여주도록 합니다
			daum.maps.event.addListener(map, 'mousemove', drawingMove);     

			// 지도에 마우스 오른쪽 클릭이벤트를 등록합니다
			// 원을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면
			// 마우스 오른쪽 클릭한 위치를 기준으로 원과 원의 반경정보를 표시하는 선과 커스텀 오버레이를 표시하고 그리기를 종료합니다
			daum.maps.event.addListener(map, 'rightclick', drawingEnd);    

		});
		
		$("#deleteCircle").bind("click", function(){
			// 지도에 표시되어 있는 모든 원과 반경정보를 표시하는 선, 커스텀 오버레이를 지도에서 제거합니다
				
			    for (var i = 0; i < circles.length; i++) {
			        circles[i].circle.setMap(null);    
			        circles[i].polyline.setMap(null);
			        circles[i].overlay.setMap(null);
			    }         
			    circles = [];
			    
//			daum.maps.event.removeListener(map, 'click', drawingEvent);    
//			daum.maps.event.removeListener(map, 'mousemove', drawingMove);    
//			daum.maps.event.removeListener(map, 'rightclick', drawingEnd);    
			    $("input[name='matchingPlace']").attr("value",null);
		        $("input[name='matchingDistance']").attr("value",null);    
		});
		
		// 마우스 우클릭 하여 원 그리기가 종료됐을 때 호출하여 
		// 그려진 원의 반경 정보와 반경에 대한 도보, 자전거 시간을 계산하여
		// HTML Content를 만들어 리턴하는 함수입니다
		function getTimeHTML(distance) {

		    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
		    var walkkTime = distance / 67 | 0;
		    var walkHour = '', walkMin = '';

		    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
		    if (walkkTime > 60) {
		        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
		    }
		    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

		    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
		    var bycicleTime = distance / 227 | 0;
		    var bycicleHour = '', bycicleMin = '';

		    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
		    if (bycicleTime > 60) {
		        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
		    }
		    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

		    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
		    var content = '<ul class="info">';
		    content += '    <li>';
		    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
		    content += '    </li>';
		    content += '    <li>';
		    content += '        <span class="label">도보</span>' + walkHour + walkMin;
		    content += '    </li>';
		    content += '    <li>';
		    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
		    content += '    </li>';
		    content += '</ul>'

		    return content;
		}

}

function matching(form, root){
//	alert(form.teamCode.value);
//	alert($("input[name='day']:checked").val());
	var matchingDay="";
	
	var dayLength=form.day.length;
	for(var i=0;i<dayLength;i++){
		if(form.day[i].checked==true){
//			alert(form.day[i].value);
			matchingDay+=form.day[i].value;
			matchingDay+=",";
		}
	}
//	alert(matchingDay);
	
	form.matchingDay.value=matchingDay;
	
	var matchingTime="";
	var timeLength=form.time.length;
	
	for(var i=0;i<timeLength;i++){
		if(form.time[i].checked==true){
//			alert(form.day[i].value);
			matchingTime+=form.time[i].value;
			matchingTime+=",";
		}
	}
//	alert(matchingTime);
	
	form.matchingTime.value=matchingTime;
	form.matchingLatlng.value=latLng;
	
}

function doSearching(root,teamCode, teamName){
	
	$.ajax ({
	      type: 'get', // POST 로 전송
	      dataType: 'html', // JSON 타입이 아닐경우 제거
	      url: root + '/teamPage/searching.do', // 호출 URL
	      data: {'teamCode':teamCode}, // 파라메터 정보 전달
	      success:function(data){
	        // 리턴받은 data값 : {"name":"vip125", "age":"00", "com":"회사"}
//	        var datamap = {'name':data.name, 'age':data.age, 'com',data.com}; // json 데이터 가져오기 및 매핑
//	        for (var key in datamap) {
//	          document.getElementById(key).value = datamap[key]; // 각 input 에 데이터 넣기
//	        }
	    	
	    	
//	    	 alert("change");
//	    	$("#result").html(data);
//	    	alert($("#check").text());
//	    	alert("matching success");
//	    	alert(data.check);
	      },
	      error:function(e) {
	        // alert(e.responseText);
	      }
	});
	
	alert("매칭이 시작되었습니다. ");
	location.href=root + '/team/teamMain.do?teamName=' +teamName;
}

