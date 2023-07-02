package eddy.vogue.control;

import java.io.IOException; 
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eddy.vogue.model.*;

/**
 * Servlet implementation class ProductControl
 */
public class AdminUserControl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	
	static ProductModel model;
	
	static {
	
			model = new ProductDao();
		
	}
	
	public AdminUserControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		UserDao userDao = new UserDao();

		try {
			List<UserBean> users = userDao.doRetrieveAll();
			request.setAttribute("listaUser",users);
			request.getRequestDispatcher("/admin/admin-user.jsp").forward(request, response);
			return;
			
		}
		catch (SQLException e) {}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDao userDao = new UserDao();

		try {
			List<UserBean> users = userDao.doRetrieveAll();
			request.setAttribute("listaUser",users);
			request.getRequestDispatcher("/admin/admin-user.jsp").forward(request, response);
			return;
			
		}
		catch (SQLException e) {}
		
		
	}

}
