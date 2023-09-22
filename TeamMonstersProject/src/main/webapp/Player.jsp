<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="playerError.jsp"%>
<%@page import="monsters.model.*"%>
<jsp:useBean id="player" type="monsters.model.PlayerDTO" scope="request"/>
<jsp:useBean id="pservice" type="monsters.model.PlayerDAO" scope="request"/>
<jsp:useBean id="mservice" type="monsters.model.MemberDAO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수 정보</title>
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
	<%
		//response.sendRedirect("playerError.jsp"); //일부러 오류를 내어 에러페이지 동작 확인하는 코드
		String PnH =(String)request.getAttribute("PnH");
		String position =(String)request.getAttribute("position");
	%>
	<div class="player-card">
        <img src="이미지 파일 경로" alt="선수1 이미지">
            <div class="info">
                <h2><%=player.getPl_name() %></h2>
                <h2>포지션</h2><h4><%=position %></h4>
                <h2>생년월일</h2><p><%=player.getPl_birth() %></p>
                <h2>등번호</h2><p><%=player.getPl_backNo() %></p>
                <h2>신체정보</h2><p><%=player.getPl_physical() %></p>
                <h2>투타</h2><p><%=PnH %></p>
                <h2>내용</h2><p><%=player.getPl_contents() %></p>
            </div>
    </div>
    <div class="regdate">
    	작성자:<p><%=player.getPl_memName() %></p>
    	등록일:<p><%=player.getRegdate() %></p>
    </div>
    <div class="Btn">
    	<a href="updatePl.jsp?pl_id=<%=player.getPl_id() %>"><input type="button" value="변경"></a>
		<a href="deletePlAction.jsp?pl_id=<%=player.getPl_id() %>"><input type="button" value="삭제"></a>
    </div>
</body>
</html>