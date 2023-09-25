<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="playerError.jsp"%>
<%@page import="monsters.model.*, monsters.service.* "%>
<jsp:useBean id="player" type="monsters.model.PlayerDTO" scope="request"/>
<jsp:useBean id="pservice" type="monsters.model.PlayerDAO" scope="application"/>
<jsp:useBean id="mservice" type="monsters.service.MemberService" scope="application"/>
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
        <img src="./img/<%=player.getPlImgName()%>" alt="선수1 이미지">
            <div class="info">
                <h2><%=player.getPlName()%></h2>
                <h2>포지션</h2><h4><%=position %></h4>
                <h2>생년월일</h2><p><%=player.getPlBirth()%></p>
                <h2>등번호</h2><p><%=player.getPlBackNo()%></p>
                <h2>신체정보</h2><p><%=player.getPlPhysical()%></p>
                <h2>투타</h2><p><%=PnH %></p>
                <h2>내용</h2><p><%=player.getPlContents()%></p>
            </div>
    </div>
    <div class="regdate">
    	작성자:<p><%=player.getPlMemName()%></p>
    	등록일:<p><%=player.getRegdate() %></p>
    </div>
    <div class="Btn">
    	<a href="playerAction.jsp?plId=<%=player.getPlId() %>"><input type="button" value="변경"></a>
		<input type="button" value="삭제" onclick="confirmDelete()">
    </div>
 <script type="text/javascript">
 function confirmDelete() {
	        var confirmation = confirm("정말 삭제하시겠습니까?");

	        if (confirmation) {
	            // 확인을 누르면 deletePlAction 페이지로 이동
	            var plId = '<%=player.getPlId() %>';
	            window.location.href = 'deletePlAction.jsp?plId=' + plId;
	        } else {
	            // 유저가 취소를 누르면 아무것도 하지 않음
	        }
	}
 </script>
</body>
</html>