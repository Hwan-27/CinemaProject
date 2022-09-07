<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ȭ�� ����ġ ������</title>
</head>
<body>
	<div id="map" style="width: 100%; height: 1000px;"></div>

	<script type="text/javascript"
		src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=8d77988a0f6e8556df2da6e14b6c1858"></script>
	<script>
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = {
			center : new kakao.maps.LatLng(35.096715, 129.0367482), // ������ �߽���ǥ
			level : 3
		// ������ Ȯ�� ����
		};

		// ������ ǥ���� div��  ���� �ɼ�����  ������ �����մϴ�
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// ��Ŀ�� ǥ�õ� ��ġ�Դϴ� 
		var markerPosition = new kakao.maps.LatLng(35.096715, 129.0367482);

		// ��Ŀ�� �����մϴ�
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
		marker.setMap(map);

		// �Ʒ� �ڵ�� ���� ���� ��Ŀ�� �����ϴ� �ڵ��Դϴ�
		// marker.setMap(null);

		var iwContent = '<div style="padding:5px; background-color:orange">�Ե��ó׸� ������ <hr> tel : 1544-8855 </div>', // ���������쿡 ǥ��� �������� HTML ���ڿ��̳� document element�� �����մϴ�
		iwPosition = new kakao.maps.LatLng(35.096715, 129.0367482), //���������� ǥ�� ��ġ�Դϴ�
		iwRemoveable = true; // removeable �Ӽ��� ture �� �����ϸ� ���������츦 ���� �� �ִ� x��ư�� ǥ�õ˴ϴ�

		// ���������츦 �����ϰ� ������ ǥ���մϴ�
		var infowindow = new kakao.maps.InfoWindow({
			map : map, // ���������찡 ǥ�õ� ����
			position : iwPosition,
			content : iwContent,
			removable : iwRemoveable
		});
		
		// ��Ŀ ���� ���������츦 ǥ���մϴ�. �ι�° �Ķ������ marker�� �־����� ������ ���� ���� ǥ�õ˴ϴ�
		infowindow.open(map, marker); 

		// �Ʒ� �ڵ�� ���������츦 �������� �����մϴ�
		// infowindow.close();
	</script>
</body>
</html>