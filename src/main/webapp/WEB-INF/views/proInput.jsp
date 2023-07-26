<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>프로그램 입력</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/proInput.css">
</head>
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
        width: 800px;
        height: 60px;
        display: grid;
        align-items: center;
        border-radius: 15px;
        margin: 0 auto;
        margin-top: 50px;
    }
    #banner h1 {
        margin-left: 20px;
    }
    .input-form label {
        text-align: right; /* 라벨을 오른쪽 정렬 */
        display: inline-block;
        width: 150px; /* 라벨의 너비 조정 */
        margin-bottom: 30px;
        margin-left: 160px;
        font-size: 20px;
    }
    .textbox {
        width: 200px; /* input의 너비 조정 */
        height: 30px;
        margin-left: 20px;
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

<body>
<div class="wrap">
    <header>
        <jsp:include page="headerAfter.jsp"></jsp:include>
    </header>
    <section>
        <div id="banner"><h1>프로그램 등록</h1></div>
        <div class="content">
            <form action="proInputProc" class="input-form" method="post">
                <!-- 로그인한 id, 제목, 내용 -->
                <div id="input-box">
                <input type="hidden" name="p_pid" id="p_pid" value="${pid}" class="textbox">
                <label>프로그램 이름</label> <!-- 라벨 따로 위치 지정 -->
                <input type="text" name="proname" class="textbox" required>
                <br> <!-- 줄 바꿈 추가 -->
                <label>센터 위치</label> <!-- 라벨 따로 위치 지정 -->
                <input type="text" name="paddr" class="textbox" required >
                <br> <!-- 줄 바꿈 추가 -->
                <label>프로그램 종류</label> <!-- 라벨 따로 위치 지정 -->
                <input type="text" name="pkind" class="textbox" required >
                <br> <!-- 줄 바꿈 추가 -->
                <label>시간</label> <!-- 라벨 따로 위치 지정 -->
                <input type="text" name="ptime" class="textbox" required >
                <br> <!-- 줄 바꿈 추가 -->
                <label>대상자</label> <!-- 라벨 따로 위치 지정 -->
                <input type="text" name="psubject" class="textbox" required >
                </div>
                <br> <!-- 줄 바꿈 추가 -->
                <div class="btn-area">
                    <input type="submit" class="btn-write" value="등록">
                    <input type="button" class="btn-write" value="뒤로가기" onclick="backbtn()">
                </div>
            </form>
        </div>
    </section>
        <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
<script>
    function backbtn(){
        window.history.back();
    }
</script>
</html>
