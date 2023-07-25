<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>게시글 목록</title>
  <script src="js/jquery-3.7.0.min.js"></script>
  <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="css/footer.css">
  <link rel="stylesheet" href="css/boardList.css">
  <script>
    $(function(){
      //메시지 출력 부분
      let m = "${msg}";
      if(m != ""){
        alert(m);
      }
    })
  </script>
  <style>
    #banner{
      background-color: #4999e4;
      width: 1200px;
      height: 60px;
      display: flex;
      align-items: center;
      border-radius: 15px;
      margin: 0 auto;
    }
    #banner h1 {
      margin-left: 20px;
    }
    #bno{
      font-size: smaller;
      text-align: center;
      line-height: 35px;
    }
    #title{
      font-size: smaller;
      text-align: center;
      line-height: 35px;
    }
    #bdate{
      font-size: smaller;
      text-align: center;
      line-height: 35px;
    }
    #uid{
      font-size: smaller;
      text-align: center;
      line-height: 35px;
    }
    #t-no{
      text-align: center;
      line-height: 30px;
    }
    #t-title{
      text-align: center;
      line-height: 30px;
    }
    #t-id{
      text-align: center;
      line-height: 30px;
    }
    #t-date{
      text-align: center;
      line-height: 30px;
    }
  </style>
</head>
<body>
<div class="wrap">
  <header><jsp:include page="headerAfter.jsp"></jsp:include></header>
  <section>
    <div id="banner"><h1>게시판</h1></div>
    <div class="content">
      <div class="board-form">
        <div class="data-area">
          <div class="title-row">
            <div class="t-no" id="t-no">번호</div>
            <div class="t-title" id="t-title">제목</div>
            <div class="t-id" id="t-id">작성자ID</div>
            <div class="t-date" id="t-date">작성일</div>
          </div>
          <div class="data-row">
            <c:if test="${empty board}">
              <div style="width: 100%">
                게시글이 없습니다.
              </div>
            </c:if>
            <c:if test="${!empty board}">
              <c:forEach var="bitem" items="${board}">
                <div class="t-no"  id="bno">${bitem.b_no}</div>
                <div class="t-title">
                  <a id="title" href="/boardDetail?b_no=${bitem.b_no}">
                      ${bitem.b_title}
                </a>
                </div>
                <div class="t-id" id="uid">${bitem.b_uid}</div>
                <div class="t-date" id="bdate">
                  <fmt:formatDate value="${bitem.b_date}"
                      pattern="yyyy-MM-dd"></fmt:formatDate>
                </div>
              </c:forEach>
            </c:if>
          </div>
        </div>
        <div class="search-area">
          <select id="sel">
            <option value="b_title" selected>제목</option>
            <option value="b_contents">내용</option>
          </select>
          <input type="text" id="keyword">
          <button id="search">검색</button>
        </div>
        <div class="btn-area">
          <div class="paging">${paging}</div>
          <button class="wr-btn"
                  onclick="location.href='/boardInput'">글쓰기</button>
        </div>
      </div>
    </div>
  </section>
  <footer>
    <jsp:include page="footer.jsp"></jsp:include>
  </footer>
</div>
</body>
<script>
    //검색 기능
    $("#search").click(function () {
      let keyword = $("#keyword").val();
      if(keyword == ""){
        alert("검색어를 입력하세요.");
        return;
      }
      let select = $("#sel").val();//제목/내용
      console.log(select, keyword);
      location.href = "/boardList?colname=" + select
          + "&keyword=" + keyword + "&pageNum=1";
      //localhost/list?colname=b_title&keyword=4&pageNum=1
    });
</script>
</html>