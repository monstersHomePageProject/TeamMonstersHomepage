<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="deletePlActionError.jsp"%>
<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="p" class = "monsters.model.PlayerDTO" scope = "request" />
<jsp:setProperty property="plId" name="p"/>
<jsp:useBean id = "pservice" type = "monsters.model.PlayerDAO" scope = "application" />
<jsp:setProperty property="player" name ="pservice" value = "<%= p %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수 삭제 동작</title>
</head>
<body>
<%
//뒤로가기 막는 기능 추가 예정.
	//response.sendRedirect("playerError.jsp"); //일부러 오류를 내어 에러페이지 동작 확인하는 코드
	String name = pservice.playerDetail().getPlName();
	int result = pservice.playerDelete();
	if(result == 1){
%>
		<script>
		let memberName = '<%= name %>';
		alert(memberName+'선수의 정보가 삭제되었습니다.');
		location.href = 'mainCenterList.jsp';
		</script>
		<%
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('선수삭제에 실패했습니다.')");
		script.println("location.href = 'deletePlActionError.jsp'");
		script.println("</script>");
	}
	 %>
</body>
</html>