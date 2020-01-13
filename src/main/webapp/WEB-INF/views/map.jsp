<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>������ ��Ŀ ǥ���ϱ�</title>
    
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1aa8f3127df97f5e54f0a0f01d00af08"></script>
<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
 
// ��Ŀ�� ǥ���� ��ġ�� title ��ü �迭�Դϴ� 
var positions = [
    {
        title: 'īī��', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    },
    {
        title: '���¿���', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        title: '�Թ�', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        title: '�ٸ�����',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];

// ��Ŀ �̹����� �̹��� �ּ��Դϴ�
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // ��Ŀ �̹����� �����մϴ�    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // ��Ŀ�� �����մϴ�
    var marker = new kakao.maps.Marker({
        map: map, // ��Ŀ�� ǥ���� ����
        position: positions[i].latlng, // ��Ŀ�� ǥ���� ��ġ
        title : positions[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ�
        image : markerImage // ��Ŀ �̹��� 
    });
}
</script>
</body>
</html>