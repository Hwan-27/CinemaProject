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

@WebServlet("/ParkingSettlementServlet")
public class ParkingSettlementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		MovieDAO dao = new MovieDAO();
		Calendar today = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 현재시간

		String carnum = request.getParameter("carnum"); // 파라미터로 받은 값의 번호
		
		Connection conn = DBcon.getConnection();
		String sql = "select enttime from parking where carnum like ?";
		try {

			System.out.println(carnum);

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + carnum);
			ResultSet rs = pstmt.executeQuery();

			

			if (rs.next()) {
				String enttime = rs.getString("enttime"); // 입차시간
				String exttime = sdf.format(today.getTime()); // 출차시간
				
				System.out.println(enttime);
				System.out.println(exttime);
				
				
				
				long entrance = Timestamp.valueOf(enttime).getTime(); // long 타입 변환
				long exittime = Timestamp.valueOf(exttime).getTime();

				System.out.println(entrance);
				System.out.println(exittime);
				
				long totaltime = exittime - entrance; // 두 시간을 뺀 값
				
				System.out.println(totaltime);
				
				int pricetime = (int) ((totaltime / (1000 * 60 * 60))); // 두 시간을 뺀 값을 hours 로 변환
				
				System.out.println(pricetime);
				
				int price = pricetime * 1000;
				
				System.out.println(price);
				
				request.setAttribute("carnum", carnum); // 차 번호와 주차정산비를 parkingconfirm 정산 페이지로 보냄
				request.setAttribute("price", price);
				request.getRequestDispatcher("parkingpayment.jsp").forward(request, response);

			}else {
				request.setAttribute("numnull", "1");
				request.getRequestDispatcher("parkingsettlement.jsp").forward(request, response);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
