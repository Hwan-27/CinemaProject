<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주차정산 데이터 등록 페이지</title>
<style>
body{background-color:#A4C3FF;}
#fom{
text-align:center;
	width:450px;
	height: 180px;
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
	<a href="adminmain.jsp">이전으로 돌아가기</a>
</div>
<form action="ParkingInsertServlet" method="get" id="fom">
	<h3>샘플 차량 데이터를 입력해주세요</h3>
	차량번호 : <input type="text" placeholder="차량번호" name="carnum"><br><br>
	입차시간 : <input type="date" name="date"><input type="time" name="time"><br><hr>
	<input type="submit" value="등록" style="margin-left:1vw;">
	</form>
</body>
</html>