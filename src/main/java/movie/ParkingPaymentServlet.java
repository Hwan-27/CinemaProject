package movie;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ParkingPaymentServlet")
public class ParkingPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String carnum = request.getParameter("carnum");
		String cash = request.getParameter("cash"); // 입력받은 현금
		String price = request.getParameter("price"); // 결제해야할 금액

		int changes = Integer.valueOf(cash) - Integer.valueOf(price);
		
		
		
		if (changes >= 0) {
			MovieDAO dao = new MovieDAO();
			try {
				
				int result = dao.parkingPaymunt(carnum);
				
				if(result == 1) {
					request.setAttribute("parkingprice", "1");
					request.setAttribute("changes", changes);
					request.getRequestDispatcher("kioskmain.jsp").forward(request, response);
				}else {
					request.setAttribute("error", "1");
					request.getRequestDispatcher("parkingsettlement.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}else {
			request.setAttribute("error", "1");
			request.getRequestDispatcher("parkingsettlement.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}
