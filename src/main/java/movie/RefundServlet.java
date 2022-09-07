package movie;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RefundServlet")
public class RefundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Calendar today = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 현재시간

		String ticketnum = request.getParameter("ticketnum"); // 파라미터로 받은 티켓번호
		MovieDAO dao = new MovieDAO();
		Connection conn = DBcon.getConnection();
		String sql = "select * from ticket where i_num=?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, ticketnum);
			ResultSet rs = pstmt.executeQuery();
			rs.next();

			String buytime = rs.getString("showtime"); // 영화시작 시간
			String nowtime = sdf.format(today.getTime()); // 환불 요청하는시간

			System.out.println(buytime);
			System.out.println(nowtime);

			long ntime = Timestamp.valueOf(nowtime).getTime(); // 롱타입으로 변환하는식
			long btime = Timestamp.valueOf(buytime).getTime();

			System.out.println(btime);  // 테스트
			System.out.println(ntime);

			long rtime = btime - ntime;

			System.out.println(rtime);

			int refundtime = (int) ((rtime / (1000 * 60 * 60)) % 24);

			System.out.println("영화 시작까지 남은시간 : " + refundtime);

			if (refundtime > 1) {
				int result = dao.refund(ticketnum);
				if (result == 1) {
					request.setAttribute("refund", "1");
					request.getRequestDispatcher("kioskmain.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("error", "1");
				request.getRequestDispatcher("refund.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
