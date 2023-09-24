<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="mainActionError.jsp"%>
<%@ page import="monsters.model.*, java.util.*" %>
<jsp:useBean id="pservice" class="monsters.model.PlayerDAO" scope="application"/>
<jsp:useBean id="player" class="monsters.model.PlayerDTO" scope="session"/>
<jsp:useBean id="mservice" type="monsters.model.MemberDAO" scope="application"/>
<jsp:useBean id="member" type = "monsters.model.MemberDTO" scope = "session" />
<jsp:setProperty property="plPosition" name="player"/>
<jsp:setProperty property="player" name="pservice" value="<%=player %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainAction</title>
</head>
<body>
<!-- 로그인을 하지 않고 들어왔을 때의 error 처리 필요 -->
	<%
	System.out.println("mainAction :: "+member); //DTO가 잘 넘어오는지 체크
			ArrayList<PlayerDTO> playerList = pservice.selectPosition();
			String position = pservice.changePositionType(player.getPlPosition()); //int의 포지션을 포지션 이름으로 변환
			session.setAttribute("playerList", playerList);
			session.setAttribute("position", position);
	%>
<jsp:forward page="positionList.jsp"/>
</body>
</html>