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


public class OrdiniController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDao orderDao = new OrderDao();
		try {
			int id_utente = ((UserBean)request.getSession().getAttribute("user")).getId();
			List<OrderBean> ordini = orderDao.getOrdersFromUser(id_utente);
			request.setAttribute("ordini", ordini);
			request.getRequestDispatcher("/user.jsp").forward(request, response);
			return;
		} catch (SQLException e) 
			
		
		response.sendRedirect("/");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
