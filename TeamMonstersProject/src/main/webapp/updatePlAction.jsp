<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "monsters.model.*, monsters.service.*" %>
<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="pl" class = "monsters.model.PlayerDTO" scope = "request" />
<jsp:setProperty property="*" name="pl" />
<jsp:useBean id="pservice" class = "monsters.service.PlayerService" scope = "application" />
<jsp:useBean id="member" type = "monsters.model.MemberDTO" scope = "session" />
<jsp:setProperty property="player" name ="pservice" value = "<%= pl %>" />
<jsp:setProperty property="member" name ="pservice" value = "<%=member %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updatePlAction</title>
</head>
<body>
	<%
		System.out.println("updatePlAction ::" +pl.getPlId());
		System.out.println("updatePlAction ::" +pl);
		System.out.println("updatePlAction :: "+member);
		int result = pservice.playerUpdate();
		System.out.println("updatePlAction :: "+pservice.getPlayer());
		System.out.println(result);
			
		request.setAttribute("updateResult", result);
		
	%>
<jsp:forward page="mainCenterList.jsp"/>
</body>
</html>
	