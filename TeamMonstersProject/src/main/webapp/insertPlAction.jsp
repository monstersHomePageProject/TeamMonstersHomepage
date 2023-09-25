<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "monsters.model.*, monsters.service.*" %>
<jsp:useBean id="p" class = "monsters.model.PlayerDTO" scope = "page" />
<jsp:setProperty property="*" name="p" />
<jsp:useBean id="pservice" class = "monsters.service.PlayerService" scope = "application" />
<jsp:useBean id="member" type = "monsters.model.MemberDTO" scope = "session" />
<jsp:setProperty property="player" name ="pservice" value = "<%= p %>" />
<jsp:setProperty property="member" name ="pservice" value = "<%=member %>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수등록 동작화면</title>
</head>
<body>
<%

	System.out.println(p);
	System.out.println("insertPlAction :: "+member);
	int result = pservice.playerInsert();
	request.setAttribute("insertResult", result);
	 %>
<jsp:forward page="mainCenterList.jsp"/>
</body>
</html>