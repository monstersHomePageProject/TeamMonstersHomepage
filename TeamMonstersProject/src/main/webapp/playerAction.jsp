<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="playerError.jsp"%>
<%@ page import="monsters.model.*, monsters.service.*" %>
<jsp:useBean id="pservice" type="monsters.service.PlayerService" scope="application"/>
<jsp:useBean id="p" class="monsters.model.PlayerDTO" scope="session"/>
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
			session.setAttribute("player", pd);
	%>
<jsp:forward page="updatePl.jsp"/>
</body>
</html>