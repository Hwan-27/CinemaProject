package movie;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SeatSelectionServlet")
public class SeatSelectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String moviename = request.getParameter("moviename");//영화제목
		String age = request.getParameter("age");//연령대
		String people = request.getParameter("people");//인원수
		String theater = request.getParameter("theater");//상영관
		String showtime = request.getParameter("showtime"); // 상영시간
		String seat[] = request.getParameterValues("seat[]");//좌석
		
		
		int count = 0;
		
		for(int i = 0;  i<seat.length; i++) {
			if(seat[i] != "") {
				count++;
			}
		}
		
		if(Integer.valueOf(people) != count) {  // 인원수와 선택한 좌석이 맞는지 유효성체크
			request.setAttribute("notsame", "1");
			request.getRequestDispatcher("moviechoice.jsp").forward(request, response);
		}
		if(age == null) {
			request.setAttribute("agenull", "1");
			request.getRequestDispatcher("moviechoice.jsp").forward(request, response);
		}
		
		int price = 0;

		if (age.equals("유아")) { // 연령대 별 금액 계산
			price = 3000 * Integer.valueOf(people);
		} else if (age.equals("청소년")) {
			price = 7000 * Integer.valueOf(people);
		} else {
			price = 10000 * Integer.valueOf(people);
		}
		
		
		
		
		
			request.setAttribute("moviename",moviename);
			request.setAttribute("age",age);
			request.setAttribute("people",people);
			request.setAttribute("theater",theater);
			request.setAttribute("showtime", showtime);
			for(int i = 0; i<seat.length; i++) { // 받아온 좌석 수 만큼 반복 후 출력
				request.setAttribute("seat[]",seat[i]);
			}
			request.setAttribute("price", price);
			
			request.getRequestDispatcher("ticketpayment.jsp").forward(request, response);
		
			
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
	

