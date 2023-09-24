<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "monsters.model.*" %>
<jsp:useBean id="mservice" type = "monsters.model.MemberDAO" scope = "application" />
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
    	color: #bb50ff;
    	font-weight: bolder;
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
    	color: #bb50ff;
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
	포지션 보기
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
	<a href="insertPl.jsp" target="right"><input type="button" value="선수 등록"></a>
</body>
</html>