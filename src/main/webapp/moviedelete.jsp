<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="movie.DBcon"%>
<%
	String delete = (String)request.getAttribute("delete");
	
	if(delete != null){
		out.print("<script>alert('영화가 정상적으로 삭제되었습니다.')</script>");
	}
	String error = (String)request.getAttribute("error");
	
	if(error != null){
		out.print("<script>alert('영화 삭제에 실패하였습니다.')</script>");
	}
	Connection conn =  DBcon.getConnection();
	String sql ="select * from movie";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영화 삭제</title>
<style>
body {
	background-color: #A4C3FF;
}
tr{
background-color:black;
color: white;
}
td{
background-color:black;
text-align: center;
color: white;
}
td>a{
		text-decoration-line: none;
	color: white;
}
#table{
	margin-left:25vw;
	margin-top: 2vw;
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
<h2 style="text-align: center;">현재 상영중인 영화 목록</h2><hr>
<h3 style="text-align: center;">삭제하고싶은 영화제목 클릭</h3>
<div id="table">
	<table border="1">
		<tr style="text-align: center;">
			<td>영화제목</td>
			<td>영화시간</td>
			<td>상영관</td>
			<td colspan="5">상영시간</td>
		</tr>
	<%while(rs.next()){ %>	
	<tr>
		<td><a href="moviedeleteServlet?theater=<%=rs.getString("theater") %>&moviename=<%=rs.getString("moviename") %>"><%=rs.getString("moviename")%></a></td>
		<td><%=rs.getString("movietime") %></td>
		<td><%=rs.getString("theater") %></td>
		<td><%=rs.getString("showtime1") %></td>
		<td><%=rs.getString("showtime2") %></td>
		<td><%=rs.getString("showtime3") %></td>
		<td><%=rs.getString("showtime4") %></td>
		<td><%=rs.getString("showtime5") %></td>
	</tr>
	<%}; %>
	</table>
	</div>
</body>
</html>