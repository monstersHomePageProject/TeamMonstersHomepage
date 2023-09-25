<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="monsters.model.*" %>
<jsp:useBean id="pservice" type="monsters.model.PlayerDAO" scope="application"/>
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
			PlayerDTO pd = pservice.playerDetail();
			System.out.println(pd.getPlName()+ "  :  " + pd);
			String PnH = pservice.changePnHType(pd.getPlPnH());
			String position = pservice.changePositionType(pd.getPlPosition());
			request.setAttribute("player", pd);
			request.setAttribute("PnH", PnH);
			request.setAttribute("position", position);
	%>
<jsp:forward page="Player.jsp"/>
</body>
</html>