//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//                                내위치좌표
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();


// 경도위도의 초기값 설정(위치정보 차단시)
var lng = 127.0292,
    lat = 37.4923;
if (navigator.geolocation) {
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다

    navigator.geolocation.getCurrentPosition(function(position) {
        lat = position.coords.latitude, // 위도
            lng = position.coords.longitude;
        console.log(lng, lat);
    });

}

function searchDetailAddrFromCoords(lng, lat, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(lng, lat, callback);
}

function sendloc() {

    searchDetailAddrFromCoords(lng, lat, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = result[0].road_address;

            if (detailAddr == null) {
                geocoder.coord2RegionCode(lng, lat, displayCenterInfo2);
            } else {
                location.href = "helplist.do?lat=" + lat + "&lng=" + lng +"&add=" + detailAddr.address_name + "&loginid=${loginUser.userid}";
            }
        }
    });

    /* location.href = "helplist.do?lat=" + lat + "&lng=" + lng +"&add=" + detailAdr.address_name; */
}

function displayCenterInfo2(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        for (var i = 0; i < result.length; i++) {
            if (result[i].region_type !== 'H') {
                location.href = "helplist.do?lat=" + lat + "&lng=" + lng +"&add=" + result[i].address_name + "&loginid=${loginUser.userid}";
                break;
            }
        }
    }
};
