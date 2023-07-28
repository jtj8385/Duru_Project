<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <title>프로그램 사업자 회원가입</title>
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
<style>
  @font-face {
    font-family: 'TheJamsil5Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
  }
  * {
    margin: 0px;
    padding: 0px;
    text-decoration: none;
    font-family: 'TheJamsil5Bold';

  }

  body {
    background-image:#34495e;
  }

  .joinForm {
    position:absolute;
    width:400px;
    height:400px;
    padding: 30px, 20px;
    background-color:#FFFFFF;
    text-align:center;
    top:40%;
    left:50%;
    transform: translate(-50%,-50%);
    border-radius: 15px;
  }

  .joinForm h2 {
    text-align: center;
    margin: 30px;
  }

  .textForm {
    border-bottom: 2px solid #adadad;
    margin: 30px;
    padding: 10px 10px;

  }


  .id {
    width: 100%;
    border:none;
    outline:none;
    color: #636e72;
    font-size:16px;
    height:25px;
    background: none;
  }

  .pw {
    width: 100%;
    border:none;
    outline:none;
    color: #636e72;
    font-size:16px;
    height:25px;
    background: none;
  }

  .name {
    width: 100%;
    border:none;
    outline:none;
    color: #636e72;
    font-size:16px;
    height:25px;
    background: none;
  }

  .buscode{
    width: 100%;
    border:none;
    outline:none;
    color: #636e72;
    font-size:16px;
    height:25px;
    background: none;
  }

  .location {
    width: 100%;
    border:none;
    outline:none;
    color: #636e72;
    font-size:16px;
    height:25px;
    background: none;
  }
  .btn {
    position:relative;
    left:15%;
    transform: translateX(-50%);
    margin-bottom: 40px;
    width:35%;
    height:40px;
    background-color: #4999e4;
    background-position: left;
    background-size: 200%;
    border-radius: 3px;
    color: white;
    font-weight: bold;
    border:none;
    cursor:pointer;
    transition: 0.4s;
    display:inline;
  }
  .btn:hover {
    background-color: #4a82d6;
  }
  .back-btn {
    position:relative;
    left:20%;
    transform: translateX(-50%);
    margin-bottom: 40px;
    width:35%;
    height:40px;
    background-color: #4999e4;
    background-position: left;
    background-size: 200%;
    border-radius: 3px;
    color:white;
    font-weight: bold;
    border:none;
    cursor:pointer;
    transition: 0.4s;
    display:inline;
  }
  .back-btn:hover{
    background-color: #4a82d6;
  }
  .btn:hover {
    background-position: right;
  }
  .back-btn:hover {
    background-position: right;
  }
  .w-btn{
    position: relative;
    border: none;
    display: block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: 'TheJamsil5Bold';
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
    width:150px;
    margin: 0 auto;
    left: 250px;
    top: 720px;
  }
  .w-btn-code{
    position: relative;
    border: none;
    display: block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: 'TheJamsil5Bold';
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
    width:150px;
    margin: 0 auto;
    left: 250px;
    top: 750px;
  }
  .w-btn-green{
    background-color: #77af9c;
    color: #d7fff1;
  }
  .w-btn-green:hover{
    background-color: #659485;
  }
  .phone{
    width: 100%;
    border:none;
    outline:none;
    color: #636e72;
    font-size:16px;
    height:25px;
    background: none;
  }
  .w-btn-id{
    position: relative;
    border: none;
    display: block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: 'TheJamsil5Bold';
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
    width:150px;
    margin: 0 auto;
    left: 270px;
    top: 280px;
  }
</style>
<body>
<form action="proJoinProc" method="post" class="joinForm"
      name="pJoinForm"  onsubmit="return check() && checkPassword()">

  <h2>프로그램 회원가입</h2>
  <div class="textForm">
    <input name="pid" id="pid" type="text" title="아이디" class="id" placeholder="아이디">

  </div>
  <div class="textForm">
    <input name="ppwd" type="password" title="비밀번호" class="pw" placeholder="비밀번호">
  </div>
  <div class="textForm">
    <input name="ppwd_confirm" type="password" title="비밀번호 확인" class="pw" placeholder="비밀번호 확인">
  </div>
  <div class="textForm">
    <input name="pcenter_name" type="text" title="센터 이름" class="name" placeholder="센터 이름">
  </div>
  <div class="textForm">
    <input name="pcenter_loc" type="text" title="센터 위치" class="location" placeholder="센터 위치">
  </div>
  <div class="textForm">
    <input name="pcenter_num" type="text" title="센터 전화번호" class="phone" placeholder="센터 전화번호">
  </div>
  <div class="textForm">
    <input name="pbus_num" type="text" title="사업자 번호" class="buscode" placeholder="사업자 번호">
  </div>

  </div>
  <input type="submit" class="btn" value="회원가입">
  <input type="submit" class="back-btn" value="뒤로가기" onclick="goBack()">
</form>
<input class="w-btn-id w-btn-green" value="중복확인" type="button" onclick="pIdCheck()">
</body>

<script>
  //이전 페이지 이동
  function goBack() {
    window.history.back();
  }

  //비밀번호와 비밀번호 확인 두가지가 같은지 확인하는 메서드
  function checkPassword() {
    const password = document.pJoinForm.ppwd.value;
    const confirmPassword = document.pJoinForm.ppwd_confirm.value;

    if (password !== confirmPassword) {
      alert("비밀번호를 같게 입력해주세요.");
      return false;
    }
    return true;
  }

  //아이디 중복 체크
  let ck = false;
  //false일 경우 중복체크를 안했거나 중복된 아이디를 입력한 상태

  function pIdCheck(){
    let id = $("#pid").val();
    console.log(id)

    //id값을 입력했는지 검사
    if (id == ""){//입력을 안했을 경우
      alert("아이디를 입력해주세요");
      $("#pid").focus();
      return;
    }

    //전송할 데이터 작성
    let sendId = {"pid": id};
    console.log(sendId)

    //서버로 id전송
    $.ajax({
      url: "pIdCheck",
      type: "get",
      data: sendId,
      success: function (res){
        if(res == "ok"){
          alert("사용가능한 아이디입니다.");
          ck = true;
        } else {
          alert("이미 존재하는 아이디입니다.");
          $("#pid").val("");
          $("#pid").focus();
          ck = false;
        }
      },
      error: function (err) {
        console.log(err);
        ck = false;
      }
    });
  }//pIdCheck end

  //중복확이이 되었고, 모든 입려깅 된 다음에 전송하도록 하는 함수
  function check(){
    //아이디 중복확인이 되었는가?
    if(ck == false){
      alert("아이디 중복 확인을 해주세요.");
      return false;//submit 중지(전송 안됨)
    }

    //form 태그의 내용 확인(누락된 부분)
    const pjoinfm = document.pJoinForm;//js에서 form태그를 통쨰로 가져오는 방식
    console.log(pjoinfm);

    let length = pjoinfm.length - 1;//submit 제외

    for(let i = 0; i < length; i++){
      if(pjoinfm[i].value == "" || pjoinfm[i].value == null){
        alert(pjoinfm[i].title + "를(을) 입력해주세요.");
        pjoinfm[i].focus();
        return false;
      }
    }
    return true;
  }

</script>
</html>