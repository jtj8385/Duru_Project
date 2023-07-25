<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>사업자 메인페이지</title>
  <link rel="stylesheet" href="css/home.css">
  <link rel="stylesheet" href="css/slide.css">
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
    #box1 ul li {
      float: left;
      width: 33%; /*자주 찾는 서비스 사이의 거리 %*/
      text-align: center;
      margin: 15px 0;
    }
    a.llink:link {
      color: #000;
    }
    a.llink:visited{
      color: #000;
    }
  </style>
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
        <a href="${rid == tid || rid == pid ? 'homeBus' : 'resBookList'}"
           onclick="${rid == tid || rid == pid ? 'alert(\'음식점 회원만 이용 가능한 서비스입니다.\')' : ''}">
          <span id="quick-icon1-1"></span>
          <p>음식점 예약 관리</p>
        </a>
      </li>
      <li>
        <a href="${tid == rid || tid == pid ? 'homeBus' : 'taxBookList'}"
           onclick="${tid == rid || tid == pid ? 'alert(\'택시 회원만 이용 가능한 서비스입니다.\')' : ''}">
          <span id="quick-icon2-1"></span>
          <p>택시 호출 관리</p>
        </a>
      </li>
      <li>
        <a href="${pid == rid || pid == tid ? 'homeBus' : '#'}"
           onclick="${pid == rid || pid == tid ? 'alert(\'프로그램 회원만 이용 가능한 서비스입니다.\')' : ''}">
          <span id="quick-icon3-1"></span>
          <p>프로그램 관리</p>
        </a>
    </ul>
  </div>
  <div id="box2">
    <br><br>
    <p class="phrase-title">회원님을 위한 서비스를 한 곳에서 경험하세요!</p>
    <ul>
      <li>
        <div id="small-intro1">
          <img src="images/food-stop.jpg" id="gif1">
          <p class="phrase">●장애인 친화음식점 안내●</p>
          <p>맛과 배려가 함께하는 공간!</p>
        </div>
      </li>
      <li>
        <div id="small-intro2">
          <img src="images/car-stop.jpg" id="gif2">
          <p class="phrase">●장애인 전용 택시 호출 기능●</p>
          <p>편리하고 안전한 이동을 위해!</p>
        </div>
      </li>
      <li>
        <div id="small-intro3">
          <img src="images/program-stop.jpg" id="gif3">
          <p class="phrase">●장애인 프로그램 신청 홈페이지●</p>
          <p>다양한 프로그램으로 함께 성장해요!</p>
        </div>
      </li>
    </ul>
  </div>
  <div id="box3">
    <input type="radio" id="tab1" name="tabs" checked>
    <label for="tab1"><a href="#" onclick="checkLogin('')" class="llink">게시판</a></label>
    <li id="notice" class="tabContent">
      <ul>
        <c:if test="${empty board}">
          <li class="llink">게시글이 없습니다.</li>
        </c:if>
        <c:if test="${!empty board}">
          <c:forEach var="bitem" items="${board}" varStatus="status">
            <li>
              <a href="#" onclick="checkLogin('')" class="llink">
                  ${bitem.b_title}
              </a>
            </li>
          </c:forEach>
        </c:if>
      </ul>
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
  //회원만 열람할수있는 메소드
  function checkLogin(linkUrl) {
    // 여기에 로그인 여부 체크하는 로직을 작성
    if ("") {
      window.location.href = linkUrl; // 로그인 후 해당 링크로 이동
    } else {
      alert("사업자는 이용할수 없는 기능입니다."); // 로그인 전 알림 메시지 출력
    }
  }
</script>
</html>
