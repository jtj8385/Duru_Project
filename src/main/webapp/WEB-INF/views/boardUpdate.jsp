<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글수정</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/boardUpdate.css">
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
        width: 1200px;
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
    #b_uid{
        display: none;
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
        <div id="banner"><h1>게시판</h1></div>
        <div class="content">
            <form action="boardUpdateProc" class="input-form" method="post">
                <!-- 로그인한 id, 제목, 내용 -->
                <input type="hidden" name="b_uid" id="b_uid" value="${uid}">
                <input type="hidden" name="b_no" value="${board.b_no}">
                <input type="text" class="title-input" name="b_title"
                       autofocus placeholder="제목을 입력하세요." required value="${board.b_title}">
                <textarea name="b_contents" rows="15" placeholder="내용을 입력하세요."
                          class="write-input">${board.b_contents}</textarea>
                <div class="btn-area">
                    <input type="submit" class="btn-write" value="작성하기">
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
        location.href = "/boardDetail?b_no=${board.b_no}";
    }
</script>
</html>