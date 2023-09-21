<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "monsters.model.*" %>
<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="p" class = "monsters.model.PlayerDTO" scope = "page" />
<jsp:setProperty property="*" name="p" />
<jsp:useBean id="pservice" class = "monsters.model.PlayerDAO" scope = "application" />
<jsp:setProperty property="player" name ="pservice" value = "<%= p %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수등록 동작화면</title>
</head>
<body>
<%

	System.out.println(p);
	int result = pservice.playerInsert();
	System.out.println(p);
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('선수등록이 완료되었습니다.')");
		script.println("location.href = 'mainCenterList.jsp'");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('선수등록에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	 %>
</body>
</html>