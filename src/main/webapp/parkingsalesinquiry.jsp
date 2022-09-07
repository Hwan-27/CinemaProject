<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%

String price = String.valueOf(request.getAttribute("price"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주차정산 매출 확인 페이지</title>
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
	<h1 style="text-align: center;">주차정산 매출 조회 페이지입니다.</h1>
	<div id="fom">
	<form action="ParkingSalesinServlet" method="get">
	<h3>조회하고 싶은 날짜를 선택 후 <br> 매출조회 버튼을 눌러주세요.</h3> 
		<input type="date" name="startdate"> <br>
		<input type="date" name="enddate"><hr>
		<input type="submit" value="매출 조회">
		<hr>
		<div >매출 : <input type="text" value="<%=price %>"style="text-align: right;"> 원</div>
	</form>
	</div>
</body>
</html>