<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "monsters.model.*" %>
<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="pl" class = "monsters.model.PlayerDTO" scope = "request" />
<jsp:setProperty property="*" name="pl" />
<jsp:useBean id="pservice" class = "monsters.model.PlayerDAO" scope = "application" />
<jsp:useBean id="member" type = "monsters.model.MemberDTO" scope = "session" />
<jsp:setProperty property="player" name ="pservice" value = "<%= pl %>" />
<jsp:setProperty property="member" name ="pservice" value = "<%=member %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updatePlAction</title>
</head>
<body>
	<%
	System.out.println("updatePlAction ::" +pl.getPlId());
			System.out.println("updatePlAction ::" +pl);
			System.out.println("updatePlAction :: "+member);
			int result = pservice.playerUpdate();
			System.out.println("updatePlAction :: "+pservice.getPlayer());
			System.out.println(result);
			if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('"+pl.getPlName()+"선수정보 변경이 완료되었습니다.')");
		script.println("location.href = 'positionListAction.jsp?plId="+pl.getPlId()+"'");
		script.println("</script>");
			}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('선수정보 변경에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
			}
		%>
</body>
</html>
	