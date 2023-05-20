<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
	List<String> errors = (List<String>) request.getAttribute("errors");
%>

<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="styles/login.css" />
    <title>Eddy Vogue Login</title>
</head>
<body>
  <div class="login">
    <div class="login-container">
      <p>LOGIN</p>
      <% if(errors!=null){ %>
				<div class="errors-wrapper">
					<% for (String error : errors) { %>
					<span>- <%=error%></span>
					<% } %>
				</div>
			<% } %>

  			<form action="user?action=accedi" method="POST">

        <div class="form-field">
          <input type="email" placeholder="Email" name="email" id="email" required />
        </div>

        <div class="form-field">
          <input type="password" placeholder="Password" name="password" id="password" required />
        </div>

        <div class="form-field">
          <button class="btn" type="submit">Accedi</button>
        </div>
      </form>

      <a href="">Hai dimenticato la password?</a>
      <a href="registrati.jsp">Non hai un account? Registrati!</a>
    </div>
  </div>
	
</body>
</html>
