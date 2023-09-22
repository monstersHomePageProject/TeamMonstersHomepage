<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "monsters.model.*" %>
<jsp:useBean id="mservice" type = "monsters.model.MemberDAO" scope = "application" />
<jsp:useBean id="member" type = "monsters.model.MemberDTO" scope = "session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수목록 리스트</title>
</head>
<body>
	<% System.out.println("LeftList :: "+member); %> <!-- DTO가 잘 넘어오는지 체크 -->
	<ul type="disc">
		<li><a href="mainAction.jsp?pl_position=1" target="right">외야수</a></li>
		<li><a href="mainAction.jsp?pl_position=2" target="right">내야수</a></li>
		<li><a href="mainAction.jsp?pl_position=3" target="right">투수</a></li>
		<li><a href="mainAction.jsp?pl_position=4" target="right">포수</a></li>
		<li><a href="mainAction.jsp?pl_position=5" target="right">감독&코치</a></li>
		<li><a href="mainAction.jsp?pl_position=6" target="right">취업선수</a></li>
	</ul>
	<a href="insertPl.jsp" target="right"><input type="button" value="선수 등록"></a>
</body>
</html>