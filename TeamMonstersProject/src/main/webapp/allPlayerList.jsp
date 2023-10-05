<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="monsters.model.*,monsters.service.*"%>
<jsp:useBean id="pservice" type="monsters.service.PlayerService" scope="application"/>
<jsp:useBean id="pl" type="monsters.model.PlayerDTO" scope="session"/>
<jsp:setProperty property="plPosition" name="pl"/>
<jsp:setProperty property="player" name="pservice" value="<%=pl %>"/>
<jsp:useBean id="allPlayerList" type="java.util.ArrayList" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 선수 목록</title>
<style>
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid darkblue;
        }
        
        td{
            border:1px solid darkblue;
            text-align: center;
        }
        
        .title{
        	color: white; /* 글자 색상을 흰색으로 설정 */
        	background-color: darkblue;
        	font-size: 18px; 
        }
</style>
</head>
<body>
<div class="playerList">
<div>
	<h1>⚾선수 리스트</h1>
</div>
<table>
<!-- allPlayerListAction.jsp에서 결과를 넘겨받음. -->
<%
	if(allPlayerList.size()==0){ 
		
%>
	<h4>선수가 존재하지 않습니다.</h4>
<%
	}
%>
	<!-- 포지션별 선수 리스트 목록-->
     <tr align="center">
            <td class="title">번호</td>
            <td class="title">이름</td>
            <td class="title">등번호</td>
            <td class="title">포지션</td>
            <td class="title">생년월일</td>
            <td class="title">선수ID</td>
        </tr>

<%
	int i = 1;
	for(Object o : allPlayerList){
		PlayerDTO player = (PlayerDTO) o;
		String position = pservice.changePositionType(player.getPlPosition());
%>
	<tr>
        <td><%= i++ %></td>
        <td><%= player.getPlName() %></td>
        <td><%= player.getPlBackNo() %></td>
        <td><%= position %></td>
        <td><%= player.getPlBirth() %></td>
        <td><%= player.getPlId() %></td>
  	</tr>
<%
	}
%>
</table>
<a href="mainLeftListAction.jsp"><input class ="backList" type="button" value="목록으로 돌아가기"></a>
</div>
</body>
</html>