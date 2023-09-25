<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<style>
	body {
        background-image: url('./img/background.svg');
        background-repeat: no-repeat;
        background-size: cover;
    }
    .loginbox{
    	background-color: rgba(199, 195, 195, 0.767);
    	border-radius: 5px;
    	width: 250px;
    	height: 100px;
    	margin: 0 auto;
    	margin-top: 300px;
    	margin-right: 80px;
    	
    	text-align: center;
    	
    }
    .loginForm{
        display: flex;
        justify-content: center;
        
        padding-top: 20px;
        
    }
    .inputWrapper{
        display: flex;
        flex-direction: column;
        width: 120px;
        margin-right: 3px;
        
        
    }
    .loginBtn{
        display: inline-block;
    }
    .regText{
        display: block;
        text-decoration-line: none;
        font-size: small;
        margin: 5px;
        margin-top: 5px;
    }
</style>

</head>
<body>
<%
	int result = (Integer)request.getAttribute("resultData");
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입이 완료되었습니다.')");
		script.println("location.href = 'login.html'");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
	<div class="loginbox">
	<!-- method는 차후에 "post"로 변경하기!!!! -->
	<form method="get" class="loginForm" name="login" action="loginAction.jsp">
        <div class="inputWrapper">
		    <input type="text" name = "memId" maxlength="20" placeholder="아이디" required>
            <input type="password" name = "memPwd" maxlength="20" placeholder="비밀번호" required>
        </div>    
        <input class="loginBtn" type="submit" value="로그인">
	</form>
    <a class="regText" href="register.html">아직 계정이 없으신가요?</a>
    </div>
</body>
</html>