<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%
	

 Collection<?> ordini = (Collection<?>) request.getAttribute("ordini");
 if(ordini == null) {
	response.sendRedirect("./ordiniutenti");	
	return;
}
	
 UserBean usr = (UserBean) session.getAttribute("user");

%>

<!DOCTYPE html>
<html lang="it">
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,eddy.vogue.model.*"%>
  <body>
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <link rel="stylesheet" href="../styles/admin-order.css" />
      <title>Eddy Vogue Admin</title>
    </head>

    <div class="header">
      <div class="middle">
        <img class="logo" src="img/logo.png" />
      </div>
    </div>

       <%@include file="/includes/NavBarAdmin.jsp"%>
   
    <div class="order-container">
      <div class="order-header">
        <h2>Ordini</h2>
        <input type="text" id="user" placeholder="Cerca..." />
      </div>
      <div class="order-table">
        <table>
          <tr>
            <th>ID</th>
            <th>ID Utente</th>
            <th>ID Prodotto</th>
            <th>Data</th>
            <th>Indirizzo</th>
            <th>Dettagli</th>
          </tr>

<%
			if (ordini != null && ordini.size() != 0) {
				Iterator<?> it = ordini.iterator();
				while (it.hasNext()) {
					OrderBean bean = (OrderBean) it.next();
		%>
            <tr>
           
              <td id="id"><%=bean.getIdOrdine()%></td>
              <td id="nome"><%=bean.getIdUtente()%></td>
              <td id="nome"><%=bean.getPb().getCode()%></td>
              <td><%=bean.getData()%></td>
              <td><%=bean.getIndirizzo()%></td>
              <td>
                <a href=""><img src="icons/3dots.svg" alt="" /></a>
              </td>
            </tr>
            <%
				}
			} 
		%>
         

          
         
        </table>
      </div>
    </div>
  </body>
</html>
