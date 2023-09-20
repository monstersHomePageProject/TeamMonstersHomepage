<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="monsters.model.*" %>
<jsp:useBean id="service" class="monsters.model.PlayerDAO" scope="request"/>
<jsp:useBean id="p" class="monsters.model.PlayerDTO" scope="request"/>
<jsp:setProperty property="pl_id" name="p"/>
<jsp:setProperty property="player" name="service" value="<%=p %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수 정보</title>
</head>
<body>
	<%
		int result = 0;
		PlayerDTO pd = service.playerDetail();
		System.out.println(pd.getPl_name()+ " : " + pd);
		String PnH = service.changePnHType(pd.getPl_PnH());
		request.setAttribute("player", pd);
		request.setAttribute("PnH", PnH);
	%>
<jsp:forward page="Player.jsp"/>
</body>
</html>