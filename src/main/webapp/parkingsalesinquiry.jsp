<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%

String price = String.valueOf(request.getAttribute("price"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�������� ���� Ȯ�� ������</title>
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
		<a href="adminmain.jsp">���� ȭ������ ����</a>
</div>
	<h1 style="text-align: center;">�������� ���� ��ȸ �������Դϴ�.</h1>
	<div id="fom">
	<form action="ParkingSalesinServlet" method="get">
	<h3>��ȸ�ϰ� ���� ��¥�� ���� �� <br> ������ȸ ��ư�� �����ּ���.</h3> 
		<input type="date" name="startdate"> <br>
		<input type="date" name="enddate"><hr>
		<input type="submit" value="���� ��ȸ">
		<hr>
		<div >���� : <input type="text" value="<%=price %>"style="text-align: right;"> ��</div>
	</form>
	</div>
</body>
</html>