<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logoutAction</title>
</head>
<body>
	<%
		String logout = request.getParameter("logout");
		//로그아웃 버튼을 클릭했을 때
		if(logout!=null){
			//로그인한 회원 데이터를 null로 바꿈
			session.setAttribute("member", null);
			//로그아웃할 시, 세션 시간 0으로 셋팅
			session.setMaxInactiveInterval(0);
		}
	%>
	<jsp:forward page="logoutView.jsp" />
</body>
</html>