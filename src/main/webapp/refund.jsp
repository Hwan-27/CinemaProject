<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String error = (String)request.getAttribute("error");
String refund = (String)request.getAttribute("refund");



if(error != null){
	out.print("<script>alert('환불에 실패하였습니다. 티켓시간을 확인해주세요')</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>티켓환불</title>
<style>
body {
	background-color: #A4C3FF;
}

#fom {
	background-color: #AD9AEE;
	width: 300px;
	height: 300px;
	margin-left: 42vw;
	margin-top: 3vw;
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
<h1 style="text-align: center">티켓번호를 입력해주세요</h1>
	<div id="back">
		<a href="kioskmain.jsp">처음으로 돌아가기</a>
	</div>
<div id="fom">
<h2 style="text-align: center;">티켓 환불</h2><br>
<h4 style="text-align: center; color:white;">▶상영시작 1시간 이내의 티켓은 <br> 환불이 불가능합니다◀</h4>
<form action="RefundServlet" method="post" style="text-align: center;">
	<input type="text" name="ticketnum" placeholder="티켓번호를 입력해주세요">
	<input type="submit" value="환불하기">
</form>
</div>
</body>
</html>