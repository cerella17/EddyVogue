package eddy.vogue.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import eddy.vogue.model.ProductDao;

@WebServlet("/getImage")
public class GetImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String imgId_string = request.getParameter("id");
		if (imgId_string == null) {
			response.getWriter().write("id parameter misses");
			return;
		}
		int imgId;

		ProductDao productDao = new ProductDao();

		try {
			imgId = Integer.parseInt(imgId_string);
		} catch (NumberFormatException e) {
			response.getWriter().write("id must be an integer");
			return;
		}

		try {
			byte[] img = productDao.getProductImageById(imgId);
			ServletOutputStream out = response.getOutputStream();
			if (img != null) {
				response.setContentType("image/jpeg");
				out.write(img);
			} else {
				response.getWriter().write("image not found");
			}
			out.close();
		} catch (SQLException e) {}
			
		
	}

}
