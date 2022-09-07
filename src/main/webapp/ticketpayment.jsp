<%@page import="java.sql.Connection"%>
<%@page import="movie.DBcon"%>
<%@page import="movie.TicketVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


String error = (String)request.getAttribute("error");
if(error != null){
	out.print("<script>alert('금액이 일치하지않습니다')</script>");
	

String seat[] = (String[])request.getAttribute("seat"); // 좌석


int price1 = (Integer)request.getAttribute("price1");//가격
}
String movie = (String)request.getAttribute("moviename");//영화제목
String age = (String)request.getAttribute("age");//연령대
String people = (String)request.getAttribute("people");//인원수
String theater = (String)request.getAttribute("theater");//상영관
String showtime = (String)request.getAttribute("showtime");//상영시간
String seat[] = request.getParameterValues("seat[]"); // 좌석
int price = (Integer)request.getAttribute("price");//가격


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 정보 확인 페이지</title>
<style>
h2{
color:white;
}

h4{
color:
}
body {
	background-color: #A4C3FF;
}

#fom {
	margin-top: 2vw;
	background-color: #AD9AEE;
	width: 32vw;
	margin-left: 36vw;
	display: inline-block;
	text-align: center;
}

#back>a {
	float: left;
	background-color: black;
	text-align: center;
	border: 1px solid gray;
	text-decoration-line: none;
	color: white;
}
.choice{
	border: 1px solid black;
}
#submit{
	margin-right:8vw;
}
#first>a {
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

</head>
<body>
<div id="first">
	<a href="kioskmain.jsp">처음으로 돌아가기</a>
</div>
<script>
		
		$(document).ready(function(){
			$("input[type=radio]").on("click",function(){
				var chk = $("input[name=paymunt]:radio:checked").val();
			
				
				if(chk=="cash"){
					$("#text").html("현금을 투입해주세요 : <input type='text' name='cash'style='text-align:right;'> 원");
				}else if(chk=="check"){
					$("#text").html("카드번호 12자리를 입력해주세요 : <input type='text' name='check'><br>");
				}else if(chk=="easy"){
					$("#text").html("QR코드를 찍어주세요 : <img src='upload/QR.png' width='100' height='100'><br>");
				}
			})
			
		$("input[type='submit']").on("click",function(){
			var tel = $("#tel").val();
			
			if(tel == ""){
				alert('티켓조회를 위해 전화번호를 입력해주세요 :)');
				return false;
			}
		})	
		});
</script>
	<div id="fom">
		<form action="PaymuntServlet" method="get">
			<h2>선택하신 예매정보확인</h2>
			<h3>
				영화: <%=movie%> / 
				연령대: <%=age %> / 
				인원수: <%=people%>명 <br>
				영화 시작시간: <%=showtime%> / 좌석:
				<%for(int i=0; i<seat.length;i++){ %> 
				 <%=seat[i]%> 
				<%}; %>
				/ 가격: <%=price %>원
			</h3><hr>
			<h4>
				맞으시면 결제버튼을 <br>틀리시면 이전화면으로 가기를 눌러주세요 :)
			</h4>
			
			<div class="choice">
			<h3>결제방식 선택</h3>  			<!-- PaymuntServlet 으로 보낼값 -->
				현금 <input type="radio" name="paymunt" value="cash"  id="pay"> 
				체크카드 <input type="radio" name="paymunt" value="check" id="pay"> 
				간편결제 <input type="radio" name="paymunt" value="easy" id="pay">
			<div id="text">
				<br>
				<!-- script 표시될곳 -->
			</div>
			<div>
			<hr>
			<h4>티켓 조회를 위해 전화번호를 입력해주세요.</h4>
			<input type="text" placeholder="전화번호" name="tel" style="text-align:center;" id="tel">
			</div>
			</div>
			<div id="back">
				<a href="seatselection.jsp">이전 화면으로 가기</a>
			</div>
			<!-- hidden으로 PaymuntServlet에 보낼 값 -->
			<input type="hidden" name = "movie" value="<%=movie%>">
			<input type="hidden" name = "age" value="<%=age%>">
			<input type="hidden" name = "people" value="<%=people%>">
			<input type="hidden" name = "theater" value="<%=theater%>">
			<input type="hidden" name = "showtime" value="<%=showtime%>">
			<input type="hidden" name = "price" value="<%=price%>">
			<%for(int s = 0; s<seat.length; s++ ){ %>
			<input type="hidden" name = "seat[]" value="<%=seat[s] %>">
			<%}; %><br>
			<input type="submit" value="결제" id="submit" style="margin-right: 10vw;">	
		</form>
	</div>

</body>
</html>