package movie;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		String a_id = "admin";
		String a_pw = "1234";

		if (id.equals(a_id) && pw.equals(a_pw)) {
			response.sendRedirect("adminmain.jsp");
		} else {
			request.setAttribute("error", "1");
			request.getRequestDispatcher("adminlogin.jsp").forward(request, response);
		}

	}

}
