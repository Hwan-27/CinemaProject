
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String error = (String) request.getAttribute("error"); // 티켓구매시 입력한 금액이 적을때 실행
if (error != null) {
	out.print("<script>alert('투입하신 금액이 부족합니다. 처음부터 시도해주세요')</script>");
}

String refund = (String) request.getAttribute("refund"); //환불 체크
if (refund != null) {
	out.print("<script>alert('정상적으로 환불되었습니다 :)')</script>");
}

String parkingprice = (String) request.getAttribute("parkingprice"); // 주차정산 체크
if (parkingprice != null) {
	int changes = (Integer) request.getAttribute("changes");
	out.print("<script>alert('주차정산이 완료되었습니다. 10분안에 출차해주세요 :)')</script>");
	out.print("<script>alert('잔돈 : " + changes + "')</script>");
}

String movieupdate = (String) request.getAttribute("movieupdate");
if (movieupdate != null) {
	out.print("<script>alert('영화가 업데이트 되었습니다. :)')</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 키오스크 메인 페이지</title>

<style>
body {
	background-color: #A4C3FF;
}

header {
	color: white;
	padding: 20x;
	display: grid;
	place-items: center;
	magin: 10px, auto;
	padding: 20x;
	background-color: black;
}

.nav {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 50vh;
}
/* 티켓구매 */
#ticketbuy>a {
	width: 200px;
	height: 300px;
	background-color: #CD1039;
	border: 1px solid gray;
	line-height:130px;
	text-align:center;
	display: table-cell;
	vertical-align: text-top;
	text-decoration-line: none;
	color: white;
}
#ticketbuy>a>img {
	width: 200px;
	height: 150px;
	display: table-cell;
	vertical-align: bottom;
}

/* 티켓환불 */
#refund>a {
	width: 200px;
	height: 300px;
	background-color: #46B4B4;
	border: 1px solid gray;
	line-height:130px;
	text-align: center;
	display: table-cell;
	vertical-align: text-top;
	text-decoration-line: none;
	color: white;
}
#refund>a>img {
	width: 200px;
	height: 150px;
	display: table-cell;
	vertical-align: bottom;
}
/* 예매티켓확인 */
#ticketlookup>a {
	width: 200px;
	height: 300px;
	background-color: #FFA500;
	border: 1px solid gray;
	text-align: center;
	line-height:130px;
	display: table-cell;
	vertical-align: text-top;
	text-decoration-line: none;
	color: white;
}
#ticketlookup>a>img {
	width: 200px;
	height: 150px;
	display: table-cell;
	vertical-align: bottom;
}
/* 주차정산*/
#parking>a {
	width: 200px;
	height: 300px;
	background-color: #787878;
	border: 1px solid gray;
	line-height:130px;
	text-align: center;
	display: table-cell;
	vertical-align: text-top;
	text-decoration-line: none;
	color: white;
}
#parking>a>img {
	width: 200px;
	height: 150px;
	display: table-cell;
	vertical-align: bottom;
}
/* 관리자 구분 */
.section>div {
	float: left;
	margin-left: 30vw;
}

#admin>a {
	width: 120px;
	height: 100px;
	background-color: black;
	border: 1px solid gray;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	text-decoration-line: none;
	color: white;
}

#h3 {
	margin-left: 30.5vw;
}

#place>a {
	width: 120px;
	height: 100px;
	background-color: #B24BE5;
	border: 1px solid gray;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	text-decoration-line: none;
	color: white;
}

footer {
	position: absolute;
	bottom: 0;
	text-align: center;
	color: black;
}
</style>
</head>
<body>
	<header>
		<h1>영화관 키오스크</h1>
	</header>
	<hr>
	<br>
	<br>
	<%--백그라운드에 이미지 추가하는방법 background-image : url("upload/refund2.jpg");  --%>
	<nav class="nav">
		<div id="ticketbuy">
			<a href="moviechoice.jsp"><img src="upload/popcony1.jpg"  alt="티켓구매 팝코니">티켓 구매</a>
			<!-- << 작업완료  -->
		</div>
		<div id="refund">
			<a href="refund.jsp"><img src="upload/popcony2.png"  alt="티켓환불 팝코니">티켓 환불</a>
			<!-- << 작업완료  -->
		</div>
		<div id="ticketlookup">
			<a href="ticketlookup.jsp"><img src="upload/popcony3.png"  alt="티켓조회 팝코니">예매티켓조회</a>
			<!-- << 작업완료  -->
		</div>
		<div id="parking">
			<a href="parkingsettlement.jsp"><img src="upload/popcony4.jpg" alt="주차정산 팝코니">주차 정산</a>
			<!-- << 작업완료  -->
		</div>
	</nav>
	<hr>
	<br>
	<br>
	<section class="section">
		<h3 id="h3">관리자 전용</h3>
		<div id="admin">
			<a href="adminlogin.jsp">관리자 페이지</a>
		</div>
		<div id="place">
			<a href="placecinema.jsp">영화관 위치</a>
		</div>
	</section>
</body>
</html>