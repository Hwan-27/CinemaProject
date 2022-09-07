<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String error = (String) request.getAttribute("error"); //주차정산 서블릿에서 실패했을경우 실행
if (error != null) {
	out.print("<script>alert('입력하신 금액이 부족합니다. 처음부터 시도해주세요')</script>");
}
String numnull = (String) request.getAttribute("numnull");
if (numnull != null) {
	out.print("<script>alert('조회하신 차량정보가 없습니다.')</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주차정산 페이지</title>
<style>
body {
	background-color: #A4C3FF;
}

#fom {
	background-color: #AD9AEE;
	width: 300px;
	height: 300px;
	margin-left: 42vw;
	margin-top: 8vw;
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
	<a href="kioskmain.jsp">처음으로 돌아가기</a>
</div>
<div id="fom">
<h2 style="text-align: center;">주차 정산</h2>
<h3 style="color:white;text-align: center;">차량번호 뒤의 네자리를 입력하고<br>정산버튼을 눌러주세요</h3>
<hr>
<form action="ParkingSettlementServlet" method="get" style="text-align: center;"><br>
	<input type="text" name="carnum" placeholder="차량번호를 입력해주세요" style="text-align:center;">
	<input type="submit" value="정산하기">
</form>
</div>
</body>
</html>