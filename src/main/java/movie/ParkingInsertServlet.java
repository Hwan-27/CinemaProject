package movie;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ParkingInsertServlet")
public class ParkingInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String carnum = request.getParameter("carnum");
		
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String enttime = date+" "+time+":00";
		
		
		MovieDAO dao = new MovieDAO();
		
		
		try {
			int result = dao.parkingInsert(carnum, enttime);
			
			
			if(result == 1) {
				request.setAttribute("samplesuccess", "1");
				request.getRequestDispatcher("adminmain.jsp").forward(request, response);
			}else {
				request.setAttribute("sampleerror", "1");
				request.getRequestDispatcher("adminmain.jsp").forward(request, response);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
