<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, monsters.model.*" %> <!-- 자바스크립트 문장을 작성하기 위해 import -->
<jsp:useBean id="mservice" type="monsters.model.MemberDAO" scope="application"/>
<jsp:useBean id="member" type="monsters.model.MemberDTO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 화면</title>
</head>
<body>
	<%
		int result = (Integer)session.getAttribute("loginResult");
		System.out.println("login :: "+member);
		
		if(result == 1){
			System.out.println(member.getMem_name());
			%>
			<script>
				let memberName = '<%=member.getMem_name() %>';
				alert(memberName+'님, 환영합니다.');
				location.href = 'main.html';
			</script>
			<%
		}else if (result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else if (result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	
	%>
</body>
</html>