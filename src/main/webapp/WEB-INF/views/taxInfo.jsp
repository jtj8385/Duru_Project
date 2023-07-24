<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>택시 마이페이지</title>
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
      text-decoration: none;
      background-color: #4999e4;
      color: #fff;
      width: auto;
      padding: 10px 20px;
      font-size: 16px;
      border-radius: 4px;
      margin-right: 10px;
      border: none;
    }
    *{
      font-family: 'TheJamsil5Bold';
    }
    .btn:hover {
      background-color: #4a82d6;
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
  <script src="js/jquery-3.7.0.min.js"></script>
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
<div class="container">
  <div class="info">
    <h2>아이디</h2>
    <p class="info-value" id="tid">${tmb.tid}</p>
    <input type="hidden" value="${tmb.tid}" name="tid">
  </div>

  <div class="info">
    <h2>회사 이름</h2>
    <p class="info-value" id="tcom_name">${tmb.tcom_name}</p>
  </div>

  <div class="info">
    <h2>기사 이름</h2>
    <p class="info-value" id="tname">${tmb.tname}</p>
  </div>

  <div class="info">
    <h2>차량 번호</h2>
    <p class="info-value" id="carnum">${tmb.carnum}</p>
  </div>

  <div class="info">
    <h2>기사 전화번호</h2>
    <p class="info-value" id="tphone_num">${tmb.tphone_num}</p>
  </div>

  <div class="info">
    <h2>사업자 번호</h2>
    <p class="info-value" id="tbus_num">${tmb.tbus_num}</p>
  </div>
  <div class="info">
    <h2>차종</h2>
    <p class="info-value" id="tcar_kind">${tmb.tcar_kind}</p>
  </div>

  <div class="btn-container">
    <a href="taxInfoUpdate" class="btn">수정</a>
    <button class="btn" onclick="delCheck('${tmb.tid}')">탈퇴</button>
    <a href="homeAfter" class="btn">뒤로가기</a>
  </div>
</div>
</body>
<script>
  function delCheck(tid){
    let conf = confirm("탈퇴하겠습니까?");
    if(conf == true){
      location.href = "/tWithd?tid=" + tid;
    }
  }
</script>
</html>