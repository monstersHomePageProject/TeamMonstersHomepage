<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "monsters.model.*" %>
<jsp:useBean id="mservice" type = "monsters.model.MemberDAO" scope = "application" />
<jsp:useBean id="member" type = "monsters.model.MemberDTO" scope = "session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수등록화면</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');

    *{
    box-sizing: border-box; /*전체에 박스사이징*/
    outline: none; /*focus 했을때 테두리 나오게 */
    }
    body{
    font-family: 'Noto Sans KR', sans-serif;
    font-size:16px;
    background-color: #ffffff;
    line-height: 1.5em;
    color : #222;
    margin: 0;
    }
    /*member*/
    .bbplayer{
    width: 400px;
    /* border: 1px solid #000; */
    margin: auto; /*중앙 정렬*/
    padding: 0 20px;
    margin-bottom: 20px;
    }
    .bbplayer .logo{
    /*로고는 이미지라 인라인 블록이니까 마진 오토 안됨 블록요소만 됨 */
    display: block;
    margin : 10px auto;
    }
    .bbplayer .field{
    margin : 5px 0; /*상하로 좀 띄워주기*/
    }
    .bbplayer b{
    /* border: 1px solid #000; */
    display: block; /*수직 정렬하기 */
    margin-bottom: 5px;
    }
    .bbplayer input,.bbplayer select, .bbplayer textarea{
    border: 1px solid #dadada;
    padding: 15px;
    width: 100%;
    margin-bottom: 5px;
    }
    .bbplayer input[type=button],
    .bbplayer input[type=submit]{
    background-color: #3300be;
    color:#fff
    }
    .bbplayer input:focus, .bbplayer select:focus{
    border: 2px solid #0003ce;
    }
</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function changeValue(input) {
    var selectedFile = input.files[0];
    var validExtensions = ["jpg", "jpeg", "png", "svg"];
    
    // 파일 이름에서 마지막 점(.) 이후의 문자열을 추출하여 소문자로 변환합니다.
    var fileExtension = selectedFile.name.split('.').pop().toLowerCase();

    if (validExtensions.indexOf(fileExtension) === -1) {
        alert("올바른 파일 확장자가 아닙니다. .jpg, .jpeg, .png 파일만 업로드 가능합니다.");
        // 파일 입력 필드 초기화
        input.value = '';
    } else {
        $(".file span").text(selectedFile.name);
    }
    }
    function checkInput(form) {
        var pl_physical = form.pl_physical.value;
        
        var regex = /^[0-9]+$/; // 
        var regex2 = /^\d{1,3}cm, \d{1,3}kg$/; // 숫자 1-3자리, "cm, " 문자열, 숫자 1-3자리, "kg" 문자열 형식을 검사하는 정규식
		
        if (!regex2.test(pl_physical)) {
            alert("허용되지 않는 형식입니다. 형식은 (숫자)cm, (숫자)kg 여야 합니다.");
            return false; // 유효성 검사 실패
        }
        
        if(!regex.test(form.pl_backNo.value)){
            alert("허용되지 않는 형식입니다. 등번호는 숫자만 입력해야 합니다.");
            return false; // 유효성 검사 실패
        }

        return true; // 유효성 검사 성공
    }
	function checkNumber(event) {
  		if(event.key === '.' 
     	|| event.key === '-'
     	|| event.key >= 0 && event.key <= 9) {
    	return true;
  		}
  
  	return false;
	}
</script>
<form name="insertForm" action="insertPlAction.jsp" onsubmit="return checkInput(insertForm);" method="get" enctype="multipart/form-data">
<div class = "bbplayer">
	<!-- 1. 로고 -->
	<img class="logo" src="./img/logo.png">
	
	<!-- 2. 필드 -->
	<div class = "field">
        <b>선수 이름</b>
        <input name = "pl_name" type = "text" required>
    </div>
	<div class = "field">
        <b>포지션</b>
        <select name = "pl_position" required>
            <option value="">포지션 선택</option>
            <option value="1">1. 외야수</option>
            <option value="2">2. 내야수</option>
            <option value="3">3. 투수</option>
            <option value="4">4. 포수</option>
            <option value="5">5. 감코진</option>
            <option value="6">6. 취업선수</option>
        </select>
    </div>
	<div class="field birth">
        <b>생년월일</b>
        <div>
            <input name = "pl_birth" type="date" id="date" max="2050-12-31" min="1900-01-01" value="2000-09-20">
        </div>
    </div>
	<div class = "field">
        <b>등번호</b>
        <input name = "pl_backNo" type="text" onkeypress="return checkNumber(event)" required>
    </div>
	<div class = "field">
        <b>신체정보</b>
        <input name = "pl_physical" type = "text" placeholder="ooocm, oookg(형식에 맞춰 입력해주세요.)">
    </div>
	<div class = "field">
        <b>투타</b>
        <select name="pl_PnH" required>
            <option value="">투타 선택</option>
            <option value="1">1. 우투우타</option>
            <option value="2">2. 우투좌타</option>
            <option value="3">3. 좌투우타</option>
            <option value="4">4. 좌투좌타</option>
            <option value="5">5. 우투</option>
            <option value="6">6. 좌투</option>
            <option value="7">7. 우타</option>
            <option value="8">8. 좌타</option>
        </select>
    </div>
	<div class = "field">
        <b>Subject</b>
        <textarea name="pl_subject" style="resize: none;" maxlength="100" cols = "60" rows="5" placeholder="선수소개 - 메인(100글자 이내)"></textarea>
    </div>
	<div class = "field">
        <b>Content</b>
        <textarea name="pl_contents" style="resize: none;" maxlength="200" cols = "60"  rows="5" placeholder="선수소개 - 디테일(200글자 이내)"></textarea>
    </div>
    <div class = "field">
        <b>이미지</b>
        <input name="pl_imgName" id = "fileUpload" type = "file" accept = ".jpg, .jpeg, .png, .svg" onchange="changeValue(this)">
    </div>
    <input type="submit" value="등록하기">
</div>
</form>
</body>
</html>