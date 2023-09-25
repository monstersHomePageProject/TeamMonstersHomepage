<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<%@ page import = "monsters.model.*" %>
<%@ page import = "monsters.service.*" %>
<jsp:useBean id="member" class = "monsters.model.MemberDTO" scope = "page" />
<jsp:setProperty property="*" name="member" />
<jsp:useBean id="mservice" class = "monsters.service.MemberService" scope = "application" />
<jsp:setProperty property="user" name ="mservice" value = "<%= member %>" />

<html>
<head>
<meta charset="UTF-8">

<%
	int result = mservice.register();
	request.setAttribute("resultData", result);
%>
<title>로그인 동작</title>
</head>
<body>
<jsp:forward page="login.jsp"/>
</body>
</html>