<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>접근 오류</title>
</head>
<body>
	<!-- 로그인을 하지 않고 주소창에서 main페이지 주소를 바로 입력하고 들어올 경우 발생 -->
	<script>
		alert('잘못된 접근입니다. 로그인 후 이용해주시길 바랍니다.');
		top.location='login.html'; //로그인 페이지로 돌아감.
	</script>
</body>
</html>