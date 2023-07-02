package eddy.vogue.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import eddy.vogue.model.UserBean;
import eddy.vogue.model.UserDao;


@WebServlet("/controllers/user")
public class User extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		switch (action) {
			case "logout": {
				request.getSession().invalidate();
				response.sendRedirect(request.getContextPath() + "/");
				break;
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDao userDao = new UserDao();
		String action = request.getParameter("action");
		List<String> errors = new ArrayList<>();

		if (action == null) {
			response.getWriter().write("?action= misses");
			return;
		}
		if(action.equals("getAllUser")) {
			try {
				List<UserBean> users = userDao.doRetrieveAll();
				request.setAttribute("listaUser",users);
				request.getRequestDispatcher("/admin/admin-user.jsp").forward(request, response);
				return;
				
			}
			catch (SQLException e) {}
			
		}
		String email = request.getParameter("email");

		if(action.equals("checkEmail")) {
			try {
				
			
			if (userDao.checkUserEmailExistance(email)) {
				errors.add("L'email è già in uso!");
				request.setAttribute("errors", errors);
			
				return;
			}
			}
			catch (SQLException e) {}
			
		}
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String password = request.getParameter("password");
		String citta = request.getParameter("citta");
		String indirizzo = request.getParameter("indirizzo");
		String provincia = request.getParameter("provincia");
		int id = Integer.parseInt(request.getParameter("id")!=null?request.getParameter("id"):"0");

		
		
		

		// errors handling
		if (email == null || email.trim().isEmpty()) {
			errors.add("Il campo email non può essere vuoto!");
		}
		if(id==0) {
			if (password == null || password.trim().isEmpty() ) {
				errors.add("Il campo password non può essere vuoto!");
			
		}
}
		if (action.equals("registrati")) {
			if (nome == null || nome.trim().isEmpty()) {
				errors.add("Il campo nome non può essere vuoto!");
			}
			if (cognome == null || cognome.trim().isEmpty()) {
				errors.add("Il campo cognome non può essere vuoto!");
			}
		}

		if (!errors.isEmpty() && !action.equals("updateIndirizzo")) {
			request.setAttribute("errors", errors);
			if (action.equals("accedi")) {
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			} 
			else if(action.equals("updateData")){
				request.getRequestDispatcher("/user.jsp").forward(request, response);
			}
			else if(action.equals("updateIndirizzo")){
				request.getRequestDispatcher("/user.jsp").forward(request, response);
			}
			else {
			
				request.getRequestDispatcher("/registrati.jsp").forward(request, response);
			}
			return;
		}


		switch (action) {
		case "accedi": {
			try {
				UserBean ub = userDao.doRetrieveByEmailAndPass(email, password);
				request.getSession().setAttribute("user", ub);

				if (ub != null) {
					if (userDao.checkUserIsAdmin(ub.getId())) {
						request.getSession().setAttribute("isAdmin", true);
					}
					
					response.sendRedirect(request.getContextPath() + "/");
				} else {
					errors.add("Credenziali sbagliate!");
					request.setAttribute("errors", errors);
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}
			} catch (SQLException e) {}
			
			break;
		}
		case "registrati": {
			int cap = Integer.parseInt(request.getParameter("cap"));

			try {
				if (userDao.checkUserEmailExistance(email)) {
					errors.add("L'email è già in uso!");
					request.setAttribute("errors", errors);
					request.getRequestDispatcher("/registrati.jsp").forward(request, response);
					return;
				}
			} catch (SQLException e) {}
			
			UserBean ub = new UserBean();
			ub.setNome(nome);
			ub.setCognome(cognome);
			ub.setEmail(email);
			ub.setPassword(password);
			ub.setCap(cap);
			ub.setIndirizzo(indirizzo);
			ub.setProvincia(provincia);
			ub.setCitta(citta);

			request.getRequestDispatcher("/login.jsp").forward(request, response);
			try {
				userDao.doSave(ub);

			} catch (SQLException e) {}
			
			break;
		}
		case "updateDati": {
			try {
				
				userDao.doUpdateData(nome,cognome,email,id);
				UserBean ub = userDao.doRetrieveById(id);

				
				request.getSession().setAttribute("user", ub);

				request.getRequestDispatcher("/user.jsp").forward(request, response);



			
			} catch (SQLException e) {}
			break;
		}
		case "updateIndirizzo": {
			try {
				
				userDao.doUpdateIndirizzo(indirizzo,id);
				UserBean ub = userDao.doRetrieveById(id);

				
				request.getSession().setAttribute("user", ub);

				request.getRequestDispatcher("/user.jsp").forward(request, response);



			
			} catch (SQLException e) {}
			
			break;
		}
			default:
				break;
		}
	}

}
