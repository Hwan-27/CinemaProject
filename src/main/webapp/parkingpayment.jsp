<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="movie.DBcon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String price = String.valueOf(request.getAttribute("price"));
String carnum = String.valueOf(request.getAttribute("carnum"));
Connection conn = DBcon.getConnection();
String sql ="select * from parking where carnum like ?";

PreparedStatement pstmt = conn.prepareStatement(sql);

pstmt.setString(1, "%"+carnum);

ResultSet rs = pstmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주차 정산</title>
<style>

body {
	background-color: #A4C3FF;
}

#fom {
	text-align: center;
	width: 400px;
	height: 280px;
	background-color: #AD9AEE;
	margin-top: 9vw;
	margin-left: 42vw;
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
<form action="ParkingPaymentServlet" method="get">
<div id="fom">
<h3>차량정보가 맞으시면 결제를 진행해주세요</h3>
<%if(rs.next()){ %>
<h4 style="color:white;">차량번호 : <%=rs.getString("carnum") %></h4>
<h4 style="color:white;">입차시간 : <%=rs.getString("enttime") %></h4><hr>
<%}; %>
<h4 style="color:blue;">결제하실 금액 : <%=price %>원</h4>
<input type="text" name="cash" placeholder="금액을 입력해주세요"><br><br>
<input type="hidden" name="price" value="<%=price%>"> <%// 결제해야할 금액 %>
<input type="hidden" name="carnum" value="<%=rs.getString("carnum") %>">
<input type="submit" value="결제">
</div>
</form>
</body>
</html>