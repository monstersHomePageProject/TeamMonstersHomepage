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
		//로그아웃 버튼을 클릭했을 때
		//mainBanner의 로그아웃 버튼으로부터 logout 값(1)을 받아옴.
		String logout = request.getParameter("logout");
		//logout에 값이 있으면,
		if(logout!=null){
			//로그인한 회원 데이터를 null로 바꿈 (초기화)
			session.setAttribute("member", null);
			//로그아웃할 시, 세션 시간을 0으로 셋팅
			session.setMaxInactiveInterval(0);
		}
	%>
	<jsp:forward page="logoutView.jsp" /><!-- 출력화면으로 넘겨줌. -->
</body>
</html>