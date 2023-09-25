<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="monsters.model.*, monsters.service.*" %>
<jsp:useBean id="pservice" type="monsters.service.PlayerService" scope="application"/>
<jsp:useBean id="p" class="monsters.model.PlayerDTO" scope="request"/>
<jsp:setProperty property="plId" name="p"/>
<jsp:setProperty property="player" name="pservice" value="<%=p %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수 정보</title>
</head>
<body>
	<%
	int result = 0;
			p = pservice.playerDetail();
			System.out.println(p.getPlName()+ "  :  " + p);
			String PnH = pservice.changePnHType(p.getPlPnH());
			String position = pservice.changePositionType(p.getPlPosition());
			request.setAttribute("player", p);
			request.setAttribute("PnH", PnH);
			request.setAttribute("position", position);
	%>
<jsp:forward page="Player.jsp"/>
</body>
</html>