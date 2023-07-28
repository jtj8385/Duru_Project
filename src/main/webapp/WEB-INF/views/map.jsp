<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kakao 지도 시작하기</title>
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/header.css">
    <style>
        @font-face {
            font-family: 'TheJamsil5Bold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
        }
        #map{
            width: 800px;
            height: 500px;
            margin: 0 auto;
            margin-top: 30px;
            margin-right: 200px;
        }
        #contain{
            width: 1200px;
            height: 800px;
            margin: 0px auto;
            margin-top: 50px;
            background-color: #ecf2ff;
            border: 1px solid #ecf2ff;
            border-radius: 30px;
        }
        #h2{
            text-align:center;
            font-family: 'TheJamsil5Bold';
            font-size: 50px;
        }
        #textbox{
            font-family: 'TheJamsil5Bold';
            margin-top : 50px;
            margin-left: 200px;
            font-size: 20px;
        }
        .addr{
            color: #444444;
            font-size: medium;
            font-weight: lighter;
        }
    </style>
</head>
<body>
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<div id="contain">
    <br><br>
    <h2 id="h2">오시는 길</h2>
    <div id="map"></div>
    <div id="textbox">
        <a class="addr">주소 : 인천광역시 미추홀구 매소홀로488번길 6-32 태승빌딩 5층</a><br><br>
        <a class="addr">지번 : 인천광역시 미추홀구 학익동 663-1 태승빌딩 5층</a><br><br>
        <a class="addr">전화번호 : 010-1234-5678</a><br><br>
    </div>
</div>
<br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0876525f86fb0c6d56a65a8324f1c780"></script>
<script>
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(37.438836, 126.675108),
        level: 3
    };

    var map = new kakao.maps.Map(container, options);

    // 마커가 표시될 위치입니다.
    var markerPosition  = new kakao.maps.LatLng(37.438836, 126.675108);

    // 마커를 생성합니다.
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다.
    marker.setMap(map);
</script>
</body>
</html>