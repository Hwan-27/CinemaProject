<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 업데이트 페이지</title>
<style>
body{background-color:#A4C3FF;}
h1,h3{text-align:center;}
#fom{
	margin-left:40vw;
	margin-top:2vw;

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
	<h1>관리자 영화 업데이트 페이지</h1>
	<hr>
	<form action="upload.do" method="post" enctype="multipart/form-data" id="fom">
	영화제목 : <input type="text" name="moviename"><br> 
	영화 포스터 : <input type="file" name="uploadFile"><br>
	영화 런타임 : <input type="text" name="time"><br> 
	  <input type="radio" value="all" name="age">전체
	 <input type="radio" value="12" name="age">12세
	 <input type="radio" value="15" name="age">15세
	 <input type="radio" value="18" name="age">18세 <br>
	상영관 : ex)?층?관<input type="text" name="theater"><br>
	상영시간 : <input type="text" name="showtime1"><br>
	상영시간 : <input type="text" name="showtime2"><br>
	상영시간 : <input type="text" name="showtime3"><br>
	상영시간 : <input type="text" name="showtime4"><br>
	상영시간 : <input type="text" name="showtime5"><br>
	<input type="submit" value="등록">
	</form>
</body>
</html>