<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title> 로그인 완료</title>
  <script src="js/jquery-3.7.0.min.js"></script>
  <link rel="stylesheet" href="css/footer.css">
  <link rel="stylesheet" href="css/home.css">
  <link rel="stylesheet" href="css/slide.css">
  <style>
    footer{
      margin-top: 100px;
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
<header>
  <jsp:include page="headerAfter.jsp"></jsp:include>
</header>
<div id="boxbig">
  <br>
  <h2>자주찾는 서비스</h2>
  <div id="box1">
    <ul>
      <li>
        <a href="resList">
          <span id="quick-icon1"></span>
          <p>음식점</p>
        </a>
      </li>
      <li>
        <a onclick="checkTaxiCount('${uid}')">
          <span id="quick-icon2"></span>
          <p>택시</p>
        </a>
      </li>
      <li>
        <a href="#">
          <span id="quick-icon3"></span>
          <p>프로그램</p>
        </a>
      </li>
      <li>
        <a href="resCheck">
          <span id="quick-icon4"></span>
          <p>음식점 예약 목록</p>
        </a>
      </li>
      <li>
        <a href="taxCheck">
          <span id="quick-icon5"></span>
          <p>택시 호출 현황</p>
        </a>
      </li>
      <li>
        <a href="#">
          <span id="quick-icon6"></span>
          <p>프로그램 신청 목록</p>
        </a>
      </li>
    </ul>
  </div>
  <div id="box2">
    <br><br>
    <p class="phrase-title">회원님을 위한 서비스를 한 곳에서 경험하세요!</p>
    <ul>
      <li>
        <div id="small-intro1">
          <img src="images/food-stop.jpg" id="gif1">
          <p class="phrase">● 장애인 친화음식점 안내 ●</p>
          <p>맛과 배려가 함께하는 공간!</p>
        </div>
      </li>
      <li>
        <div id="small-intro2">
          <img src="images/car-stop.jpg" id="gif2">
          <p class="phrase">● 장애인 전용 택시 호출 기능 ●</p>
          <p>편리하고 안전한 이동을 위해!</p>
        </div>
      </li>
      <li>
        <div id="small-intro3">
          <img src="images/program-stop.jpg" id="gif3">
          <p class="phrase">● 장애인 프로그램 신청 홈페이지 ●</p>
          <p>다양한 프로그램으로 함께 성장해요!</p>
        </div>
      </li>
    </ul>
  </div>
  <div id="box3">
    <input type="radio" id="tab1" name="tabs" checked>
    <label for="tab1">게시판</label>
    <div id="notice" class="tabContent">
      <h2>게시판 내용입니다.</h2>
      <ul>
        <li>[참가 모집] 여름 방학, 유럽여행 인원 모집합니다. </li>
        <li>[참가 모집] 일본 여행 인원 모집합니다.</li>
        <li>[공지] 홈페이지 새단장 기념</li>
        <li>항공원, 저렴하게 사는법</li>
        <li>여행시 주의사항 10가지</li>
      </ul>
    </div>
  </div>
  <div id="box4">
    <div class="slide slide_wrap">
      <div class="slide_item item1"></div>
      <div class="slide_item item2"></div>
      <div class="slide_item item3"></div>
      <div class="slide_item item4"></div>
      <div class="slide_item item5"></div>
      <div class="slide_prev_button slide_button"><img  class="btn" src="images/prev_btn.png"></div>
      <div class="slide_next_button slide_button"><img  class="btn" src="images/next_btn.png"></div>
      <ul class="slide_pagination"></ul>
    </div>
  </div>
  <script src="js/slide.js"></script>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
<script>
  function checkTaxiCount(uid){
    $.ajax({
      url: 'checkTaxBook',
      method: 'GET',
      data: {uid : uid},
      success: function (count){
        if (count === 0){
          //데이터가 없으면 taxBook페이지로 이동
          window.location.href = 'taxBook';
        } else {
          //데이터가 있으면 경고창 띄우기
          alert("이미 택시를 호출하였습니다.");
        }
      },
      error: function (){
        console('요청 실패');
      }
    });
  }
</script>
</html>
