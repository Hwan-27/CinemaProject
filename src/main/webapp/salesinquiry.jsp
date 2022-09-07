<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String price = String.valueOf(request.getAttribute("price"));

%>
<!-- prepared 로 입력한 두 날짜를 보내고 ticket테이블에서 where 첫번째날짜 between 두번째날짜 후 price를 sum 함수로 묶어서 출력 -->
<!-- 대충 예를 들면 sql = select (sum)as total from ticket where buytime ? between ?  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>매출 조회 페이지</title>
<style>
body{background-color: #A4C3FF;}
#fom{
	text-align:center;
	width:450px;
	height: 250px;
	background-color:  #FFC31E;
	margin-left:38vw;
	margin-top: 5vw;
}
#back>a {
	width: 200px;
	height: 50px;
	background-color: black;
	border: 1px solid gray;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	text-decoration-line: none;
	color: white;
}
</style>
</head>
<body>
<div id="back">
		<a href="adminmain.jsp">이전 화면으로 가기</a>
</div>
	<h1 style="text-align: center;">매출 조회 페이지입니다.</h1>
	<div id="fom">
	<form action="SalesinQuiryServlet" method="get">
	<h3>조회하고 싶은 날짜를 선택 후 <br> 매출조회 버튼을 눌러주세요.</h3> 
		<input type="date" name="startdate"> <br>
		<input type="date" name="enddate"><hr>
		<input type="submit" value="매출 조회">
		<hr>
		<%if(price != null){ %>
		<div >매출 : <input type="text" value="<%=price %>"style="text-align: right;"> 원</div>
		<%}else{ %>
		<div >매출 : <input type="text" value="0"style="text-align: right;"> 원</div>
		<%} %>
	</form>
	</div>
</body>
</html>