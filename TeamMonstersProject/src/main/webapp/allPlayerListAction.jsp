<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="monsters.model.*,monsters.service.*"%>
<jsp:useBean id="pservice" class="monsters.service.PlayerService" scope="application"/>
<jsp:useBean id="pl" class="monsters.model.PlayerDTO" scope="session"/>
<jsp:setProperty property="plPosition" name="pl"/>
<jsp:setProperty property="player" name="pservice" value="<%=pl %>"/>
<jsp:useBean id="allPlayerList" class="java.util.ArrayList" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AllPlayerList</title>
</head>
<body>
<%
	allPlayerList = pservice.AllPlayerSelect();
	request.setAttribute("allPlayerList", allPlayerList);
%>
<jsp:forward page="allPlayerList.jsp"/>
</body>
</html>