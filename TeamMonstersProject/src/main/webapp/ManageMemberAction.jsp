<%@page import="monsters.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="u" class = "monsters.model.MemberDTO" scope = "request" />
<jsp:setProperty property="memId" name="u"/>
<jsp:useBean id = "mservice" type = "monsters.service.MemberService" scope = "application" />
<jsp:setProperty property="user" name ="mservice" value = "<%= u %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 정보</title>
</head>
<body>
	<%
	int result = 0;
	MemberDTO us = mservice.memberDetail();
	request.setAttribute("user", us);
	%>
<jsp:forward page="MemberUpdate.jsp"/>
</body>
</html>