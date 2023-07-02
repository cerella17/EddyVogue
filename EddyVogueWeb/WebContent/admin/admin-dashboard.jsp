

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%
	

 Collection<?> ordini = (Collection<?>) request.getAttribute("ordini");
 if(ordini == null) {
	response.sendRedirect("./dashboardadmin");	
	return;
}
	

%>


<!DOCTYPE html>
<html lang="it">
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,eddy.vogue.model.*"%>

 
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <link rel="stylesheet" href="../styles/admin-dash.css" />
      <title>Eddy Vogue Admin</title>
    </head>
<body>
    <div class="header">
      <h2>Benevenuto Admin!</h2>
    </div>

    <%@include file="/includes/NavBarAdmin.jsp"%>

    <div class="info-container">
      <div class="info">
        <img src="../icons/sales.svg" alt="" />
        <div class="text-info">
          <p>Vendite Totali</p>
          <h3>5.000€</h3>
        </div>
      </div>

      <div class="info">
        <img src="../icons/orders.svg" alt="" />
        <div class="text-info">
          <p>Ordini Totali</p>
          <h3>5</h3>
        </div>
      </div>

      <div class="info">
        <img src="../icons/product.svg" alt="" />
        <div class="text-info">
          <p>Prodotti Totali</p>
          <h3>10</h3>
        </div>
      </div>
    </div>

    <div class="order-container">
      <div class="order-header">
        <h2>Ordini recenti</h2>
      </div>
      <div class="order-table">
        <table >
        	<caption>Ordini</caption>
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
