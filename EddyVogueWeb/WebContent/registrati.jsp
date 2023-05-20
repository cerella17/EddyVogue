<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
	List<String> errors = (List<String>) request.getAttribute("errors");
%>

<!DOCTYPE html>
<html lang="it">
<head>
 <link rel="stylesheet" href="styles/registrati.css" />
    <title>Eddi Vogue Login</title>
</head>
<body>
<div class="signin">
    <div class="signin-container">
      <p>REGISTRATI</p>

      <form action="user?action=registrati" method="POST">

        <div class="form-field">
          <input type="email" placeholder="Email" name="email" required />
        </div>

        <div class="form-field">
          <input type="text" placeholder="Nome" name="nome" required />
        </div>

        <div class="form-field">
          <input type="text" placeholder="Cognome" name="cognome" required />
        </div>

        <div class="form-field">
          <input type="text" placeholder="Indirizzo" name="indirizzo" required />
        </div>

        <div class="form-field">
          <input type="text" placeholder="Città" name="citta" required />
        </div>

        <div class="form-field">
          <input type="text" placeholder="Provincia" name="provincia" required />
        </div>

        <div class="form-field">
          <input type="number" placeholder="CAP" name="cap" required />
        </div>

        <div class="form-field">
          <input type="password" placeholder="Password" name="password" required />
        </div>

        <div class="form-field">
          <button class="btn" type="submit">Registrati</button>
        </div>
      </form>

      <a href="">Hai dimenticato la password?</a>
      <a href="login.jsp">Hai già un account? Accedi!</a>
    </div>
  </div>
	
</body>
</html>
