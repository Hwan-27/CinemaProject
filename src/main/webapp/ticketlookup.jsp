<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
String error = (String)request.getAttribute("error");

if(error != null){
	out.print("<script>alert('�Է��Ͻ� Ƽ�Ϲ�ȣ�� ��ġ�ϴ� Ƽ���� �����ϴ�. ��ȭ��ȣ�� �õ����ּ���')</script>");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� Ƽ�� ��ȸ</title>
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
	<a href="kioskmain.jsp">ó������ ���ư���</a>
</div>
	<div id="box">
		<form action="TicketLookupServlet" method="post" id="fom">
			<h3>���� Ƽ�� ��� �� ��ȸ</h3>
			<h4 style="color:white;">Ƽ�Ϲ�ȣ �Ǵ� ��ȭ��ȣ�� �Է��ϰ� <br> ��� �� ��ȸ ��ư�� �����ּ���</h4>
			<input type="text" name="ticketnum" placeholder="Ƽ�Ϲ�ȣ�� �Է��ϼ���">
			<hr>
			<h3>��ȭ��ȣ�� ��ȸ</h3>
			<input type="text" name="tel" placeholder="��ȭ��ȣ�� �Է��ϼ���"><br><br>
			<input type="submit" value="���">
		</form>

	</div>

</body>
</html>