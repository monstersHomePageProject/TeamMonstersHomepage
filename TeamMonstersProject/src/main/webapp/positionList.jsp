<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="monsters.model.*,monsters.service.*"%>
<jsp:useBean id="playerList" type="java.util.ArrayList" scope="session"/>
<jsp:useBean id="pservice" type="monsters.service.PlayerService" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포지션별 선수 목록</title>
<style>
    body {
      font-family: Arial, sans-serif;
      padding: 20px;
      width: max-content;
      margin: auto;
    }
    a{
      text-decoration-line: none;
      color: black;
    }
    .player-card {
      border: 1px solid #ccc;
      padding: 20px;
      margin-bottom: 20px;
      display: flex;
      align-items: center;
      width: 800px;
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
<%
	String position = (String)session.getAttribute("position"); 
%>
<div class="playerList">
<div>
	<h1>⚾<%=position%></h1> <!-- 포지션명이 들어감. -->
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
        <a href="positionListAction.jsp?plId=<%=player.getPlId()%>" target="right">
  			<img src="./img/<%=player.getPlImgName()%>" alt="선수1 이미지">
		</a>
            <div class="info">
                <h2>
                <a href="positionListAction.jsp?plId=<%=player.getPlId()%>" target="right"><%=player.getPlName()%></a>
                </h2>
                <h4><%=player.getPlSubject()%></h4>
                <p><%=player.getPlContents()%></p>
            </div>
    </div>
<%
	}
%>
</div>
</body>
</html>