<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>택시 호출 정보(사용자)</title>
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
            width: 820px;
            height: 60px;
            display: flex;
            align-items: center;
            border-radius: 15px;
            margin: 0 auto;
        }
        #banner h1 {
            margin-left: 20px;
        }
        #contain-tbList {
            width: 820px;
            height: 450px;
            background-color: white;
            margin: 0 auto;
            border-left: 2px solid rgb(180, 180, 180);
            border-right: 2px solid rgb(180, 180, 180);
        }
        #locationContainer{
            width: 800px;
            height: 100px;
            background-color: #ecf2ff;
            margin-left: 10px;
            padding-top: 20px;
        }
        #location1{
            margin-left: 10px;
            align-items: center;
        }
        #outputLocation{
            width: 650px;
            height: 60px;
            background-color: rgb(255, 255, 255);
            border-radius: 5px;
            margin-left: 120px;
            margin-top: -20px;
        }
        #destinationContainer{
            width: 800px;
            height: 100px;
            background-color: #ecf2ff;
            margin-left: 10px;
            border-top: 2px solid rgb(180, 180, 180);
            justify-content: space-between;
            padding-top: 20px;
        }
        #destination1{
            margin-left: 10px;
        }
        #outputDestination{
            width: 650px;
            height: 60px;
            background-color: rgb(255, 255, 255);
            border-radius: 5px;
            margin-left: 120px;
            margin-top: -20px;
        }
        #numContainer{
            width: 400px;
            height: 80px;
            background-color: #ecf2ff;
            margin-left: 10px;
            border-right: 2px solid rgb(180, 180, 180);
            border-top: 2px solid rgb(180, 180, 180);
            justify-content: space-between;
            padding-top: 20px;
            float: left;
        }
        #num1{
            margin-left: 10px;
        }
        #outputNum{
            width: 40px;
            height: 40px;
            background-color: rgb(255, 255, 255);
            border-radius: 5px;
            margin-left: 120px;
            margin-top: -20px;
        }
        #carTypeContainer{
            width: 600px;
            height: 80px;
            background-color: #ecf2ff;
            margin-left: 210px;
            border-left: 2px solid rgb(180, 180, 180);
            border-top: 2px solid rgb(180, 180, 180);
            justify-content: space-between;
            padding-top: 20px;
        }
        #carType1{
            margin-left: 10px;
        }
        #outputCarType{
            width: 50px;
            height: 40px;
            background-color: rgb(255, 255, 255);
            border-radius: 5px;
            margin-left: 300px;
            margin-top: -20px;
        }
        #confirm{
            margin: 0 auto;
            display: block;
            margin-top: 90px;
            border: none;
            width:120px;
            height: 40px;
            background-color: #4999e4;
            color: white;
            border-radius: 10px;
        }
        #confirm:hover{
            background-color: #4a82d6;
        }
        table {
            border-spacing: 1;
            border-collapse: collapse;
            border: 1px;
            background: white;
            border-radius: 6px;
            overflow: hidden;
            max-width: 800px;
            width: 95%;
            margin: 0 auto;
            position: relative;
            top: 30px;
        }
        table * {
            position: relative;
        }
        table td, table th {
            padding-left: 8px;
        }
        table thead tr {
            height: 60px;
            background: #4999e4;
            font-size: 16px;
        }
        table tbody {
            height: 60px;
        }
        table tbody tr:last-child {
            border: 0;
        }
        table td {
            text-align: left;
        }
        table th {
            text-align: center;
        }
        #tCheck-bigbox{
            margin-bottom: 150px;
            margin-top: 100px;
        }
        .tax-content{
            text-align: center;
            font-size: small;
        }
    </style>
</head>
<body>
<header>
    <jsp:include page="headerAfter.jsp"></jsp:include>
</header>
<div id="tCheck-bigbox">
    <div id="banner"><h1>택시 호출 정보</h1></div><br>
    <div id="contain-tbList">
        <div id="locationContainer">
            <div id="location"><label id="location1">현재 위치</label>
            </div>
            <div id="outputLocation" style="display: flex; align-items: center;">
                <c:choose>
                    <c:when test="${empty taxInfo.current_loc}">
                        <c:out value="현재 호출한 택시가 없습니다." />
                    </c:when>
                    <c:otherwise>
                        <c:out value="${taxInfo.current_loc}" />
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div id="destinationContainer">
            <div id="destination"><label id="destination1">목적지</label>
            </div>
            <div id="outputDestination" style="display: flex; align-items: center;">
                <c:choose>
                    <c:when test="${empty taxInfo.destination}">
                        <c:out value="현재 호출한 택시가 없습니다." />
                    </c:when>
                    <c:otherwise>
                        <c:out value="${taxInfo.destination}" />
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div id="numContainer">
            <div id="num"><label id="num1">인원수</label>
            </div>
            <div id="outputNum" style="display: flex; align-items: center; justify-content: center;">
                <c:choose>
                    <c:when test="${empty taxInfo.thead_count}">
                        <c:out value="" />
                    </c:when>
                    <c:otherwise>
                        <c:out value="${taxInfo.thead_count}명" />
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div id="carTypeContainer">
            <div id="carType">
                <label id="carType1">차종</label>
            </div>
            <div id="outputCarType" style="display: flex; align-items: center; justify-content: center;">
                <c:choose>
                    <c:when test="${empty taxInfo.tcar_kind}">
                        <c:out value="" />
                    </c:when>
                    <c:otherwise>
                        <c:out value="${taxInfo.tcar_kind}" />
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <table>
            <thead>
            <tr>
                <th>기사 이름</th>
                <th>기사 전화번호</th>
                <th>차량번호</th>
                <th>배차상태</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${empty taxMember && empty taxInfo}">
                <tr>
                    <td colspan="4" style="text-align: center;">현재 호출한 택시가 없습니다.</td>
                </tr>
            </c:if>
            <c:if test="${not empty taxMember && not empty taxInfo}">
                <tr>
                    <td class="tax-content">${taxMember.tname}</td>
                    <td class="tax-content">${taxMember.tphone_num}</td>
                    <td class="tax-content">${taxMember.carnum}</td>
                    <td class="tax-content" id="statusText">
                            ${taxMember.status == 0 ? '배차 대기': '배차 완료'}</td>
                </tr>
            </c:if>
            </tbody>
        </table>
        <button id="confirm" onclick="location.href='/homeAfter'">확인</button>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
