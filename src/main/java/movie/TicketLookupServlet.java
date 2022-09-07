package movie;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TicketLookupServlet")
public class TicketLookupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ticketnum = request.getParameter("ticketnum");
		String tel = request.getParameter("tel");
		
		
		MovieDAO dao = new MovieDAO();
		
		
		try {
			int result = dao.ticketLookup(ticketnum,tel);
			if(result==1) {
				request.setAttribute("ticketnum", ticketnum);
				request.setAttribute("tel", tel);
				request.getRequestDispatcher("ticketlookupticketing.jsp").forward(request, response);
			}else {
				request.setAttribute("error", "1");
				request.getRequestDispatcher("ticketlookup.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
