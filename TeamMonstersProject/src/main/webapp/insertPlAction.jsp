<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "monsters.model.*, monsters.service.*" %>
<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="p" class = "monsters.model.PlayerDTO" scope = "page" />
<jsp:setProperty property="*" name="p" />
<jsp:useBean id="pservice" class = "monsters.service.PlayerService" scope = "application" />
<jsp:useBean id="member" type = "monsters.model.MemberDTO" scope = "session" />
<jsp:setProperty property="player" name ="pservice" value = "<%= p %>" />
<jsp:setProperty property="member" name ="pservice" value = "<%=member %>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수등록 동작화면</title>
</head>
<body>
<%

	System.out.println(p);
	System.out.println("insertPlAction :: "+member);
	int result = pservice.playerInsert();
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