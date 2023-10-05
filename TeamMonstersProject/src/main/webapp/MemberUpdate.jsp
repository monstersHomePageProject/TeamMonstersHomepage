<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="MemeberUpdateError.jsp"%>
<%@page import="monsters.model.*, monsters.service.*"%>
<jsp:useBean id="mservice" type="monsters.service.MemberService"
	scope="application" />
<jsp:useBean id="user" class="monsters.model.MemberDTO" scope="request" />

<!DOCTYPE html>
<html>
<head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap')
	;

* {
	box-sizing: border-box; /*전체에 박스사이징*/
	outline: none; /*focus 했을때 테두리 나오게 */
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 16px;
	background-color: #ffffff;
	line-height: 1.5em;
	color: darkblue;
	margin: 0;
}

/*member*/
.user-card {
	color: darkblue;
	width: 400px;
	/* border: 1px solid #000; */
	margin: auto;
	/*중앙 정렬*/
	display: block;
	padding: 0 20px;
	margin-bottom: 30px;
}

.mainTitle {
	margin-top: 20px;
	color: #2a009e;
	text-align: center;
	/*수직 정렬하기 */
	margin-bottom: 20px;
	font-size: 25pt;
	font-weight: bold; /* 글씨 굵기를 설정합니다. */
}

.field {
	margin-top: 20px;
	/*상하로 좀 띄워주기*/
}

.user-card d {
	margin-top: 20px;
	color: #2a009e;
	text-align: center;
	/*수직 정렬하기 */
	margin-bottom: 5px;
	font-size: 25pt;
}

.user-card .logo {
	/*로고는 이미지라 인라인 블록이니까 마진 오토 안됨 블록요소만 됨 */
	display: block;
	margin: 10px auto;
}

.user-card b {
	/* border: 1px solid #000; */
	display: flex;
	/*수직 정렬하기 */
	margin-bottom: 5px;
	font-size: 15pt;
}

.field select {
	display: inline-block;
	width: auto;
	margin-left: 10px; /* 권한과 선수 ID 사이의 간격 조절 */
}

.field input[name="memPlId"] {
	font-size: 12pt; /* 원하는 글꼴 크기로 설정 */
	width: auto; /* 너비 자동 조정 */
	margin-left: 10px;
}

.upButton {
	border-radius: 3px;
	background-color: #2a009e;
	color: #fff;
	font-weight: 900;
	width: 100%;
	height: 40px;
	padding: 0;
	font-size: 12pt;
}
</style>
<meta charset="UTF-8">
<title>멤버 정보 업데이트</title>
</head>
<body>

		<form name="updateForm" action="MemberUpdateAction.jsp"
			onsubmit="return checkUpdate(updateForm);" method="post">
	<div class="user-card">
			<input type="hidden" name="memId" value="<%=user.getMemId()%>">
			<input type="hidden" name="memName" value="<%=user.getMemName()%>">
			<input type="hidden" name="memPwd" value="<%=user.getMemPwd()%>">
			<input type="hidden" name="memEmail" value="<%=user.getMemEmail()%>">
			<input type="hidden" name="memPhone" value="<%=user.getMemPhone()%>">

			<!-- 1. 로고 -->
			<!-- <img class="logo" src="./img/logo.png"> -->

			<div class="mainTitle">
				멤버 정보 수정  <br> <br>
			</div>
			<div class="field">
				<b> ID : <%=user.getMemId()%>
				</b>
			</div>
			<div class="field">
				<b> 이름 : <%=user.getMemName()%>
				</b>
			</div>
			<div class="field">
				<b> 이메일 : <%=user.getMemEmail()%>
				</b>
			</div>

			<div class="field">
				<b> 전화번호 : <%=user.getMemPhone()%>
				</b>
			</div>

			<%
			String defaultValue1 = user.getMemRole();
			%>
			<div class="field">
				<b> 권한 : <select name="memRole">
					<option value="guest"
						<%=(defaultValue1.equals("guest") ? "selected" : "")%>>1.
						팬</option>
					<option value="bplayer" 
						<%=(defaultValue1.equals("bplayer") ? "selected" : "")%>>2.
						선수</option>
				</select>
				</b> 
			</div>
			<div class="field">
				<b> 선수ID : <input name="memPlId"
					placeholder="<%=user.getMemPlId()%>+'(숫자만 입력해주세요.)'">
				</b>
			</div>
			<br>
			<br>

			<button class="upButton" type="submit">수정</button>
			<br>
			<br>
			<button class="upButton" type="button">취소</button>
	</div>
	</form>

	<script type="text/javascript">
  	function checkUpdate(form) {
  		var result = true;
  		var check = r'^\d+$';
  		
  		if(check.test(form.memPlId.value)){
  			return = false;
  			msg = "선수ID는 숫자만 입력해주세요.";
  		}
  		
  		if (result == false) {
  	        alert(msg);
  	      }
  		return result;
  	}
  
  </script>
</body>
</html>