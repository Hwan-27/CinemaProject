<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
String error = (String)request.getAttribute("error");

if(error != null){
	out.print("<script>alert('입력하신 티켓번호와 일치하는 티켓이 없습니다. 전화번호로 시도해주세요')</script>");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>예매 티켓 조회</title>
<style>
body {
	background-color: #A4C3FF;
}
#box {
	margin-left: 40vw; 
	margin-top : 10vw;
	width: 300px;
	height: 300px;
	background-color: #AD9AEE;

}

#fom {
	text-align: center;
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
	<div id="box">
		<form action="TicketLookupServlet" method="post" id="fom">
			<h3>예매 티켓 출력 및 조회</h3>
			<h4 style="color:white;">티켓번호 또는 전화번호를 입력하고 <br> 출력 및 조회 버튼을 눌러주세요</h4>
			<input type="text" name="ticketnum" placeholder="티켓번호를 입력하세요">
			<hr>
			<h3>전화번호로 조회</h3>
			<input type="text" name="tel" placeholder="전화번호를 입력하세요"><br><br>
			<input type="submit" value="출력">
		</form>

	</div>

</body>
</html>