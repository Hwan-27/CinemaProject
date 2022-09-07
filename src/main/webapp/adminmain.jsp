<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

String error = (String) request.getAttribute("error");





if (error != null) {
	out.print("<script>alert('다시 시도해주세요.')</script>");
}

//============영화 업데이트 등록 여부===============
String movieupdateerror = (String) request.getAttribute("movieupdateerror");
if (movieupdateerror != null) {
	out.print("<script>alert('영화업데이트에 실패하였습니다.')</script>");
}


//============차량 샘플데이터 등록 여부===============
String samplesuccess = (String) request.getAttribute("samplesuccess");
String sampleerror = (String)request.getAttribute("sampleerror");

if (samplesuccess != null) {
	out.print("<script>alert('차량 샘플데이터가 정상적으로 등록되었습니다.')</script>");
}
if(sampleerror != null){
	out.print("<script>alert('차량 샘플데이터 등록에 실패하였습니다.')</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자 메인 페이지</title>
<style>
body {
	background-color: #A4C3FF;
}

li>a {
	text-decoration-line: none;
	color: white;
}

#ul {
	margin-top: 4vw;
	margin-left: 42vw;
	width: 300px;
	height: 300px;
	background-color: #AD9AEE;
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
	<h1 style="text-align: center;">관리자 시스템</h1>
	<div id="ul">
		<h3 style="text-align: center;">목록</h3>
		<ul>
			<li><a href="movieupdate.jsp">새 영화 등록하기</a></li>	<!-- 작업완료 -->
			<br>
			<li><a href="moviedelete.jsp">영화 삭제하기</a></li> 	<!-- 작업완료 -->
			<br>
			<li><a href="salesinquiry.jsp">티켓 매출 확인하기</a></li> <!-- 작업완료 -->
			<br>
			<li><a href="parkinginsert.jsp">주차정산 샘플데이터 등록<div style="color:black;">(주차장 입차 시스템을 가정)</div></a></li> <!-- 작업완료 -->
			<br>
		</ul>
	</div>
</body>
</html>