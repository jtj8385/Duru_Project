<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <title>Document</title>
    <style>
        @font-face {
            font-family: 'TheJamsil5Bold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
        }
        *{
            font-family: 'TheJamsil5Bold';
        }
        h1{
            text-align: center;
            margin-top: 300px;
        }
        .container{
            display: flex;
            justify-content: center;
            margin-top: 100px;
        }
        .box{
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0 100px;
        }
        .box a{
            text-decoration: none;
            color: black;
        }
        .box a:visited{
            color: black;
        }
        .box:hover{
            opacity: 0.5;
        }
    </style>
</head>
<body>
<h1>프로그램 메뉴를 선택해주세요</h1>
<div class="container">
    <div class="box">
        <a href="proListBus">
            <img src="images/program.png" alt="프로그램 관리">
            <p>프로그램 관리</p>
        </a>
    </div>
    <div class="box">
        <a href="proBookList">
            <img src="images/visitor.png" alt="신청자 관리">
            <p>신청자 관리</p>
        </a>
    </div>
</div>
</body>
</html>
