<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="monsters.model.*,monsters.service.*"%>
<jsp:useBean id="mservice" type = "monsters.service.MemberService" scope = "application" />
<jsp:useBean id="memberList" type="java.util.ArrayList" scope="session"/>
<jsp:useBean id="mmservice" type="monsters.model.MemberDAO" scope="application"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid darkblue;
        }
        
        td{
            border:1px solid darkblue;
            text-align: center;
        }
        
        #title{
        	color: white; /* 글자 색상을 흰색으로 설정 */
        	background-color: darkblue;
        	font-size: 18px; 
        }
    </style>
<title>멤버 목록</title>
</head>
<body>
<div class="memberList">

멤버 목록

<a id = "AllPlayer" href="allPlayerListAction.jsp"> 홈페이지 등록선수 목록 </a>
<table>
<%
	if(memberList.size()==0){ 
		
%>
	<tr>
		<td colspan="4" align="center" height="23">멤버가 없습니다.</td>
	</tr>
<%
	} %> 
        <tr align="center">
            <td id=title>번호</td>
            <td id=title>아이디</td>
            <td id=title>이름</td>
            <td id=title>이메일</td>
            <td id=title>전화번호</td>
            <td id=title>권한</td>
            <td id=title>선수ID</td>
            <td id=title>수정|삭제</td>
        </tr>
<%
	for(int i = 0; i < memberList.size(); i++) {
		MemberDTO user = (MemberDTO) memberList.get(i);
%>
  <tr>
            <td><%= i+1 %></td>
            <td><%= user.getMemId() %></td>
            <td><%= user.getMemName() %></td>
            <td><%= user.getMemEmail() %></td>
            <td><%= user.getMemPhone() %></td>
            <td><%= user.getMemRole() %></td>
            <td><%= user.getMemPlId() %></td>
            <td>
			<input type="button" value="변경" onclick="forwardToMemberUpdate('<%= user.getMemId() %>')" class="custom-button">
			<input type="button" value="삭제" onclick="confirmDelete('<%= user.getMemName() %>','<%= user.getMemId() %>')" class="custom-button">
			</td>
  </tr>
<%
	}
%>
</div>
 <script type="text/javascript">
 function confirmDelete(memName, memId) {
	 var confirmation = confirm(memName + " 회원님의 정보를 정말 삭제하시겠습니까?");

     if (confirmation) {
         // 확인을 누르면 deletePlAction 페이지로 이동
         window.location.href = 'deleteMemberAction.jsp?memId=' + memId;
     } else {
         // 유저가 취소를 누르면 아무것도 하지 않음
     }
	}
 function forwardToMemberUpdate(memId) {
     window.location.href = 'ManageMemberAction.jsp?memId=' + memId;
 }
 </script>
</body>
</html>