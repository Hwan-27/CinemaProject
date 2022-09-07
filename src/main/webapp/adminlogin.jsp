<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

String error = (String) request.getAttribute("error"); // 티켓구매시 입력한 금액이 적을때 실행
if (error != null) {
	out.print("<script>alert('로그인에 실패하였습니다. 다시 시도해주세요')</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 페이지</title>
<style>
body {
	background-color: #A4C3FF;
}

h1 {
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
		<a href="moviemain.jsp">처음으로 돌아가기</a>
	</div>
	<h1>관리자 로그인</h1>
	<form action="login" method="post"
		style="width: 50vw; margin-left: 40vw">
		<input type="text" placeholder="아이디를 입력해주세요" name="id"> <input
			type="text" placeholder="비밀번호를 입력해주세요" name="pw"> <input
			type="submit" value="login">
	</form>
</body>
</html>