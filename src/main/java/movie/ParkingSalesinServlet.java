package movie;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ParkingSalesinServlet")
public class ParkingSalesinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		
		MovieDAO dao = new MovieDAO();
		
		try {
			Connection conn = DBcon.getConnection();
			String sql = "select sum(price)as total from ticket where buytime between ? and ?";
			
			PreparedStatement pstmt =  conn.prepareStatement(sql);
			pstmt.setString(1, startdate);
			pstmt.setString(2, enddate);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
			int  price = Integer.valueOf(rs.getString("total"));
			
			System.out.println(price);
			
			request.setAttribute("price", price);
			request.getRequestDispatcher("salesinquiry.jsp").forward(request, response);
			}else if(!rs.next()){
				int price = 0;
				request.setAttribute("price", price);
				request.getRequestDispatcher("salesinquiry.jsp").forward(request, response);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
