<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="mainActionError.jsp"%>
<%@ page import="monsters.model.*, java.util.*, monsters.service.*" %>
<jsp:useBean id="pservice" class="monsters.service.PlayerService" scope="application"/>
<jsp:useBean id="mservice" type="monsters.service.MemberService" scope="application"/>
<jsp:useBean id="member" type = "monsters.model.MemberDTO" scope = "session" />
<jsp:useBean id="pl" class="monsters.model.PlayerDTO" scope="session"/>
<jsp:setProperty property="plPosition" name="pl"/>
<jsp:setProperty property="player" name="pservice" value="<%=pl %>"/>
<jsp:useBean id="playerList" class="java.util.ArrayList" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainAction</title>
</head>
<body>
	<%
	System.out.println("mainAction :: "+member); //DTO가 잘 넘어오는지 체크
		playerList = pservice.selectPosition();
			String position = pservice.changePositionType(pl.getPlPosition()); //int의 포지션을 포지션 이름으로 변환
			session.setAttribute("playerList", playerList);
			session.setAttribute("position", position);
	%>
<jsp:forward page="positionList.jsp"/>
</body>
</html>