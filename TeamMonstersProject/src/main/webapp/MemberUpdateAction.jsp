<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "monsters.model.*, monsters.service.*" %>
<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="us" class = "monsters.model.MemberDTO" scope = "request" />
<jsp:setProperty property="*" name="us" />
<jsp:useBean id="mservice" class = "monsters.service.MemberService" scope = "application" />
<jsp:setProperty property="user" name ="mservice" value = "<%=us %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 정보 변경</title>
</head>
<body>
<%
		int result = mservice.memberUpdate();
		System.out.println("updateMemAction :: "+ mservice.getUser());
		System.out.println(result);
		if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('"+us.getMemName()+" 멤버  정보 변경이 완료되었습니다.')");
		script.println("location.href = 'mainLeftListAction.jsp?'");
		script.println("</script>");
			}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('멤버정보 변경에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
			}
		%>
</body>
</html>