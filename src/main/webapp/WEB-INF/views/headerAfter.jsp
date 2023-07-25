<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>headerAfter</title>
    <link rel="stylesheet" href="css/header.css">
</head>
<style>
    .page-btn {
        border: none;
        background-color: transparent;
        padding: 0;
        cursor: pointer;
        text-decoration: underline;
        text-decoration: none;
    }
    .page-btn:hover{
        color: #0050ff;
    }
</style>
<body>
<div id="container">
    <div id="boxheader">
        <div id="logo">
            <a href="${uid == rid || uid == tid || uid == pid ? 'homeBus' : 'homeAfter'}">
                <img src="images/logo.png" width="115" height="100">
            </a>
        </div>
        <nav>
            <div id="top-right">
                <div id="top-list">
                    <li class="def">${uid} ${rid} ${tid} ${pid}님</li>
                    <li class="def">
                        <button class="page-btn" onclick="moveToPage('userInfo')" ${not empty uid ? '' : 'hidden'}>마이페이지</button>
                        <button class="page-btn" onclick="moveToPage('taxInfo')" ${not empty tid ? '' : 'hidden'}>마이페이지</button>
                        <button class="page-btn" onclick="moveToPage('proInfo')" ${not empty pid ? '' : 'hidden'}>마이페이지</button>
                        <button class="page-btn" onclick="moveToPage('resInfo')" ${not empty rid ? '' : 'hidden'}>마이페이지</button>
                    </li>
                    <form action="logout" method="get">
                    <input class="def" id="logout-btn" type="submit" value="로그아웃">
                    </form>
                </div>
            </div>
            <ul id="topMenu">
                <li><a href="#">사이트 정보<span>▼</span></a>
                    <ul>
                        <li><a href="introduceAfter">인사말</a></li>
                        <li><a href="mapAfter">약도</a></li>
                    </ul>
                </li>
                <li><a href="#">메뉴<span>▼</span></a>
                    <ul>
                        <li><a href="${uid == rid || uid == tid || uid == pid ? 'homeBus' : 'resList'}"
                               onclick="${uid == rid || uid == tid || uid == pid ?
                               'alert(\'사업자는 이용이 불가능한 서비스 입니다..\')' : ''}">음식점</a></li>
                        <li><a href="${uid == rid || uid == tid || uid == pid ? 'homeBus' : 'taxBook'}"
                               onclick="${uid == rid || uid == tid || uid == pid ?
                               'alert(\'사업자는 이용이 불가능한 서비스 입니다..\')' : ''}">택시</a></li>
                        <li><a href="${uid == rid || uid == tid || uid == pid ? 'homeBus' : '#'}"
                               onclick="${uid == rid || uid == tid || uid == pid ?
                               'alert(\'사업자는 이용이 불가능한 서비스 입니다..\')' : ''}">프로그램</a></li>
                        <li><a href="${uid == rid || uid == tid || uid == pid ? 'homeBus' : 'boardList?pageNum=1'}"
                               onclick="${uid == rid || uid == tid || uid == pid ?
                               'alert(\'사업자는 이용이 불가능한 서비스 입니다..\')' : ''}">게시판</a></li>
                    </ul>
                </li>

                <li class="def"><a href="#">관련정보<span>▼</span></a>
                    <ul>
                        <li><a href="staInfo" >관련시설</a></li>
                        <li><a href="reSite">관련사이트</a></li>
                    </ul>
                </li>
                <li class="def"><a href="cusCenter">고객센터</a></li>
            </ul>
        </nav>
    </div>
</div>
</body>
<script>
    function moveToPage(pageName) {
        // 페이지 이동 처리
        window.location.href = pageName;
    }
</script>
</html>
