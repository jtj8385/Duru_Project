<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>사용자 아이디 찾기</title>
    <style>
        @font-face {
            font-family: 'TheJamsil5Bold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
        }
        body {
            background-color: white;
        }
        .container {
            width: 800px;
            height: 1000px;
            margin: 0px auto;
            padding: 200px 150px 150px;
            background-color: white;
            border: 0px solid gray;
            border-radius: 0px;
        }
        input[type="text"]{
            width: 200px;
            padding: 10px;
            border: 1px solid gray;
            border-radius: 5px;
            margin-left: px;
        }
        input[type="submit"] {
            width: 200px;
            padding: 10px;
            background-color: #4999e4;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-left: 250px;
            font-family: 'TheJamsil5Bold';
        }
        input[type="submit"]:hover {
            background-color: #4a82d6;
        }
        #b{
            margin-left: 40px;
            margin-top: 30px;
            padding: 0 auto;
        }
        #a{
            width: 120px;
            height: 120px;
            margin-left: 78px
        }
        .asdf{
            margin-left: 2px;
            text-decoration-line: none;
            color: inherit;
            font-size: 13px;
        }
        .infolab{
            width: 80px;
            margin-left: 170px;
            float: left;
            font-family: 'TheJamsil5Bold';
            margin-top: 10px;
        }
        #a{
            margin: 0 auto;
            margin-left: 330px;
        }
        .backbtn{
            border: none;
            padding: 15px 30px;
            border-radius: 10px;
            font-family: 'TheJamsil5Bold';
            text-decoration: none;
            font-weight: 600;
            transition: 0.25s;
            width:222px;
            margin: 0 auto;
            margin-right: 327px;
            top: -50px;
            background-color: #4999e4;
            color: #fff;
            position: relative;
            top: 100px;
            left: 285px;
        }
        .backbtn:hover{
            background-color: #4a82d6;
        }
        #idoutput{
            width: 400px;
            height: 100px;
            font-family: 'TheJamsil5Bold';
            background-color: white;
            display: block;
            margin:0 auto;
            position: relative;
            right: 20px;
            top: 50px;
            text-align: center;
            line-height: 100px;
        }
    </style>
    <script>
        $(function(){
            //메시지 출력
            let m = "${msg}";
            if(m != ""){
                alert(m);
            }
        });
    </script>
</head>
<body>
<div class="container">
    <img src="images/logo.png" id="a">
    <form action="mFindId" method="post" id="b">

        <div class="infolab">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름</div>
        <input type="text" id="username" name="uname">
        <br>
        <br>
        <div class="infolab">전화번호</div>
        <input type="text" id="phone" name="uphone_num">
        <br>
        <br>
        <div>
            <input type="submit" value="확인">
        </div>
        <div id="idoutput">${id}</div>
        <a class="backbtn" href="userLogin">뒤로가기</a>
    </form>
</div>
</body>
<script>
</script>
</html>