package movie;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/upload.do")
public class MovieUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		MovieVO vo = new MovieVO();
		MovieDAO dao = new MovieDAO();

		String savePath = "upload";
		// 최대 업로드 파일크기 5mb제한
		int uploadFileSizeLimit = 5 * 1024 * 1024;
		String encType = "utf-8";

		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		System.out.println("서버상의 실제 디렉토리 :" + uploadFilePath);
		try {

			MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, encType,
					// 동일한 이름의 파일이 있을경우 새로운 이름 부여
					new DefaultFileRenamePolicy()

			);

			Enumeration<String> files = multi.getFileNames();
			while (files.hasMoreElements()) {
				String file = files.nextElement();
				String file_name = multi.getFilesystemName(file);
			}
			// 업로드된 파일의 이름 얻기
			String poster = multi.getFilesystemName("uploadFile");
			String moviename = multi.getParameter("moviename");
			String movietime = multi.getParameter("time");
			String age = multi.getParameter("age");
			String theater = multi.getParameter("theater");
			String showtime1 = multi.getParameter("showtime1");
			String showtime2 = multi.getParameter("showtime2");
			String showtime3 = multi.getParameter("showtime3");
			String showtime4 = multi.getParameter("showtime4");
			String showtime5 = multi.getParameter("showtime5");

			if (age.equals("all")) {
				age = "All";
			} else if (age.equals("12")) {
				age = "12";
			} else if (age.equals("15")) {
				age = "15";
			} else if (age.equals("18")) {
				age = "18";
			}

			vo.setPoster(poster);
			vo.setMoviename(moviename);
			vo.setMovietime(movietime);
			vo.setAge(age);
			vo.setTheater(theater);
			vo.setShowtime1(showtime1);
			vo.setShowtime2(showtime2);
			vo.setShowtime3(showtime3);
			vo.setShowtime4(showtime4);
			vo.setShowtime5(showtime5);

			int result = dao.movieUpdate(vo);

			if (result == 1) {
				request.setAttribute("movieupdate", "1");
				request.getRequestDispatcher("kioskmain.jsp").forward(request, response);
			} else {
				request.setAttribute("movieupdateerror", "1");
				request.getRequestDispatcher("adminmain.jsp").forward(request, response);
			}

		} catch (IOException e) {
			System.out.println("파일 업로드 실패");
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

		}

	}

}