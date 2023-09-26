<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, monsters.model.*" %> <!-- 자바스크립트 문장을 작성하기 위해 import -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 화면</title>
</head>
<body>
	<%
	//세션에 null로 바꾼 회원정보가 잘 넘어오면, alert로 로그아웃 메세지 띄우고 로그인 화면으로 넘어감.
	if(session.getAttribute("member")==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그아웃이 정상적으로 처리되었습니다.')");
		script.println("top.location.href = 'login.jsp'");
		script.println("</script>");
	}
	%>
</body>
</html>