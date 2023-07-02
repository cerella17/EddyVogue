package eddy.vogue.control;

import java.io.IOException; 
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eddy.vogue.model.*;

/**
 * Servlet implementation class ProductControl
 */
public class CartControl extends HttpServlet {
	private static final long serialVersionUID = 1L;



	
	static ProductModel model;
	
	static {
		
			model = new ProductDao();
		
	}
	
	public CartControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");

		try {
			

			if (action != null) {
				 if (action.equalsIgnoreCase("deleteC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.deleteProduct(model.doRetrieveByKey(id));
				} 
				 else if (action.equalsIgnoreCase("addC")) {
						int id = Integer.parseInt(request.getParameter("id"));
						cart.addProduct(model.doRetrieveByKey(id));
					}
				 else if (action.equalsIgnoreCase("addQuant")) {
						int id = Integer.parseInt(request.getParameter("id"));
						int quant = Integer.parseInt(request.getParameter("quantita"));

						cart.addQuant(model.doRetrieveByKey(id),quant);
					}
			}
				
						
		} catch (SQLException e) {}
			
		

		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);
		
		
	

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Carrello.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
