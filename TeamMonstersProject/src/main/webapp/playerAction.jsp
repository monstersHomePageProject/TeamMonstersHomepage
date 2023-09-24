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
			request.setAttribute("player", pd);
	%>
<jsp:forward page="updatePl.jsp"/>
</body>
</html>