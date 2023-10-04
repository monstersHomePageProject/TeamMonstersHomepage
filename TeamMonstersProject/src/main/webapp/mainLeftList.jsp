<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="mainActionError.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "monsters.model.*, monsters.service.*" %>
<jsp:useBean id="mservice" type = "monsters.service.MemberService" scope = "application" />
<jsp:useBean id="member" type = "monsters.model.MemberDTO" scope = "session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수목록 리스트</title>
<style>
	.positionListToggleBtn{
		cursor: pointer; /* 클릭 커서로 변경 */
		font-size: large;
    	color: #011171;
    	font-weight: bolder;
    	margin-left: 15px;
    	margin-top: 25px;
	}
	.positionListToggleBtn:hover{
		cursor: pointer;
		color: black;
		transition: 1s;
	}
	.positionListToggle{
		display: none;
	}
	.positionListToggle.active{
		display: flex;
		animation: fadeIn 0.5s; /*@keyframes명: fadeIn */
	}
	@keyframes fadeIn { /* 페이드인 효과로 리스트를 보여줌.*/
  		from {
    		opacity: 0;
  		}
  		to {
    		opacity: 1;
  		}
	}
	.Pos{
		text-decoration: none;
		font-size: medium;
		font-weight: bold;
    	color: #011171;
	}
	.Pos:hover{
		color: black;
	}
	ul{
		list-style: none;
	}
	li{
		margin-top: 20px;
		width: max-content;
	}
	li:hover{
		list-style: square;
	}
	
	.insertBtn{
		margin-top: 60px;
	    padding: 5px;
	    width: 180px;
	    height: 50px;
	    background-color: #011171;
	    border-radius: 3px;
	    border: none;
	    font-weight: bolder;
	    font-size: medium;
	    color: white;
	}
	.insertBtn:hover{
		background-color: black;
	    color: white;
	    transition: 0.5s;
	    cursor: pointer;
		
	}

</style>
<script>
	//사이드바 목록 리스트 토글 기능
	function sideList(){
		let positionList = document.querySelector(".positionListToggle");
		positionList.classList.toggle("active");
	}
</script>
</head>
<body>
	<% System.out.println("LeftList :: "+member); %> <!-- DTO가 잘 넘어오는지 체크 -->
	<div class="positionListToggleBtn" onclick="sideList();">
		⚾ 포지션 보기
	</div>
	<div class="positionListToggle" onclick="sideList();">
		<ul type="disc">
			<li><a class="Pos" href="mainAction.jsp?plPosition=1" target="right">외야수</a></li>
			<li><a class="Pos" href="mainAction.jsp?plPosition=2" target="right">내야수</a></li>
			<li><a class="Pos" href="mainAction.jsp?plPosition=3" target="right">투수</a></li>
			<li><a class="Pos" href="mainAction.jsp?plPosition=4" target="right">포수</a></li>
			<li><a class="Pos" href="mainAction.jsp?plPosition=5" target="right">감독&코치</a></li>
			<li><a class="Pos" href="mainAction.jsp?plPosition=6" target="right">취업선수</a></li>
		</ul>
	</div>
	<c:if test="${member.getMemRole() eq 'admin' }">
		<a href="insertPl.jsp" target="right"><input class ="insertBtn" type="button" value="선수 등록"></a>
	</c:if>
</body>
</html>