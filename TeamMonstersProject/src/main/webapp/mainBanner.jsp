<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="monsters.service.*,monsters.model.*" %>
<jsp:useBean id="member" type="monsters.model.MemberDTO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최강야구 배너</title>
<style>
	body{
		margin: 0;
		height: auto;
		width: 100%;
		overflow: scroll; /* hidden: 요소가 커져도 scroll이 발생하지 않음. */ 
		background-color: black;
		
	}
	img{
		width: 1430px;
		height: 180px;
	}
	.top{
		display: flex;
	}
	.memName{
		width: 50px;
    	color: white;
	}
	
</style>
</head>
<body>
	<div class="top">
	<div class="logoImg">
	<a href="mainCenterList.jsp" target="right"><img src="./img/Banner.svg"></img></a>
	</div>
	<%
	if(member.getMemId()!=null){
		%>
		<div class="memName"><%=member.getMemId() %> 님</div>
		<button onclick="location.href='logoutAction.jsp?logout=1'">로그아웃</button>
		<%} %>
	</div>
</body>
</html>