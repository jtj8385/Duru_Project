<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>프로그램 사업자 목록</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/proListBus.css">
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
            width: 1070px;
            height: 60px;
            display: flex;
            align-items: center;
            border-radius: 15px;
            margin: 0 auto;
        }
        #banner h1 {
            margin-left: 20px;
        }
        section{
            margin-bottom: 500px;
        }
        .btn-area{
            left: -20px;
        }
        #pname{
            margin-top: 10px;
            font-size: medium;
            line-height: 34px;
        }
        #paddr{
            margin-top: 10px;
            font-size: medium;
            line-height: 34px;
        }
        #ptime{
            margin-top: 10px;
            font-size: medium;
            line-height: 34px;
        }
        #pkind{
            margin-top: 10px;
            font-size: medium;
            line-height: 34px;
        }
        #psubject{
            margin-top: 10px;
            font-size: medium;
            line-height: 34px;
        }
    </style>
</head>
<body>
<div class="wrap">
    <header><jsp:include page="headerAfter.jsp"></jsp:include></header>
    <section>
        <div id="banner"><h1>프로그램 목록</h1></div>
        <div class="content">
            <div class="program-form">
                <div class="data-area">
                    <div class="title-row">
                        <div class="t-cname" id="title-name">프로그램 이름</div>
                        <div class="t-addr">센터 위치</div>
                        <div class="t-kind">프로그램 종류</div>
                        <div class="t-time">시간</div>
                        <div class="t-subject">대상자</div>
                        <div class="t-button" id="title-button"></div>
                    </div>
                    <div class="data-row">
                        <c:if test="${empty proinfo}">
                            <div style="width: 100%">
                                등록된 프로그램이 없습니다.
                            </div>
                        </c:if>
                        <c:if test="${!empty proinfo}">
                            <c:forEach var="pitem" items="${proinfo}">
                                <div class="t-cname" id="pname">${pitem.proname}</div>
                                <div class="t-addr" id="paddr">${pitem.paddr}</div>
                                <div class="t-kind" id="pkind">${pitem.pkind}</div>
                                <div class="t-time" id="ptime">${pitem.ptime}</div>
                                <div class="t-subject" id="psubject">${pitem.psubject}</div>
                                <div class="t-button">
                                    <input type="button" value="수정" id="pUpBtn" class="upbtn" onclick="pUp(${pitem.p_no})">
                                    <input type="button" value="삭제" id="pDelBtn" class="upbtn" onclick="pDel(${pitem.p_no})">
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="btn-area">
                <button class="wr-btn"
                        onclick="location.href='/proInput'">프로그램 추가</button>
                <button class="wr-btn"
                        onclick="location.href='/proSelect'">뒤로가기</button>
            </div>
        </div>

    </section>
        <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
<script>
    function pDel(p_no){
        //상세 화면으로 보이는 프로그램을 삭제(프로그램 번호로 삭제)
        let conf = confirm("삭제하시겠습니까?");
        if (conf == true){
            location.href = "/proDelete?p_no=" + p_no;
        }
    }
    function pUp(p_no){
        location.href = "/proUpdate?p_no=" + p_no;
    }

</script>
</html>
