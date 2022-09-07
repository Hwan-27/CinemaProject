package movie;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PaymuntServlet")
public class PaymuntServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String movie = request.getParameter("movie");//영화제목
		String age = request.getParameter("age");//연령대
		String people = request.getParameter("people");//인원수
		String theater = request.getParameter("theater");//관
		String showtime = request.getParameter("showtime");//영화 시작시간
		String seat[] = request.getParameterValues("seat[]");//좌석
		String price = request.getParameter("price"); //영화 가격
		String paymunt = request.getParameter("paymunt");//결제수단
		String tel = request.getParameter("tel");
		// 결제수단 세부사항
		String cash = request.getParameter("cash");// 입력한 현금
		String check = request.getParameter("check"); // 입력한 카드번호
		
		Calendar today = Calendar.getInstance();
		
		
		
		
		if(paymunt.equals("cash")) {
			paymunt = "현금";
		}else if(paymunt.equals("check")) {
			paymunt = "카드";
		}else if(paymunt.equals("easy")) {
			paymunt = "간편결제";
		}
		
		
		int money = Integer.valueOf(cash)-Integer.valueOf(price);
		
		System.out.println(money);
		
		TicketVO vo = new TicketVO();
		MovieDAO dao = new MovieDAO();
		
		if(money >= 0 ) {
			// dao 실행후 데이터베이스에 저장 > 출력(최종 예매티켓 처럼)
			//money 를 거스름돈으로 같이 주기 티켓 출력 화면에서
			vo.setMovie(movie);		//영화 제목
			vo.setAge(age);			//연령대
			vo.setPeople(people);   //인원수
			vo.setTheater(theater); //상영관
			
			vo.setSeat1(seat[0]); //좌석
			vo.setSeat2(seat[1]);
			vo.setSeat3(seat[2]);
			vo.setSeat4(seat[3]);
			vo.setSeat5(seat[4]);
				
			vo.setShowtime(showtime); // 영화 시작시간
			vo.setPrice(price); 	 // 가격
			vo.setPaymunt(paymunt);  //결제수단
			vo.setTel(tel);
			
			
			try {
				int result = dao.ticket(vo);
				if(result==1) {
					request.setAttribute("tel", tel);
					request.setAttribute("Changes", money); // 영화 가격 - 입력한 값 계산후 남은 잔돈
					request.getRequestDispatcher("ticketing.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(money < 0) {
			
			request.setAttribute("error", "1");
			request.getRequestDispatcher("kioskmain.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
