<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String error = (String)request.getAttribute("error");
String refund = (String)request.getAttribute("refund");



if(error != null){
	out.print("<script>alert('ȯ�ҿ� �����Ͽ����ϴ�. Ƽ�Ͻð��� Ȯ�����ּ���')</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ƽ��ȯ��</title>
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
<h1 style="text-align: center">Ƽ�Ϲ�ȣ�� �Է����ּ���</h1>
	<div id="back">
		<a href="kioskmain.jsp">ó������ ���ư���</a>
	</div>
<div id="fom">
<h2 style="text-align: center;">Ƽ�� ȯ��</h2><br>
<h4 style="text-align: center; color:white;">���󿵽��� 1�ð� �̳��� Ƽ���� <br> ȯ���� �Ұ����մϴ٢�</h4>
<form action="RefundServlet" method="post" style="text-align: center;">
	<input type="text" name="ticketnum" placeholder="Ƽ�Ϲ�ȣ�� �Է����ּ���">
	<input type="submit" value="ȯ���ϱ�">
</form>
</div>
</body>
</html>