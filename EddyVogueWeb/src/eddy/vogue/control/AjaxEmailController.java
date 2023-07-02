package eddy.vogue.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.json.JSONObject;

import eddy.vogue.model.UserBean;
import eddy.vogue.model.UserDao;


@WebServlet("/AjaxEmailController")
public class AjaxEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("etro");
		
		response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        JSONObject json = new JSONObject();
        
        if(email == null) {
        	json.put("error", "email param missing");
        	response.setStatus(400);
        	out.print(json.toString());
        	return;
        }else {
    		UserDao userDao = new UserDao();
        	
        	try {
        		if(!userDao.checkUserEmailExistance(email)) {
        			json.put("success", "Ok");
    				out.print(json.toString());
    				return;
        		}
        		else {
        			json.put("success", "Esistente");
    				out.print(json.toString());
    				return;
        		}
				
				
        	} catch (SQLException e){}
				
			
        }
        
	}

}
