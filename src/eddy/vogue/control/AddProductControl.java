package eddy.vogue.control;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import eddy.vogue.model.*;

/**
 * Servlet implementation class ProductControl
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class AddProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	
	static ProductModel model;
	
	static {
			model = new ProductDao();
		
	}
	
	public AddProductControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String action = request.getParameter("action");

		try {
			if (action != null) {
			 if (action.equalsIgnoreCase("add")) {
					String name = request.getParameter("name");
					String description = request.getParameter("description");
					int price = Integer.parseInt(request.getParameter("price"));
					int quantity = Integer.parseInt(request.getParameter("quantity"));
					String tipologia = request.getParameter("tipologia");
					String genere = request.getParameter("genere");


					InputStream immagine = null;
					
					List<String> errors = new ArrayList<>();

					if (request.getParts() != null && request.getParts().size() > 0) {
						for (Part part : request.getParts()) {
							if (part.getContentType() != null && part.getContentType().contains("image/")) {
								immagine = part.getInputStream();
							}
						}
					}
					
					if (name == null || name.trim().isEmpty()) {
						errors.add("Il campo nome non può essere vuoto!");
					}
					if (description == null || description.trim().isEmpty()) {
						errors.add("Il campo descrizione non può essere vuoto!");
					}
					if (tipologia == null || tipologia.trim().isEmpty()) {
						errors.add("Il tipo descrizione non può essere vuoto!");
					}
					if (price == 0){
						errors.add("Il campo prezzo non può essere vuoto!");
					}
					if (quantity == 0 ) {
						errors.add("Il campo quantita non può essere vuoto!");
					}
					if (immagine == null) {
						errors.add("Il campo immagine non può essere vuoto!");
					}

					


					ProductBean bean = new ProductBean();
					bean.setName(name);
					bean.setDescription(description);
					bean.setPrice(price);
					bean.setQuantity(quantity);
					bean.setImmagineIS(immagine);
					bean.setGenere(genere);
					bean.setTipologia(tipologia);
					model.doSave(bean);
				}
			 else if (action.equalsIgnoreCase("edit")) {
				 String name = request.getParameter("name");
					String description = request.getParameter("description");
					int price = Integer.parseInt(request.getParameter("price"));
					int quantity = Integer.parseInt(request.getParameter("quantity"));
					int code = Integer.parseInt(request.getParameter("id"));
					String tipologia = request.getParameter("tipologia");
					
					ProductBean bean = new ProductBean();
					bean.setName(name);
					bean.setDescription(description);
					bean.setPrice(price);
					bean.setQuantity(quantity);
				    bean.setCode(code);
					bean.setTipologia(tipologia);
					
				model.doEdit(bean);
				 
				 
			 }
			 else if (action.equalsIgnoreCase("remove")) {
				
					int code = Integer.parseInt(request.getParameter("id"));
			
					
				model.doDelete(code);
				 
				 
			 }
			}			
		} catch (SQLException e) {
		}

	
		

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/admin-product.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
