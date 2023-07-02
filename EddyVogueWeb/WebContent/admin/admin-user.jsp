<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	Collection<?> users = (Collection<?>) request.getAttribute("listaUser");
	if(users == null) {
		response.sendRedirect("./useradmin");	
		return;
	}

	
	
%>
<!DOCTYPE html>
<html lang="it">
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,eddy.vogue.model.*"%>

  <body>
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <link rel="stylesheet" href="../styles/admin-user.css" />
      <title>Eddy Vogue Admin</title>
    </head>

    <div class="header">
      <div class="middle">
        <img alt="image" class="logo" src="../img/logo.png" />
      </div>
    </div>

        <%@include file="/includes/NavBarAdmin.jsp"%>
    

    <div class="order-container">
      <div class="order-header">
        <h2>Utenti</h2>
      </div>
      <div class="order-table">
        <table >
	<caption>Dettagli User</caption>
          <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Cognome</th>
            <th>Email</th>
            <th>Indirizzo</th>
            <th>Città</th>
            <th>Provincia</th>
            <th>CAP</th>
          </tr>

          <%
			if (users != null && users.size() != 0) {
				Iterator<?> it = users.iterator();
				while (it.hasNext()) {
					UserBean bean = (UserBean) it.next();
			%>
			
				<tr>
				<td id="id"><%=bean.getId()%></td>
				<td id="nome"><%=bean.getNome()%></td>
				<td id="nome"><%=bean.getCognome()%></td>
				<td><%=bean.getEmail()%></td>
				<td><%=bean.getIndirizzo()%></td>
				<td><%=bean.getCitta()%></td>
				<td><%=bean.getProvincia()%></td>
				<td><%=bean.getCap()%></td>
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
