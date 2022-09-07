<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영화관 상세위치 페이지</title>
</head>
<body>
	<div id="map" style="width: 100%; height: 1000px;"></div>

	<script type="text/javascript"
		src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=8d77988a0f6e8556df2da6e14b6c1858"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.096715, 129.0367482), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(35.096715, 129.0367482);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);

		var iwContent = '<div style="padding:5px; background-color:orange">롯데시네마 광복점 <hr> tel : 1544-8855 </div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		iwPosition = new kakao.maps.LatLng(35.096715, 129.0367482), //인포윈도우 표시 위치입니다
		iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

		// 인포윈도우를 생성하고 지도에 표시합니다
		var infowindow = new kakao.maps.InfoWindow({
			map : map, // 인포윈도우가 표시될 지도
			position : iwPosition,
			content : iwContent,
			removable : iwRemoveable
		});
		
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 

		// 아래 코드는 인포윈도우를 지도에서 제거합니다
		// infowindow.close();
	</script>
</body>
</html>