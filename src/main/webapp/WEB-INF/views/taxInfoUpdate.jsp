<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>택시 정보 수정 페이지</title>
  <style>
    @font-face {
      font-family: 'TheJamsil5Bold';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
    }
    body {
      font-family: Arial, sans-serif;
      background-color: #f7f7f7;
      margin: 0;
      padding: 20px;
    }

    .container {
      max-width: 500px;
      margin: 0 auto;
      background-color: #fff;
      border-radius: 8px;
      padding: 30px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    h1 {
      color: #333;
      text-align: center;
      margin-bottom: 30px;
      font-size: 30px;
      text-transform: uppercase;
      letter-spacing: 2px;
    }

    h2 {
      color: #555;
      margin-top: 20px;
      margin-bottom: 10px;
      font-size: 20px;
    }

    .info {
      margin-bottom: 20px;
      border-bottom: 1px solid #ccc;
      padding-bottom: 15px;
    }

    .info:last-child {
      border-bottom: none;
      padding-bottom: 0;
    }

    .info-label {
      color: #999;
      font-size: 14px;
    }

    .info-value {
      color: #333;
      font-weight: bold;
      font-size: 16px;
      margin-bottom: 5px;
    }

    .info-value span {
      color: #666;
      font-weight: normal;
    }

    .btn-container {
      text-align: center;
      margin-top: 30px;
    }

    .btn {
      display: inline-block;
      background-color: #4999e4;
      color: #fff;
      padding: 10px 20px;
      border-radius: 4px;
      font-size: 16px;
      text-decoration: none;
      margin-right: 10px;
      width: auto;
      border:none;
    }

    .btn:hover {
      background-color: #4a82d6;
    }
    *{
      font-family: 'TheJamsil5Bold';
    }
    #banner{
      background-color: #4999e4;
      width: 560px;
      height: 60px;
      display: flex;
      line-height: 18px;
      border-radius: 15px;
      margin: 0 auto;
    }
    #banner h1 {
      margin-left: 20px;
    }
    .a{
      border: none;
      width: 100%;
      outline: none;
      font-size: 20px;
    }
    .id{
      height: 22px;
    }

  </style>
  <script>
    $(function(){
      //메시지 출력 부분
      let m = "${msg}";
      if(m != ""){
        alert(m);
      }
    });
  </script>
</head>
<body>
<div id="banner"><h1>마이페이지</h1></div>
<form action="tInfoFix" method="post" class="container">
  <div class="info">
    <h2>아이디</h2>
    <input class="a" type="text" name="tid" value="${tmb.tid}" readonly>
  </div>

  <div class="info">
    <h2>회사 이름</h2>
    <input class="a" type="text" name="tcom_name" required value="${tmb.tcom_name}">
  </div>

  <div class="info">
    <h2>기사 이름</h2>
    <input class="a" type="text" name="tname" required value="${tmb.tname}">
  </div>

  <div class="info">
    <h2>차량 번호</h2>
    <input class="a" type="text" name="carnum" required value="${tmb.carnum}">
  </div>

  <div class="info">
    <h2>기사 전화번호</h2>
    <input class="a" type="text" name="tphone_num" required value="${tmb.tphone_num}">
  </div>

  <div class="info">
    <h2>사업자 번호</h2>
    <input class="a" type="text" name="tbus_num" required value="${tmb.tbus_num}">
  </div>

  <div class="info">
    <h2>차종</h2>
    <div id="car">
      <input type="radio" class="rad" name="tcar_kind" value="소형" ${tmb.tcar_kind == '소형' ? 'checked' : ''}>
      <label>소형</label>&nbsp;&nbsp;
      <input type="radio" class="rad2" name="tcar_kind" value="중형" ${tmb.tcar_kind == '중형' ? 'checked' : ''}>
      <label>중형</label>
    </div>
  </div>
  <div class="btn-container">
    <input type="submit" class="btn" value="수정 완료">
    <a href="taxInfo" class="btn">뒤로가기</a>
  </div>
</form>
</body>
</html>
