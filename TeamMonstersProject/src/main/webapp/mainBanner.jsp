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
		overflow: hidden; /* hidden: 요소가 커져도 scroll이 발생하지 않음. */ 
		background-color: black;
		
	}
	img{
		width: 1200px;
		height: 150px;
	}
	.top{
		display: flex;
		justify-content: center;
	}
	.logoImg{
		margin-left: 100px;
    	margin-right: 100px;
	}
	.memName{
		width: max-content;
    	height: max-content;
    	color: white;
    	margin-top: 120px;
    	margin-right: 10px;
	}
	.logoutBtn{
		height: 24px;
    	margin-top: 118px;
    	background-color: #011171;
	    color: white;
	    border: none;
	    border-radius: 3px;
	    width: 70px;
	    cursor: pointer;
	}
	.logoutBtn:hover{
		background-color: white;
		color: black;
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
		<div class="memName"><%=member.getMemId() %> 님, 환영합니다.</div>
		<button class="logoutBtn" onclick="location.href='logoutAction.jsp?logout=1'">로그아웃</button><!-- 버튼을 클릭하면 로그아웃이 이루어짐. -->
		<%} %>
	</div>
</body>
</html>