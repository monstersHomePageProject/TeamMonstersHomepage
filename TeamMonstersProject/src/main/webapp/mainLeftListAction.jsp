<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import = "monsters.model.*, monsters.service.*, java.util.*" %>
<jsp:useBean id="mservice" type="monsters.service.MemberService" scope="application"/>
<jsp:useBean id="mmservice" class="monsters.model.MemberDAO" scope="application"/>
<jsp:useBean id="member" type = "monsters.model.MemberDTO" scope = "session" />
<jsp:useBean id="us" class="monsters.model.MemberDTO" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ManageMember</title>
</head>
<body>
<% 	
	ArrayList<MemberDTO> memberList = mmservice.selectMember();
	session.setAttribute("memberList", memberList);	
%>
<jsp:forward page="ManageMember.jsp"/>
</body>
</html>