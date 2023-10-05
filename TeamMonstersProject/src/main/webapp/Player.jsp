<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="playerError.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="monsters.model.*, monsters.service.* "%>
<jsp:useBean id="player" type="monsters.model.PlayerDTO" scope="session"/>
<jsp:useBean id="pservice" type="monsters.service.PlayerService" scope="application"/>
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
            text-align: center; /* Center-align the content */
        }

        .player-card {
            border: 1px solid #ccc;
            padding: 20px;
            margin: 0 auto; /* Center-align the card */
            max-width: 800px; /* Adjust the maximum width as needed */
            display: flex;
        }

        .player-card img {
            max-width: 200px;
        }

        .info {
            flex: 1;
            text-align: left; /* Left-align the text within the info div */
            padding-left: 40px; /* Add padding to separate text from image */
        }

        h2 {
            font-size: 24px; /* Increase the font size for headers */
        }

        h4 {
            font-size: 18px; /* Adjust the font size for sub-headers */
        }

        p {
            font-size: 16px; /* Adjust the font size for paragraphs */
        }

        .regdate {
          margin-top: 10px; /* Add some spacing between the card and the "regdate" info */
          text-align: center; /* Center-align the "regdate" info */
        }

        /* Button styling class */
        .custom-button {
          border-radius: 3px;
          background-color: #2a009e;
          color: #fff;
          font-weight: 900;
          width: 80px;
          height: 40px;
          padding: 0;
          font-size: 12pt;
          margin: 5px; /* Add margin between the buttons */
        }
      </style>
</head>
<body>
	<%
		//response.sendRedirect("playerError.jsp"); //일부러 오류를 내어 에러페이지 동작 확인하는 코드
		String PnH =(String)session.getAttribute("PnH");
		String position =(String)session.getAttribute("position");
		System.out.println("ROLE :: "+mservice.getUser().getMemRole());
	%>
	<div class="player-card">
        <img src="./img/PlayerPic/<%=player.getPlImgName()%>" alt="선수 이미지">
            <div class="info">
                <h2><%=player.getPlName()%></h2>
                <h4><%=position %></h4>
                <p>생년월일 : <%=player.getPlBirth()%></p>
                <p>등번호 : <%=player.getPlBackNo()%></p>
                <p>신체정보 : <%=player.getPlPhysical()%></p>
                <p>투타 : <%=PnH %></p>
                <p>내용 : <%=player.getPlContents()%></p>
            </div>
    </div>
    <div class="regdate"> 작성자: <%=player.getPlMemName()%> | 등록일: <%=player.getRegdate() %> </div>
    <br>
    <div>
    <c:choose>
    	<c:when test="${mservice.getUser().getMemRole() eq 'admin'||mservice.getUser().getMemRole() eq 'bplayer' }">
    		<input type="button" value="변경" onclick="redirectToPlayerAction()" class="custom-button">
    	</c:when>
    </c:choose>
    <c:if test="${mservice.getUser().getMemRole() eq 'admin' }">
   		<input type="button" value="삭제" onclick="confirmDelete()" class="custom-button">
    </c:if>
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
 function redirectToPlayerAction() {
     var plId = '<%=player.getPlId() %>';
     window.location.href = 'playerAction.jsp?plId=' + plId;
 }
 </script>
</body>
</html>