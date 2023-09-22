<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="monsters.model.*" %>
<jsp:useBean id="mservice" class="monsters.model.MemberDAO" scope="application"/>
<jsp:useBean id="member" class="monsters.model.MemberDTO" scope="session"/>
<jsp:setProperty property="mem_id" name="member"/>
<jsp:setProperty property="mem_pwd" name="member"/>
<jsp:setProperty property="user" name="mservice" value="<%=member %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginAction</title>
</head>
<body>
	<%
		int result = mservice.login();
		member = mservice.getUser();
		System.out.println(member);
		session.setAttribute("loginResult", result);
		session.setAttribute("member", member);
	%>
<jsp:forward page="loginView.jsp"/>
</body>
</html>