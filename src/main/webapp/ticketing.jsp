<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="movie.DBcon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String Changes = String.valueOf(request.getAttribute("Changes")); //잔돈
String tel = (String)request.getAttribute("tel");
Connection conn = DBcon.getConnection();

String sql = "select * from ticket where tel = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);

pstmt.setString(1, tel);

ResultSet rs = pstmt.executeQuery();

rs.next();
String seat1 = rs.getString("seat1");
String seat2 = rs.getString("seat2");
String seat3 = rs.getString("seat3");
String seat4 = rs.getString("seat4");
String seat5 = rs.getString("seat5");

if(seat1==null){
	seat1 = " ";
}else if(seat2==null){
	seat2 = " ";
	seat3 = " ";
	seat4 = " ";
	seat5 = " ";
}else if(seat3==null){
	seat3 = " ";
	seat4 = " ";
	seat5 = " ";
}else if(seat4==null){
	seat4 = " ";
	seat5 = " ";
}else if(seat5==null){
	seat5 = " ";
}



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 출력 페이지</title>
<style>
body {
	background-color: #A4C3FF;
}

#ticket {
	text-align: center;
	width: 200px;
	height: 475px;
	background-color:#AD9AEE;
	margin-top: 3vw;
	margin-left: 44vw;
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
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function() {
		//카운트 시작 숫자
		var count = 15;
		//카운트다운함수
		var countdown = setInterval(function() {
			//해당 태그에 아래 내용을 출력
			$("#countdown").text(count + "초 후 메인화면으로 이동 합니다.");
			//0초면 초기화 후 이동되는 사이트
			if (count == 0) {
				clearInterval(countdown);
				document.location.href = "kioskmain.jsp";
			}
			count--;//카운트 감소
		}, 1000);
	});
</script>
</head>
<body>
<div id="back">
	<a href="kioskmain.jsp">처음으로 돌아가기</a>
</div>
<div id="ticket">
	<p style="color:white;">영화 입장권 / 영수증 겸용<br>[재발행 영수증]<br>=================</p>
	<p>티켓번호 : <%=rs.getString("i_num") %><br><%=rs.getString("age") %>이상 관람가</p>
	<p><h3><%=rs.getString("moviename") %></h3></p>
	<p><h3><%=rs.getString("showtime") %></h3></p>
	<p style="color:white;"><%=rs.getString("theater") %><br> 좌석 : <%=seat1%> <%=seat2%> <%=seat3%> <%=seat4%> <%=seat5%><br>===============</p>
	<p><h3>총인원	<%=rs.getString("people") %>명</h3>TOTAL  : <%=rs.getString("price") %></p>
	<p>티켓 구매시간 : <br><%=rs.getString("buytime") %></p>
	<p style="color:#80E12A; background-color: black; width:200px; height:30px;">잔돈 : <%=Changes %></p>
</div><br>
<div style="background-color:black; text-align: center;">
		<div style="text-align: center; color:white;" id="countdown"></div>
</div>

</body>
</html>