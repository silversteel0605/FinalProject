/**
 * 
 */

/*지도 생성 시에 옵션을 지정할 수 있습니다.*/

function createMap(x, y, width, height){
	//지도 생성 시에 옵션을 지정할 수 있습니다.
	var map = new naver.maps.Map('map', {
	        center: new naver.maps.LatLng(x, y), //지도의 초기 중심 좌표
	        zoom: 13, //지도의 초기 줌 레벨
	        minZoom: 7, //지도의 최소 줌 레벨
	        zoomControl: true, //줌 컨트롤의 표시 여부
	        zoomControlOptions: { //줌 컨트롤의 옵션
	            position: naver.maps.Position.TOP_RIGHT
	        }
	    });
	
	var marker = new naver.maps.Marker({
	    position: new naver.maps.LatLng(x, y),
	    map: map
	});
	
	//setOptions 메서드를 이용해 옵션을 조정할 수도 있습니다.
	map.setOptions("mapTypeControl", true); //지도 유형 컨트롤의 표시 여부
	
	naver.maps.Event.addListener(map, 'zoom_changed', function (zoom) {
	    console.log('zoom:' + zoom);
	});
	
	map.setOptions('minZoom', 10);
	console.log('잘못된 참조 시점', map.getOptions('minZoom'), map.getOptions('minZoom') === 10);
	
	// 지도의 옵션 참조는 init 이벤트 이후에 참조해야 합니다.
	naver.maps.Event.once(map, 'init', function () {
	    console.log('올바른 참조 시점', map.getOptions('minZoom') === 10);
	});
	
	// 네이버 맵 크기조정
	window.addEventListener('DOMContentLoaded', function(){
	    resize();
	    window.addEventListener('resize', resize);
	});
	 
	function resize(){
		if(width == null ){
			width = 500;
		}
		if(height == null){
			height = 500;
		}
		
	    var mapWidth = width;
	    var mapHeight = height;
	    var Size = new naver.maps.Size(mapWidth, mapHeight);
	    map.setSize(Size);
	}
		
}

