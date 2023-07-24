<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="container">
    <div id="boxheader">
        <div id="logo">
            <a>
                <img src="images/logo.png" width="115" height="100">
            </a>
        </div>
        <nav>
            <ul id="topMenu">
                <li><a>사이트 정보<span>▼</span></a>
                    <ul>
                        <li><a href="introduce">인사말</a></li>
                        <li><a href="map">약도</a></li>
                    </ul>
                </li>
                <li><a>메뉴<span>▼</span></a>
                    <ul>
                        <li><a href="#" onclick="checkLogin('')">음식점</a></li>
                        <li><a href="#" onclick="checkLogin('')">택시</a></li>
                        <li><a href="#" onclick="checkLogin('')">프로그램</a></li>
                        <li><a href="#">게시판</a></li>
                    </ul>
                </li>
                <!--
                <li class="suc" id="mname">마이페이지</li>
                <li class="suc" id="mname">XX님</li>
                <li class="suc"><a href="#">로그아웃</a></li>
                -->
                <li class="def"><a href="loginSelect">로그인</a></li>
                <li class="def"><a href="joinSelect">회원가입</a></li>
            </ul>
        </nav>
    </div>
</div>
<script>
    //회원만 열람할수있는 메소드
    function checkLogin(linkUrl) {
        // 여기에 로그인 여부 체크하는 로직을 작성
        if ("") {
            window.location.href = linkUrl; // 로그인 후 해당 링크로 이동
        } else {
            alert("회원만 이용 가능한 기능입니다. 로그인 후 이용해주세요."); // 로그인 전 알림 메시지 출력
        }
    }
</script>