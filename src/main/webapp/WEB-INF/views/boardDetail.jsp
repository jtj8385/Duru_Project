<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시글 상세보기</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="css/boardDetail.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
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
            width: 785px;
            height: 60px;
            display: flex;
            align-items: center;
            border-radius: 15px;
            margin: 0 auto;
        }
        #banner h1 {
            margin-left: 20px;
        }
        .content_t{
            line-height: 50px;
        }
        .t_content{
            line-height: 50px;
        }
        .d_content{
            font-size: medium;
            line-height: 50px;
        }
        #t-content{
            line-height: 195px;
        }
        #b-content{
            font-size: smaller;
        }
    </style>
    <script>
        $(function(){
            //메시지 출력 부분
            let m = "${msg}";
            if(m != ""){
                alert(m);
            }
        })
    </script>

</head>
<body>
<div class="wrap">
    <header>
        <jsp:include page="headerAfter.jsp"></jsp:include>
    </header>
    <section>
        <div id="banner"><h1>게시판</h1></div>
        <div class="content">
            <div class="write-form">
                <div>
                    <div class="t_content">작성자</div>
                    <div class="d_content">${board.b_uid}</div>
                    <div class="t_content">날짜</div>
                    <div class="d_content">
                        <fmt:formatDate value="${board.b_date}"
                                        pattern="yyyy-MM-dd"></fmt:formatDate>
                    </div>
                </div>
                <div>
                    <div class="content_t">제목</div>
                    <div class="content_d">${board.b_title}</div>
                </div>
                <div>
                    <div class="t_content content_h1" id="t-content">내용</div>
                    <div class="content_h" id="b-content">${board.b_contents}</div>
                </div>
                <div class="btn-area">
                    <button class="btn-write" id="upbtn"
                            onclick="upboard('${board.b_no}')">수정</button>
                    <button class="btn-write" id="delbtn"
                            onclick="delCheck('${board.b_no}')">삭제</button>
                    <button class="btn-sub" onclick="backbtn()">뒤로가기</button>
                </div>
                <!-- 댓글 입력 양식-->
                <form id="cinput">
                    <!-- 게시글정보(글번호), 댓글 내용, 접속자(작성자) -->
                    <input type="hidden" name="c_bno" value="${board.b_no}">
                    <textarea rows="3" cols="70" class="write-input ta" name="c_contents"
                              id="comment" placeholder="댓글을 작성해주세요."></textarea>
                    <input type="hidden" name="c_id" value="${uid}">
                    <input type="button" value="댓글 작성" class="btn-comment"
                           onclick="commentInsert()" style="margin-bottom: 30px;">
                </form>
                <table style="width: 100%"><!-- 제목 테이블 -->
                    <tr class="ctbl-head">
                        <td class="p-20">작성자</td>
                        <td class="p-50">댓글</td>
                        <td class="p-30">날짜</td>
                    </tr>
                </table>
                <table style="width: 100%; text-align: center" id="ctable">
                    <c:forEach var="ritem" items="${comment}">
                        <tr>
                            <td class="p-20" style="text-align: center">${ritem.c_id}</td>
                            <td class="p-50" style="text-align: center">${ritem.c_contents}</td>
                            <td class="p-30" style="text-align: center">
                                <fmt:formatDate value="${ritem.c_date}"
                                                pattern="yyyy-MM-dd"></fmt:formatDate>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </section>

        <jsp:include page="footer.jsp"></jsp:include>

</div>
</body>
<script>
    //수정/삭제 버튼 처리(본인의 글이 아니면 버튼 숨기기)
    $("#upbtn").hide();
    $("#delbtn").hide();
    let uid = "${uid}";
    let bid = "${board.b_uid}";

    if(uid == bid){
        $("#upbtn").show();
        $("#delbtn").show();
    }

    function backbtn(){
        let urlstr = "/boardList?";
        let col = "${sdto.colname}";
        let keyw = "${sdto.keyword}";

        if(col == null || col == ""){//검색을 수행하지 않은 경우
            urlstr += "pageNum=${pageNum}";
        } else {//검색을 한 경우
            urlstr += "colname=${sdto.colname}" +
                "&keyword=${sdto.keyword}" +
                "&pageNum=${pageNum}";
        }
        //console.log(urlstr);
        location.href = urlstr;
    }
    function commentInsert() {
        //form에 작성한 내용 가져와서 serialize
        const commentForm = $("#cinput").serialize();
        console.log(commentForm);

        //controller에 전송(ajax)
        $.ajax({
            url: "commentInsert",
            type: "post",
            data: commentForm,
            success: function (res) {
                console.log(res);
                let str = "";
                str += "<tr>" + "<td class='p-20'>" + res.c_id + "</td>"
                    + "<td class='p-50'>" + res.c_contents + "</td>"
                    + "<td class='p-30'>" + res.c_date + "</td>" + "<tr>";

                $("#ctable").prepend(str);//첫번째 위치에 댓글 삽입
                $("#comment").val("");//작성완료후 댓글 입력창의 내용 지우기
                alert("댓글 작성 성공");
            },
            error: function (err) {
                console.log(err);
                alert("댓글 작성 실패");
                $("#comment").val("");
                $("#comment").focus();
            }
        });
    }

    function delCheck(bno){
        //상세 화면으로 보이는 게시글을 삭제(글번호로 삭제)
        //alert(bno);
        let conf = confirm("삭제하시겠습니까?");
        if (conf == true){
            location.href = "/boardDelete?b_no=" + bno;
        }
    }

    function upboard(bno){
        location.href = "/boardUpdate?b_no=" + bno;
    }
</script>
</html>
