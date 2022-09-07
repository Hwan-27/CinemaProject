<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="movie.DBcon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

//info의 값이 널이면 스크립트창 띄워주기
String info = (String) request.getAttribute("info");
if (info == "0") {
	out.print("<script>alert(결제에 실패하였습니다. 다시 시도해주세요)");
}
//좌석 정보 테이블 값 가져오기
Connection conn = DBcon.getConnection();
String sql = "select*from seat";
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

//선택한 영화제목 , 포스터 가져오기 , 상영시간 가져오기
String moviename = request.getParameter("moviename");
String poster = request.getParameter("poster");
String showtime = request.getParameter("showtime");

//가져온 영화제목으로 해당영화의 데이터베이스 값 가져오기
String sql1 = "select*from movie where moviename=?";

PreparedStatement pstmt = conn.prepareStatement(sql1);
pstmt.setString(1, moviename);
ResultSet rs2 = pstmt.executeQuery();

// 좌석 
String query = "select * from ticket where showtime=?";
PreparedStatement pstmt5 = conn.prepareStatement(query);
pstmt5.setString(1, showtime);
ResultSet rs5 = pstmt5.executeQuery();

ArrayList<String> list = new ArrayList<>(); //선택한 시간대의 불러온 좌석 정보의 값을 담는것

while (rs5.next()) {
	list.add(rs5.getString("seat1"));
	list.add(rs5.getString("seat2"));
	list.add(rs5.getString("seat3"));
	list.add(rs5.getString("seat4"));
	list.add(rs5.getString("seat5"));
}
;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 티켓 구매 페이지</title>
<style>
body {
	background-color: #A4C3FF;
}

/* div style */
div {
	float: left;
}

#fom {
	display: flax;
	background-color: #AD9AEE;
	width: 40vw;
	margin-top: 3vw;
	margin-left: 1vw;
	text-align: center;
}

#poster { /* 왼쪽 포스터 사진 설정 */
	float: left;
	margin-top : 10vw;
	margin-left: 1vw;
	width: 400px;
	height: 500px;
	display: inline-flex;
	align-content: left;
	margin-top: 10vw;
}
/* 영화 선택정보 테이블  */
table {
	display: inline-block;
	text-align: center;
}

td>a {
	text-decoration-line: none;
	background-color: #AD9AEE;
	color: white;
}

td {
	background-color: #AD9AEE;
	color: black;
}

#table1>td {
	color: white;
}

#back>a { /* 이전으로 돌아가기 */
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

.seat { /* 좌석 전체 div */
	margin-left: 6vw;
}

#success { /* 선택 가능한 좌석 */
	background-color: #93DAFF;
	width: 50px;
	height: 50px;
	border: solid 1px;
}

#disabled { /* 선택 불가능한 좌석 */
	border: solid 1px black;
	background-color: #FF607F;
	width: 50px;
	height: 50px;
	color:white;
}

</style>
</head>
<body>
<div id="back">
	<a href="moviechoice.jsp">이전으로 돌아가기</a>
</div>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function(){ 
		$("input[type='checkbox']").on("click",function(){ // 체크박스를 클릭했을때
			var people = $("#people option:selected").val(); // 위에서 선택한 인원수
			var count = $("input[name=chk]:checkbox:checked").length; // 체크박스의 클릭
			if(count>people){ // 체크박스를 클릭한 수가 인원수보다 많아질때
				$(this).prop("checked",false); //선택된 체크박스를 false 로 돌려주고
				alert("선택하신 인원수를 초과 하였습니다."); // alert 창으로 경고해주기
			}
		});
		
		

	// check 박스값 가져와서 input text 에 넣어주기
			
			
		$("input[type='checkbox']").on("click", function() {
			var people = $("#people option:selected").val(); // 위에서 선택한 인원수
				var carr = [];
			$("input[name=chk]:checked").each(function() {
				carr.push($(this).val());
			});
			if(people==1){									// 인원수와 값을 비교 후 배열에 들어가있는값만큼 출력 체크박스를 클릭할때마다 배열이 늘어나서 carr.length - 로 마지막의 값들만 출력
				$("#txt1").val(carr[0]);
			}else if(people==2){
				$("#txt1").val(carr[0]);
				$("#txt2").val(carr[1]);
			}else if(people==3){
				$("#txt1").val(carr[0]);
				$("#txt2").val(carr[1]);
				$("#txt3").val(carr[2]);
			}else if(people==4){
				$("#txt1").val(carr[0]);
				$("#txt2").val(carr[1]);
				$("#txt3").val(carr[2]);
				$("#txt4").val(carr[3]);
			}else if(people==5){
				$("#txt1").val(carr[0]);
				$("#txt2").val(carr[1]);
				$("#txt3").val(carr[2]);
				$("#txt4").val(carr[3]);
				$("#txt5").val(carr[4]);
			}
		});
		
		
		$("input[type='submit']").on("click",function(){
			var people = $("#people option:selected").val(); // 위에서 선택한 인원수
			var seat = $("#txt"+people).val();
			if(seat == ""){
				alert('선택하신 인원수만큼 좌석을 선택해주세요.');
				return false;
			}
		})
		
	});//최종 ready 
</script>
	<div id="poster">
		<img src="upload/<%=poster %>" width="100%" height="100%">
	</div>
	<div id="fom">
		<form action="SeatSelectionServlet" method="get">
			<h3>
				선택하신 영화는
				<%=moviename %>
				입니다.
			</h3>
			<input type="hidden" name="moviename" value="<%=moviename %>">   					<!-- 영화이름 -->
			<hr>
			<input type="radio" name="age" value="유아"> 											<!-- 연령대 선택 -->
			유아 (3000) <input type="radio" name="age" value="청소년">
			 청소년 (7000) <input type="radio" name="age" value="성인"> 성인 (10000) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 인원수 선택 :
			<select name="people" id="people">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>													<!-- 인원수 선택 -->
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
			<hr>
			<h4>예매하시고 싶은 관의 시간대를 선택해주세요</h4>
			<!-- 테이블 -->
			<table border="1" style="background-color: black;">
				<tr id="table1">
					<td width="100">관람가능연령</td>
					<td>영화제목</td>
					<td>상영관</td>
					<td colspan="5">상영시간</td>
				</tr>
				<%
				while (rs2.next()) {
				%>
				<tr id="table1">																<!-- 영화 정보 -->
					<td width="120"><%=rs2.getString("age")%></td>
					<td><%=rs2.getString("moviename")%></td>
					<td><%=rs2.getString("theater")%><input type="hidden" name="theater" value="<%=rs2.getString("theater") %>"></td>
					<td><%=showtime %><input type="hidden" name="showtime" value="<%=showtime %>"></td>
				</tr>
				<%
				}
				;
				%>
			</table>
			<br>
			<hr>
			<!-- 선택 가능/불가 안내문 -->
			<div >
			<div style="background-color: #93DAFF; color:white; width:50px; height: 50px; font-size: 12px; text-align: center;">선택가능</div>
			<div style="background-color: #FF607F; color:white; width:50px; height: 50px; font-size: 12px; text-align: center;">선택불가</div>
			<h4 style="margin-left:13vw;">예매하실 좌석번호를 선택해주세요</h4>
			</div>
			<!-- 테이블 -->
			<%
			while (rs.next()) {
			%>
			<div class="seat">
					<%if(list.contains(rs.getString("seat1"))){ %>
					<div id="disabled"><input type="hidden" value="<%=rs.getString("seat1") %>" name="chk" disabled="disabled"><%=rs.getString("seat1") %></div>
					<%}else{ %>
					<div id="success"><input type="checkbox" value="<%=rs.getString("seat1") %>" name="chk" ><%=rs.getString("seat1") %></div>
					<%} %>
					<%if(list.contains(rs.getString("seat2"))){ %>
					<div id="disabled"><input type="hidden" value="<%=rs.getString("seat2") %>" name="chk" disabled="disabled"><%=rs.getString("seat2") %></div>
					<%}else{ %>
					<div id="success"><input type="checkbox" value="<%=rs.getString("seat2") %>" name="chk" ><%=rs.getString("seat2") %></div>
					<%} %>
					<%if(list.contains(rs.getString("seat3"))){ %>
					<div id="disabled"><input type="hidden" value="<%=rs.getString("seat3") %>" name="chk" disabled="disabled"><%=rs.getString("seat3") %></div>
					<%}else{ %>
					<div id="success"><input type="checkbox" value="<%=rs.getString("seat3") %>" name="chk" ><%=rs.getString("seat3") %></div>
					<%} %>
					<%if(list.contains(rs.getString("seat4"))){ %>
					<div id="disabled"><input type="hidden" value="<%=rs.getString("seat4") %>" name="chk" disabled="disabled"><%=rs.getString("seat4") %></div>
					<%}else{ %>
					<div id="success"><input type="checkbox" value="<%=rs.getString("seat4") %>" name="chk" ><%=rs.getString("seat4") %></div>
					<%} %>
					<%if(list.contains(rs.getString("seat5"))){ %>
					<div id="disabled"><input type="hidden" value="<%=rs.getString("seat5") %>" name="chk" disabled="disabled"><%=rs.getString("seat5") %></div>
					<%}else{ %>
					<div id="success"><input type="checkbox" value="<%=rs.getString("seat5") %>" name="chk" ><%=rs.getString("seat5") %></div>
					<%} %>
					<%if(list.contains(rs.getString("seat6"))){ %>
					<div id="disabled"><input type="hidden" value="<%=rs.getString("seat6") %>" name="chk" disabled="disabled"><%=rs.getString("seat6") %></div>
					<%}else{ %>
					<div id="success"><input type="checkbox" value="<%=rs.getString("seat6") %>" name="chk" ><%=rs.getString("seat6") %></div>
					<%} %>
					<%if(list.contains(rs.getString("seat7"))){ %>
					<div id="disabled"><input type="hidden" value="<%=rs.getString("seat7") %>" name="chk" disabled="disabled"><%=rs.getString("seat7") %></div>
					<%}else{ %>
					<div id="success"><input type="checkbox" value="<%=rs.getString("seat7") %>" name="chk" ><%=rs.getString("seat7") %></div>
					<%} %> 
					<%if(list.contains(rs.getString("seat8"))){ %>
					<div id="disabled"><input type="hidden" value="<%=rs.getString("seat8") %>" name="chk" disabled="disabled"><%=rs.getString("seat8") %></div>
					<%}else{ %>
					<div id="success"><input type="checkbox" value="<%=rs.getString("seat8") %>" name="chk" ><%=rs.getString("seat8") %></div>
					<%} %>
					<%if(list.contains(rs.getString("seat9"))){ %>
					<div id="disabled"><input type="hidden" value="<%=rs.getString("seat9") %>" name="chk" disabled="disabled"><%=rs.getString("seat9") %></div>
					<%}else{ %>
					<div id="success"><input type="checkbox" value="<%=rs.getString("seat9") %>" name="chk" ><%=rs.getString("seat9") %></div>
					<%} %>
					<%if(list.contains(rs.getString("seat10"))){ %>
					<div id="disabled"><input type="hidden" value="<%=rs.getString("seat10") %>" name="chk" disabled="disabled"><%=rs.getString("seat10") %></div>
					<%}else{ %>
					<div id="success"><input type="checkbox" value="<%=rs.getString("seat10") %>" name="chk" ><%=rs.getString("seat10") %></div>
					<%} %>
					</div>
				
			<br>
			<%
			}	
			;
			rs.close();
			rs2.close();
			pstmt.close();
			%>							
			<div style="text-align:center; margin-left:15vw;">
				선택하신 좌석 : <input type="text" value="" name="seat[]" id="txt1" size="3" style="text-align:center;"><br>
				선택하신 좌석 : <input type="text" value="" name="seat[]" id="txt2" size="3" style="text-align:center;"><br>
				선택하신 좌석 : <input type="text" value="" name="seat[]" id="txt3" size="3" style="text-align:center;"><br>
				선택하신 좌석 : <input type="text" value="" name="seat[]" id="txt4" size="3" style="text-align:center;"><br>
				선택하신 좌석 : <input type="text" value="" name="seat[]" id="txt5" size="3" style="text-align:center;"><br>
				<input type="submit" value="결제화면가기" id="sub">
			</div>
		</form>
	</div>

</body>
</html>