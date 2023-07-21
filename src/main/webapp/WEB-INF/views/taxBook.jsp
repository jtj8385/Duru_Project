<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>택시 호출 페이지</title>
  <script src="js/jquery-3.7.0.min.js"></script>
  <link rel="stylesheet" href="css/footer.css">
  <script>
    $(function(){
      //메시지 출력
      let m = "${msg}";
      if(m != ""){
        alert(m);
      }
    });
  </script>
  <style>
    @font-face {
      font-family: 'TheJamsil5Bold';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
    }
    *{
      font-family: 'TheJamsil5Bold';
    }
    #banner{
      background-color: #4999e4;
      width: 500px;
      height: 60px;
      display: flex;
      align-items: center;
      border-radius: 15px;
      margin: 0 auto;
    }
    #banner h1 {
      margin-left: 20px;
    }
    #contain-tb{
      width: 500px;
      height: 400px;
      background-color: #ecf2ff;
      border-radius: 30px;
      margin: 0 auto;

    }
    #location{
      margin-top: 30px;
      height: 30px;
      margin-left: 30px;
    }
    /*#location1{*/
    /*  font-size: 20px;*/
    /*  margin-left: 100px;*/
    /*}*/
    #location{
      height: 30px;
      margin-left: 30px;
    }
    #location1{
      font-size: 20px;
      margin-left: 100px;

    }

    #destination{
      height: 30px;
      margin-left: 30px;
    }
    #destination1{
      font-size: 20px;
      float: left;
      margin-left: 100px;
      margin-top: 50px;
    }
    .quantity {
      display: flex;
      align-items: center;
      width: 40px;
      margin-left: 227px;
      margin-top: 50px;
      margin-bottom: 100px;
    }
    .quantity input {
      flex: 1;
      text-align: center;
      width: 40px;
      height: 40px;
      border-radius: 10px;
      border-color: rgb(201, 197, 197);
    }
    .quantity button{
      width: 33px;
      height: 30px;
      margin-left: 10px;
      background-color: #4999e4;
      border-radius: 5px;
      border-color: #62a5e4;
      display: inline-block;
      border: none;
      cursor: pointer;
    }
    .quantity button:hover{
      background-color: #4a82d6;;
    }
    .quantity button:nth-of-type(1) {
      margin-bottom: 5px;
    }

    .quantity button:nth-of-type(2) {
      margin-top: 5px;
    }
    #increase{
      display: inline-block;

    }
    #num{
      font-size: 20px;
      position: relative;
      right: 200px;
      top: 100px;
      margin-top: 10px;
    }
    .bbtn{
      border: none;
      padding: 15px 30px;
      border-radius: 10px;
      font-family: 'TheJamsil5Bold';
      width:150px;
      background-color: #4999e4;
      color: #fff;
    }
    .bbtn:hover{
      background-color: #4a82d6;
    }
    /*#bookbtn{*/
    /*  margin-top: 30px;*/
    /*  margin-left: 770px;*/
    /*}*/
    #bookbtn + button{
      margin-left: 20px;
    }
    #carType0{
      font-size: 20px;
      margin-left: 80px;
      margin-top: 140px;
      display: block;
    }
    #carType1{
      font-size: 17px;
      font-weight: lighter;
      margin-left: 200px;
    }
    #carType2{
      font-size: 17px;
      font-weight: lighter;
      margin-left: 50px;
    }
    #carTypeContainer{
      margin-top: -20px;
    }
    #num{
      margin-left: 310px;
    }
    #tb-bigbox{
      margin-top: 100px;
      margin-bottom: 100px;
    }
    .centered-buttons {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }

    .centered-buttons button {
      margin: 0 10px;
    }
    #head_num{
      margin-left: 10px;
    }
  </style>
</head>
<body>
<header>
  <jsp:include page="headerAfter.jsp"></jsp:include>
</header>
<form action="taxChoice" method="post" name="tBookForm" onsubmit="return bookCheck()">
  <div id="tb-bigbox">
<div id="banner"><h1>예약자 정보 작성</h1></div>
<br>
<div id="contain-tb">
  <input type="hidden" name="uid" value="${uid}">
  <label id="location1">현위치<input type="text" name="current_loc" title="현위치" id="location"></label>
  <label id="destination1">목적지<input type="text" name="destination" title="목적지" id="destination"></label>
  <div>
    <label id="carType0">호출 차종</label>
    <div id="carTypeContainer">
      <label id="carType1">
        <input type="radio" name="tcar_kind" value="소형" title="차종" class="carType">
        소형
      </label>
      <label id="carType2">
        <input type="radio" name="tcar_kind" value="중형" title="차종" class="carType">
        중형
      </label>
    </div>
  </div>
  <div id="head_num">
  <label id="num">인원</label>
  <div class="quantity">
    <input type="text" id="quantity" value="1" name="thead_count" title="인원">
    <div class="buttons">
      <button type="button" id="increase"><img src="images/up.png" width="20" height="20"></button>
      <button type="button" id="decrease"><img src="images/down.png" width="20" height="20"></button>
    </div>
  </div>
  </div>
</div>
<div class="centered-buttons">
  <button class="bbtn" type="submit" id="bookbtn">호출</button>
  <button class="bbtn" type="button" id="backbtn" onclick="goBack()">뒤로가기</button>
</div>
  </div>
</form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script>

  //이전 페이지 이동
  function goBack() {
    window.history.back();
  }

  var quantityInput = document.getElementById("quantity");
  var increaseButton = document.getElementById("increase");
  var decreaseButton = document.getElementById("decrease");

  increaseButton.addEventListener("click", function() {
    var quantity = parseInt(quantityInput.value);
    if (quantity < 4) {
      quantityInput.value = quantity + 1;
    }
  });

  decreaseButton.addEventListener("click", function() {
    var quantity = parseInt(quantityInput.value);
    if (quantity > 1) {
      quantityInput.value = quantity - 1;
    }
  });

  //정보를 전부 입력했는지 여부
  function bookCheck(){
    const tbookfm = document.tBookForm;
    let carChecked = false;

    //현위치, 목적시, 차종 정보 미입력시 정보입력하라는 알림 출력
    for (let i = 2; i < 6; i++){
      if(tbookfm[i].value === "" || tbookfm[i].value === null) {
        alert(tbookfm[i].title + "를(을) 입력해주세요.");
        tbookfm[i].focus();
        console.log(length);
        return false;
      }
      // 차종 선택 여부확인
      if (tbookfm[i].type == "radio" && tbookfm[i].name == "tcar_kind") {
        if (tbookfm[i].checked) {
          carChecked = true;
        }
      }
    }
    console.log(carChecked);
    if (!carChecked) {
      alert("차종을 선택해주세요.");
      return false;
    }
    return true;
  }

</script>
</html>
