package eddy.vogue.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eddy.vogue.model.UserBean;
import eddy.vogue.model.OrderDao;
import eddy.vogue.model.OrderBean;


public class OrdiniAdminControllerDash extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDao orderDao = new OrderDao();
		try {
			List<OrderBean> ordini = orderDao.getOrdrers();
			request.setAttribute("ordini", ordini);
			request.getRequestDispatcher("/admin/admin-dashboard.jsp").forward(request, response);
			return;
		} catch (SQLException e) {}
		
		
		response.sendRedirect("/");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
