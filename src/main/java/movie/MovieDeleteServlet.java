package movie;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/moviedeleteServlet")
public class MovieDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String theater = request.getParameter("theater");
		String moviename = request.getParameter("moviename");
		
		
		
		MovieDAO dao = new MovieDAO();
		System.out.println(theater);
		System.out.println(moviename);
		
		try {
			int result = dao.movieDelete(theater, moviename);
			
			if(result == 1) {
				request.setAttribute("delete","1" );
				request.getRequestDispatcher("moviedelete.jsp").forward(request, response);
			}else {
				request.setAttribute("error","1" );
				request.getRequestDispatcher("moviedelete.jsp").forward(request, response);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
