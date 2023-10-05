<%@page import="org.omg.PortableInterceptor.USER_EXCEPTION"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="u" class = "monsters.model.MemberDTO" scope = "request" />
<jsp:setProperty property="memId" name="u"/>
<jsp:useBean id = "mmservice" type = "monsters.model.MemberDAO" scope = "application" />
<jsp:setProperty property="user" name ="mmservice" value = "<%= u %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Member Action</title>
</head>
<body>
<%
	System.out.println(mmservice.getUser());
	int result = mmservice.memberDelete();
	if(result == 1){
%>
		<script>
		alert('회원 정보가 삭제되었습니다.');
		location.href = 'ManageMemberAction.jsp';
		</script>
		<%
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원 삭제에 실패했습니다.')");
		script.println("location.href = 'deleteMemberActionError.jsp'");
		script.println("</script>");
	}
	 %>
</body>
</html>