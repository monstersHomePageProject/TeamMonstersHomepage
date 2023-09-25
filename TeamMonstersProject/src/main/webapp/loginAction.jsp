<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="monsters.model.*"%>
<%@ page import="monsters.service.*"%>
<jsp:useBean id="member" class="monsters.model.MemberDTO"
	scope="session" />
<jsp:setProperty property="memId" name="member" />
<jsp:setProperty property="memPwd" name="member" />
<jsp:useBean id="mservice" class="monsters.service.MemberService"
	scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginAction</title>
</head>
<body>
	<%
	// member 객체의 프로퍼티를 개별적으로 설정
	member.setMemId(request.getParameter("memId")); // 예시로 request.getParameter를 사용하였습니다.
	member.setMemPwd(request.getParameter("memPwd")); // 예시로 request.getParameter를 사용하였습니다.

	// mservice 객체에 member 객체를 할당합니다.
	mservice.setUser(member);
	
	int result = mservice.login();
	System.out.println("logint Action(1) : " + member);
	member = mservice.getUser();
	System.out.println("loginAction : " + member);
	session.setAttribute("loginResult", result);
	session.setAttribute("member", member);
	%>
	<jsp:forward page="loginView.jsp" />
</body>
</html>