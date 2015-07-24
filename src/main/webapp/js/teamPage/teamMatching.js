/**
 * 
 */

function viewMatchingPlace(root,myTeamCode, otherTeamCode){
	var url=root + "/teamPage/viewMatchingPlace.do?myTeamCode="+myTeamCode+"&otherTeamCode="+otherTeamCode;
	
	var winWidth = 1000;
	 var winHeight = 400;
	 var winPosLeft = (screen.width - winWidth) / 2;
	 var winPosTop = 0;
	 var winOpt = "width="+winWidth+",height="+winHeight+",top="+winPosTop+",left="+winPosLeft;
	
	window.open(url,"",winOpt  + ",menubar=no,status=no,scrollbars=no,resizable=no");
	
	
}

function viewOtherTeamInfo(root, otherTeamCode){
	var url=root + "/matching/viewOtherTeamInfo.do?otherTeamCode="+otherTeamCode;
	window.open(url,"","width=1000,height=600");
}

function viewMap(myTeamName, otherTeamName, myLatlng, myDistance, otherLatlng, otherDistance){
	var myData=myLatlng.split(",");
	var myLat=myData[0];
	var myLng=myData[1];
	
	var otherData=otherLatlng.split(",");
	var otherLat=otherData[0];
	var otherLng=otherData[1];
	
	var markers = [];
	var distanceFromPlace=parseInt(myDistance)+parseInt(otherDistance);
	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var myInfo = new daum.maps.InfoWindow({zIndex:2});
	var otherInfo = new daum.maps.InfoWindow({zIndex:2});
	var infowindow = new daum.maps.InfoWindow({zIndex:2});
	
//	alert(myLat +","+myLng +"," + otherLat+","+otherLng);
	
	var centerLat=(Number(myLat)+Number(otherLat))/2;
	var centerLng=(Number(myLng)+Number(otherLng))/2;
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(centerLat, centerLng), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨
    };

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var myPosition  = new daum.maps.LatLng(myLat, myLng); 
	var otherPosition  = new daum.maps.LatLng(otherLat, otherLng); 
	
	// 마커를 생성합니다
	var myMarker = new daum.maps.Marker({
	    position: myPosition,
	});
	
	var otherMarker = new daum.maps.Marker({
	    position: otherPosition,
	});
	
	var options = {
		    location : new daum.maps.LatLng(centerLat, centerLng),
		    sort : daum.maps.services.SortBy.DISTANCE, 
		    sort : daum.maps.services.SortBy.POPULARITY
	};

	
	windowInfo(myMarker, "나의 팀 ", myInfo);
	windowInfo(otherMarker, "상대 팀 ", otherInfo);
	
	//검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function windowInfo(marker, title, infoWindow) {
	    var content = '<div id="windowInfo" style="text-align:center; z-index:1;">' + title + '</div>';

	    infoWindow.setContent(content);
	    infoWindow.open(map, marker);
	}
	
	var myCircle = new daum.maps.Circle({
	    center : new daum.maps.LatLng(myLat, myLng),  // 원의 중심좌표 입니다 
	    radius: myDistance, // 미터 단위의 원의 반지름입니다 
	    strokeWeight: 3, // 선의 두께입니다 
	    strokeColor: '#0054FF', // 선의 색깔입니다
	    strokeOpacity: 0.3, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    fillColor: '#00D8FF', // 채우기 색깔입니다
	    fillOpacity: 0.1  // 채우기 불투명도 입니다   
	}); 
	
	var otherCircle = new daum.maps.Circle({
	    center : new daum.maps.LatLng(otherLat, otherLng),  // 원의 중심좌표 입니다 
	    radius: otherDistance, // 미터 단위의 원의 반지름입니다 
	    strokeWeight: 3, // 선의 두께입니다 
	    strokeColor: '#FF3636', // 선의 색깔입니다
	    strokeOpacity: 0.3, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    fillColor: '#CC3D3D', // 채우기 색깔입니다
	    fillOpacity: 0.1  // 채우기 불투명도 입니다   
	});
	
	otherCircle.setMap(map);
	myCircle.setMap(map);
	
	// 마커가 지도 위에 표시되도록 설정합니다
	myMarker.setMap(map);
	otherMarker.setMap(map);
	
	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places();

	$("#stadium").bind("click",function(){
		searchPlaces("경기장");
	});
	
	$("#university").bind("click",function(){
		searchPlaces("대학교");
	});

	$("#highSchool").bind("click",function(){
		searchPlaces("고등학교");
	});
	
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces(placeName) {
	    var keyword = placeName;

	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }

	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB, options); 
	}
	
	
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

//	    	alert(distanceFromPlace);
	    	var distance=parseInt(Math.sqrt(Math.pow((places[i].latitude-centerLat),2)+Math.pow((places[i].longitude-centerLng),2))*100000);
	    	if(distance<distanceFromPlace){
	    		 // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
//		        bounds.extend(placePosition);

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
//
//		            itemEl.onmouseover =  function () {
//		                displayInfowindow(marker, title);
//		            };
//
//		            itemEl.onmouseout =  function () {
//		                infowindow.close();
//		            };
		            

		            itemEl.onclick=function(){
			           map.setCenter(marker.getPosition());
			        };
		        })(marker, places[i].title);

		        fragment.appendChild(itemEl);
	    	}
	       
	    }

	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;

	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
//	    map.setBounds(bounds);
	}
	
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {

	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <span style="font-weight:bold; font-size:12px;">' + places.title + '</span>';

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
	
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div id="windowInfo" style="padding:5px;z-index:2;">' + title + '</div>';

	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	
	
//	var customOverlay = new daum.maps.CustomOverlay({
//	    map: map,
//	    clickable: true,
//	    content: '<div class="customOverlay"><a href="#">커스텀 오버레이 사용</a></div>',
//	    position: new daum.maps.LatLng(myLat, myLng),
//	    xAnchor: 0.5,
//	    yAnchor: 1,
//	    zIndex: 1
//	});
	
	
}

function closeMap(){
	close();
}

$(document).ready(function(){
	$(".modalPageOne").show();
	$(".modalPageTwo").hide();
});

function showPageTwo(){
	$(".modalPageOne").slideUp();
	$(".modalPageTwo").slideDown();
}

function insertMatchingResult(teamName){
		var score=$("input[name='scoreTeam1']").val() + ":"+$("input[name='scoreTeam2']").val();
		$("#score").attr("value", score);

		var gameCode=$("#gameCode").val();
		var resultScore=$("#score").val();
		var result=$('input:radio[name="result"]:checked').val();
		
		location.href="/home/record/insertMatchingResult.do?gameCode="+gameCode+"&resultScore="+score+"&result="+result+"&teamName="+teamName;
}

function showPageOne(){
	$(".modalPageTwo").slideUp();
	$(".modalPageOne").slideDown();
}

function showPageFour(){
	$(".modalPageOne").slideUp();
	$(".modalPageTwo").slideUp();
	$("#modalPageFour").slideDown();
}
	
