package eddy.vogue.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import eddy.vogue.model.ProductBean;
import eddy.vogue.model.ProductDao;

public class PaginaProdottoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id_str = request.getParameter("id");
		int id;
		if (id_str != null) {
			id = Integer.parseInt(id_str);
		}else {
			response.getWriter().write("id must be a number");
			return;
		}

		ProductDao productDao = new ProductDao();
		try {
			ProductBean product = productDao.doRetrieveByKey(id);
			request.setAttribute("product", product);
			request.getRequestDispatcher("Prodotto.jsp").forward(request, response);
		} catch (SQLException e) 
			
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
