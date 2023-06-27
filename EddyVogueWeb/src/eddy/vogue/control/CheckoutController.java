package eddy.vogue.control;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import eddy.vogue.model.UserBean;

import eddy.vogue.model.Cart;
import eddy.vogue.model.OrderDao;

public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		

		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if (cart == null) {
			request.getRequestDispatcher("/carrello").forward(request, response);
			return;
		}
	
		OrderDao orderDao = new OrderDao();
		try {
			int id_utente = ((UserBean)request.getSession().getAttribute("user")).getId();
			String indirizzo = ((UserBean)request.getSession().getAttribute("user")).getIndirizzo();

			orderDao.effettuaOrdine(cart.getProducts(), id_utente,indirizzo);
			request.getSession().setAttribute("cart", null);
			request.getRequestDispatcher("/user.jsp").forward(request, response);
			return;

		} catch (SQLException e) 
		
		
	}

}
