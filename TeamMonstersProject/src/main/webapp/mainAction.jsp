<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="monsters.model.*, java.util.*" %>
<jsp:useBean id="pservice" class="monsters.model.PlayerDAO" scope="session"/>
<jsp:useBean id="player" class="monsters.model.PlayerDTO" scope="session"/>
<jsp:useBean id="mservice" type="monsters.model.MemberDAO" scope="session"/>
<jsp:setProperty property="pl_position" name="player"/>
<jsp:setProperty property="player" name="pservice" value="<%=player %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainAction</title>
</head>
<body>
	<%
		ArrayList<PlayerDTO> playerList = pservice.selectPosition();
		String position = pservice.changePositionType(player.getPl_position()); //int의 포지션을 포지션 이름으로 변환
		session.setAttribute("playerList", playerList);
		session.setAttribute("position", position);
	%>
<jsp:forward page="positionList.jsp"/>
</body>
</html>