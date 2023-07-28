<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>음식점 사업자 회원가입 페이지</title>
    <link rel="stylesheet" href="css/resJoin_style.css" />
    <script src="js/jquery-3.7.0.min.js"></script>
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
<form action="resJoinProc" method="POST" class="joinForm"
      name="rJoinForm" onsubmit="return check() && checkPassword()">

    <h2>음식점 회원가입</h2>
    <div class="textForm">
        <input name="rid" id="rid" type="text" title="아이디" class="id" placeholder="아이디">

    </div>
    <div class="textForm">
        <input name="rpwd" type="password" title="비밀번호" class="pw" placeholder="비밀번호">
    </div>
    <div class="textForm">
        <input name="rpwd_confirm" type="password" title="비밀번호 확인" class="pw_confirm" placeholder="비밀번호 확인">
    </div>
    <div class="textForm">
        <input name="rname" type="text" title="상호명" class="res_name" placeholder="상호명">
    </div>
    <div class="textForm">
        <input name="rbus_num" type="text" title="사업자 번호" class="res_num" placeholder="사업자 번호">
    </div>
    <div class="textForm">
        <input name="rphone_num" type="text" title="전화번호" class="phone" placeholder="전화번호">
    </div>
    <div class="textForm">
        <input name="raddr" type="text" title="음식점 주소" class="address" placeholder="음식점 주소">
    </div>
    <div class="textForm">
        <input name="maindish" type="text" title="주메뉴" class="menu" placeholder="주메뉴">
    </div>
    <div class="textForm">
        <input name="rnum" type="text" title="음식점 전화번호" class="menu" placeholder="음식점 전화번호">
    </div>
    <div class="textForm">
        <input name="facil_size" type="text" title="생활편의시설 규모" class="size" placeholder="생활편의시설 규모">
    </div>

    <input type="submit" class="btn" value="회원가입">
    <input type="submit" class="back-btn" value="뒤로가기" onclick="goBack()">
</form>
<input class="w-btn-id w-btn-green" value="중복확인" type="button" onclick="rIdCheck()">
</body>
<script>
    //이전 페이지 이동
    function goBack() {
        window.history.back();
    }

    //비밀번호와 비밀번호 확인 두가지가 같은지 확인하는 메서드
    function checkPassword() {
        const password = document.rJoinForm.rpwd.value;
        const confirmPassword = document.rJoinForm.rpwd_confirm.value;

        if (password !== confirmPassword) {
            alert("비밀번호를 같게 입력해주세요.");
            return false;
        }

        return true;
    }

    //아이디 중복 체크
    let ck = false;
    //false일 경우 중복체크를 안했거나 중복된 아이디를 입력한 상태

    function rIdCheck(){
        let id = $("#rid").val();
        console.log(id)

        //id값을 입력했는지 검사
        if (id == "") {//입력을 안했을 경우
            alert("아이디를 입력해주세요");
            $("#rid").focus();
            return;
        }
        //전송할 데이터 작성
        let sendId = {"pid": id};
        console.log(sendId)

        //서버로 id전송
        $.ajax({
            url: "rIdCheck",
            type: "get",
            data: sendId,
            success: function (res){
                if(res == "ok"){
                    alert("사용가능한 아이디입니다.");
                    ck = true;
                } else {
                    alert("이미 존재하는 아이디입니다.");
                    $("#rid").val("");
                    $("#rid").focus();
                    ck = false;
                }
            },
            error: function (err) {
                console.log(err);
                ck = false;
            }
        });
    }//rIdCheck end

    //중복확이이 되었고, 모든 입려깅 된 다음에 전송하도록 하는 함수
    function check(){
        //아이디 중복확인이 되었는가?
        if(ck == false){
            alert("아이디 중복 확인을 해주세요.");
            return false;//submit 중지(전송 안됨)
        }

        //form 태그의 내용 확인(누락된 부분)
        const rjoinfm = document.rJoinForm;//js에서 form태그를 통쨰로 가져오는 방식
        console.log(rjoinfm);

        let length = rjoinfm.length - 1;//submit 제외

        for (let i = 0; i < rjoinfm.length; i++) {
            // facil_size 입력 부분은 제외하고 확인
            if (rjoinfm[i].name !== "facil_size" && (rjoinfm[i].value === "" || rjoinfm[i].value === null)) {
                alert(rjoinfm[i].title + "를(을) 입력해주세요.");
                rjoinfm[i].focus();
                return false;
            }
        }
        return true;
    }
</script>
</html>
