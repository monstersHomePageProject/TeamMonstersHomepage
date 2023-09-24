<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="updatePlError.jsp"%>
<%@page import="monsters.model.*"%>
<jsp:useBean id="player" type="monsters.model.PlayerDTO" scope="request"/>
<jsp:useBean id="pservice" type="monsters.model.PlayerDAO" scope="application"/>
<jsp:useBean id="mservice" type="monsters.model.MemberDAO" scope="application"/>
<jsp:useBean id="member" type = "monsters.model.MemberDTO" scope = "session" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수정보 업데이트</title>
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
<%
	System.out.println("updatePl :: "+player);
	//response.sendRedirect("updatePlError.jsp"); //일부러 오류를 내어 에러페이지 동작 확인하는 코드
%>
<form name="updateForm" action="updatePlAction.jsp" onsubmit="return checkInput(insertForm);" method="get" enctype="multipart/form-data">
<div class = "bbplayer">
	<!-- 1. 로고 -->
	<img class="logo" src="./img/logo.png">
	
	<!-- 2. 필드 -->
	<div class = "field">
        <b>선수 이름</b>
        <input name = "plName" type = "text" value = "<%=player.getPlName()%>" required>
    </div>
    <%
    int defaultValue = player.getPlPosition();
    %>
	<div class = "field">
        <b>포지션</b>
        <select name = "plPosition" required>
            <option value="">포지션 선택</option>
            <option value="1" <%=(defaultValue==1 ? "selected" : "")%>>1. 외야수</option>
            <option value="2" <%=(defaultValue==2 ? "selected" : "")%>>2. 내야수</option>
            <option value="3" <%=(defaultValue==3 ? "selected" : "")%>>3. 투수</option>
            <option value="4" <%=(defaultValue==4 ? "selected" : "")%>>4. 포수</option>
            <option value="5" <%=(defaultValue==5 ? "selected" : "")%>>5. 감코진</option>
            <option value="6" <%=(defaultValue==6 ? "selected" : "")%>>6. 취업선수</option>
        </select>
    </div>
	<div class="field birth">
        <b>생년월일</b>
        <div>
            <input name = "plBirth" type="date" id="date" max="2050-12-31" min="1900-01-01" value="<%=player.getPlBirth()%>">
        </div>
    </div>
	<div class = "field">
        <b>등번호</b>
        <input name = "plBackNo" type="text" onkeypress="return checkNumber(event)" value = "<%=player.getPlBackNo()%>" required
        		placeholder="3자리이하 숫자로만 입력해주세요.">
    </div>
	<div class = "field">
        <b>신체정보</b>
        <input name = "plPhysical" type = "text" value = "<%=player.getPlPhysical()%>">
    </div>
    <%
    int defaultValue2 = player.getPlPnH();
    %>
	<div class = "field">
        <b>투타</b>
        <select name="plPnH" value ="<%=player.getPlPnH()%>" required>
            <option value="">투타 선택</option>
            <option value="1" <%=(defaultValue2==1 ? "selected" : "")%>>1. 우투우타</option>
            <option value="2" <%=(defaultValue2==2 ? "selected" : "")%>>2. 우투좌타</option>
            <option value="3" <%=(defaultValue2==3 ? "selected" : "")%>>3. 좌투우타</option>
            <option value="4" <%=(defaultValue2==4 ? "selected" : "")%>>4. 좌투좌타</option>
            <option value="5" <%=(defaultValue2==5 ? "selected" : "")%>>5. 우투</option>
            <option value="6" <%=(defaultValue2==6 ? "selected" : "")%>>6. 좌투</option>
            <option value="7" <%=(defaultValue2==7 ? "selected" : "")%>>7. 우타</option>
            <option value="8" <%=(defaultValue2==8 ? "selected" : "")%>>8. 좌타</option>
        </select>
    </div>
	<div class = "field">
        <b>Subject</b>
        <textarea name="plSubject" style="resize: none;" maxlength="100" cols = "60" rows="5" ><%=player.getPlSubject()%></textarea>
    </div>
	<div class = "field">
        <b>Content</b>
        <textarea name="plContents" style="resize: none;" maxlength="200" cols = "60"  rows="5"><%=player.getPlContents()%></textarea>
    </div>
    <div class = "field">
        <b>이미지</b>
        <input name="plImgName" id = "fileUpload" type = "file" accept = ".jpg, .jpeg, .png, .svg" onchange="changeValue(this)" value = "<%=player.getPlImgName()%>">
        <input name="plId" type="hidden" value = "<%=player.getPlId()%>"> 
    </div>
    <input type="submit" value="등록하기">
</div>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function changeValue(input) {
    var selectedFile = input.files[0];
    //기존 선수 이미지
    var originalFile = <%=player.getPlImgName()%>;
    var validExtensions = ["jpg", "jpeg", "png", "svg"];
    
    if (selectedFile) {
    // 파일 이름에서 마지막 점(.) 이후의 문자열을 추출하여 소문자로 변환합니다.
    var fileExtension = selectedFile.name.split('.').pop().toLowerCase();
    if (validExtensions.indexOf(fileExtension) === -1) {
        alert("올바른 파일 확장자가 아닙니다. .jpg, .jpeg, .png 파일만           업로드 가능합니다.");
        // 파일 입력 필드 초기화
        input.value = '';
    } else {
        $(".file span").text(selectedFile.name);
    }
    } else {
        // No file selected, set input value to the existing value
        input.value = originalFile;
    }
	}
    function checkInput(form) {
        var pl_physical = form.plPhysical.value;
        
        var regex = /^[0-9]+$/; // 
        var regex2 = /^\d{1,3}cm, \d{1,3}kg$/; // 숫자 1-3자리, "cm, " 문자열, 숫자 1-3자리, "kg" 문자열 형식을 검사하는 정규식
		
        if (!regex2.test(plPhysical)) {
            alert("허용되지 않는 형식입니다. 형식은 (숫자)cm, (숫자)kg 여야 합니다.");
            return false; // 유효성 검사 실패
        }
        
        if(!regex.test(form.plBackNo.value)){
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
</body>
</html>