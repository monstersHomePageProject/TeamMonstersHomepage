<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="monsters.model.*, java.util.*" %>
<jsp:useBean id="service" class="monsters.model.PlayerDAO" scope="request"/>
<jsp:useBean id="player" class="monsters.model.PlayerDTO" scope="request"/>
<jsp:setProperty property="pl_position" name="player"/>
<jsp:setProperty property="player" name="service" value="<%=player %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainAction</title>
</head>
<body>
	<%
		ArrayList playerList = service.selectPosition();
		request.setAttribute("playerList", playerList);
	%>
<jsp:forward page="positionList.jsp"/>
</body>
</html>