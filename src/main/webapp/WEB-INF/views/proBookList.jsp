<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>프로그램 사업자 목록</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/proBookList.css">
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
            left: 70px;
        }
        #pname{
            font-size: medium;
            line-height: 38px;
        }
        #pkind{
            font-size: medium;
            line-height: 38px;
        }
        #ptime{
            font-size: medium;
            line-height: 38px;
        }
        #pbname{
            font-size: medium;
            line-height: 38px;
        }
        #birth{
            font-size: medium;
            line-height: 38px;
        }
        #pnum{
            font-size: medium;
            line-height: 38px;
        }
    </style>
</head>
<body>
<div class="wrap">
    <header><jsp:include page="headerAfter.jsp"></jsp:include></header>
    <section>
        <div id="banner"><h1>프로그램 신청자 정보 조회</h1></div>
        <div class="content">
            <div class="program-form">
                <div class="data-area">
                    <div class="title-row">
                        <div class="t-name">프로그램 이름</div>
                        <div class="t-kind">프로그램 종류</div>
                        <div class="t-time">시간</div>
                        <div class="t-bname">신청자명</div>
                        <div class="t-birth">생년월일</div>
                        <div class="t-num">전화번호</div>
                    </div>
                    <div class="data-row">
                        <c:if test="${empty proinfo}">
                            <div style="width: 100%">
                                등록된 프로그램이 없습니다.
                            </div>
                        </c:if>
                        <c:if test="${!empty proinfo}">
                            <c:forEach var="pitem" items="${proinfo}">
                                <div class="t-name" id="pname">${pitem.proname}</div>
                                <div class="t-kind" id="pkind">${pitem.pkind}</div>
                                <div class="t-time" id="ptime">${pitem.ptime}</div>
                                <div class="t-bname" id="pbname">${pitem.pb_uname}</div>
                                <div class="t-birth" id="birth">${pitem.ubirth}</div>
                                <div class="t-num" id="pnum">${pitem.uphone_num}</div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="btn-area">
                <button class="wr-btn"
                        onclick="location.href='/proSelect'">뒤로가기</button>
            </div>
        </div>
    </section>
        <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>
