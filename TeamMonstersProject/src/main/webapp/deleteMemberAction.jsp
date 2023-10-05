<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="deleteMemberActionError.jsp"%>
<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="u" class = "monsters.model.MemberDTO" scope = "request" />
<jsp:setProperty property="memId" name="u"/>
<jsp:useBean id = "mservice" type = "monsters.service.MemberService" scope = "application" />
<jsp:setProperty property="user" name ="mservice" value = "<%= u %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Member Action</title>
</head>
<body>
<%
	System.out.println(mservice.getUser());
	int result = mservice.memberDelete();
	if(result == 1){
%>
		<script>
		alert('회원 정보가 삭제되었습니다.');
		location.href = 'mainLeftListAction.jsp';
		</script>
		<%
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원 삭제에 실패했습니다.')");
		script.println("location.href = 'mainLeftListAction.jsp'");
		script.println("</script>");
	}
	 %>
</body>
</html>