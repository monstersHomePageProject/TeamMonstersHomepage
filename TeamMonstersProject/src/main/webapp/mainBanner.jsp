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
		background-color: #011171;
		
	}
	img{
		width: 500px;
		height: 100px;
		margin-top: 25px;
		
	}
	.top{
		display: flex;
		justify-content: center;
	}
	.logoImg{
		margin-left: 490px;
    	margin-right: 400px;
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
    	background-color: white;
	    color: #011171;
	    border: none;
	    border-radius: 3px;
	    width: 70px;
	    cursor: pointer;
	}
	.logoutBtn:hover{
		background-color: black;
		color: white;
	}
	
</style>
</head>
<body>
	<div class="top">
	<div class="logoImg">
	<a href="mainCenterList.jsp" target="right"><img src="./img/logoImg.png"></img></a>
	</div>
	<%
	if(member.getMemId()!=null){
		%>
		<div class="memName">⚾ [<%=member.getMemRole() %>] <%=member.getMemId() %> 님</div>
		<button class="logoutBtn" onclick="location.href='logoutAction.jsp?logout=1'">로그아웃</button><!-- 버튼을 클릭하면 로그아웃이 이루어짐. -->
		<%} %>
	</div>
</body>
</html>