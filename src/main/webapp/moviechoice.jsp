<%@page import="movie.DBcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="movie.DBcon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBcon.getConnection();
String sql = "select * from movie";
PreparedStatement pstmt = conn.prepareStatement(sql);

ResultSet rs = pstmt.executeQuery();

//연령대를 선택하지않았을시 ticketservlet 에서 error 메세지를 보내 경고창을 띄워주는것.
String agenull = (String)request.getAttribute("agenull");
if(agenull!=null){
	out.print("<script>alert('연령대를 선택하지 않으셨습니다. 다시 진행해주세요 :)')</script>");
}
//선택한 인원수와 선택한좌석를 비교했을때 같지않으면 이 에러코드가 실행
String notsame = (String)request.getAttribute("notsame");
if(notsame!=null){
	out.print("<script>alert('선택하신 인원수보다 좌석이 더 많이 선택되었습니다.')</script>");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 선택 페이지</title>
<style>
body {
	background-color: #A4C3FF;
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

#movie {
	width: 150px;
	height: 365px;
	margin-left : 45vw;
	border: 1px solid black;
	text-align: center;
	vertical-align: middle;
}

#movie>a {
	vertical-align: middle;
	text-decoration-line: none;
	color: black;
}
</style>
</head>
<body>
<h2 style="text-align: center">선택하고싶은 영화의 시간을 클릭해주세요</h2>
	<div id="back">
		<a href="moviemain.jsp">처음으로 돌아가기</a>
	</div>
	<%
	while (rs.next()) {
	%>
	<div id="movie">
		<div style="background-color: orange;"><%=rs.getString("moviename")%></div>
		<img src="upload/<%=rs.getString("poster")%>" alt='movieposter' width='150'>
		
			<%if(rs.getString("showtime1")==null){ %>
			<input type="hidden">
			<%}else{ %>
			<a href="seatselection.jsp?moviename=<%=rs.getString("moviename")%>&&poster=<%=rs.getString("poster")%>&&showtime=<%=rs.getString("showtime1") %>"style="color:white;">
			<%=rs.getString("showtime1")%></a>
			<%} %>
			
			<%if(rs.getString("showtime2")==null){ %>
			<input type="hidden">
			<%}else{ %>
			<a href="seatselection.jsp?moviename=<%=rs.getString("moviename")%>&&poster=<%=rs.getString("poster")%>&&showtime=<%=rs.getString("showtime2") %>" style="color:white;">
			<%=rs.getString("showtime2")%></a>
			<%} %>
			
			<%if(rs.getString("showtime3")==null){ %>
			<input type="hidden">
			<%}else{ %>
			<a href="seatselection.jsp?moviename=<%=rs.getString("moviename")%>&&poster=<%=rs.getString("poster")%>&&showtime=<%=rs.getString("showtime3") %>"style="color:white;">
			<%=rs.getString("showtime3")%></a>
			<%} %>
			
			<%if(rs.getString("showtime4")==null){ %>
			<input type="hidden">
			<%}else{ %>
			<a href="seatselection.jsp?moviename=<%=rs.getString("moviename")%>&&poster=<%=rs.getString("poster")%>&&showtime=<%=rs.getString("showtime4") %>"style="color:white;">
			<%=rs.getString("showtime4")%></a>
			<%} %>
			
			<%if(rs.getString("showtime5")==null){ %>
			<input type="hidden">
			<%}else{ %>
			<a href="seatselection.jsp?moviename=<%=rs.getString("moviename")%>&&poster=<%=rs.getString("poster")%>&&showtime=<%=rs.getString("showtime5") %>"style="color:white;">
			<%=rs.getString("showtime5")%></a>
			<%} %>
	</div>
	<%
	}
	;
	%>
</body>
</html>