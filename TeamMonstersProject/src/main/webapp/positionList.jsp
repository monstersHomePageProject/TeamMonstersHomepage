<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="monsters.model.*"%>
<jsp:useBean id="playerList" type="java.util.ArrayList" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포지션별 선수 목록</title>
<style>
    body {
      font-family: Arial, sans-serif;
      padding: 20px;
    }
    .player-card {
      border: 1px solid #ccc;
      padding: 20px;
      margin-bottom: 20px;
      display: flex;
      align-items: center;
    }
    .player-card img {
      max-width: 100px;
      margin-right: 20px;
    }
    .player-card .info {
      flex: 1;
    }
  </style>
</head>
<body>
<div>
	<h2></h2> <!-- 포지션명이 들어감. -->
</div>
<!-- mainAction.jsp에서 결과를 넘겨받음. -->
<%
	if(playerList.size()==0){ 
		
%>
	<h4>선수가 존재하지 않습니다.</h4>
<%
	}
	for(Object o : playerList){
		PlayerDTO player = (PlayerDTO) o;
	
%>
	<!-- 포지션별 선수 리스트 목록-->
    <div class="player-card">
        <img src="./img/<%=player.getPl_imgName() %>" alt="선수1 이미지">
            <div class="info">
                <h2><%=player.getPl_name() %></h2>
                <h4><%=player.getPl_subject() %></h4>
                <p><%=player.getPl_contents() %></p>
            </div>
    </div>
<%
	}
%>
</body>
</html>