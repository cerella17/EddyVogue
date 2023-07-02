<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
	List<String> errors = (List<String>) request.getAttribute("errors");
%>

<!DOCTYPE html>
<html lang="it">

<head>
  <title>Eddi Vogue Registrati</title>
  <link rel="stylesheet" href="styles/registrati.css" />
  <script src="script/registration-form-validate.js"></script>
</head>

<body>

  <div class="signin">
    <div class="signin-container">
      <p>REGISTRATI</p>
       <% if(errors!=null){ %>
				<div class="errors-wrapper">
					<% for (String error : errors) { %>
					<span>- <%=error%></span>
					<% } %>
				</div>
			<% } %>
      
      <form name="registrati" onsubmit="return formValidate()" method="post" action="user?action=registrati">
        <div class="form-field">
          
          <input id="email" name="email" type="text" placeholder="Email" required autofocus >
        
        
        </div>
        <div id="email-error" class="error-message"></div>

  
        
        <div class="form-field">
          <input id="nome" name="nome" type="text" placeholder="Nome" required>
        </div>
        <div id="nome-error" class="error-message"></div>


        <div>
        <div class="form-field">
          <input id="cognome" name="cognome" type="text" placeholder="Cognome" required />
        </div>
        <div id="cognome-error" class="error-message"></div>
      </div>


        <div class="form-field">
          <input id="indirizzo" name="indirizzo" type="text" placeholder="Indirizzo" required />
        </div>
        <div id="indirizzo-error" class="error-message"></div>


        <div class="form-field">
          <input id="citta" name="citta" type="text" placeholder="Città" required />
        </div>
        <div id="citta-error" class="error-message"></div>


        <div class="form-field">
          <input id="provincia" name="provincia" type="text" placeholder="Provincia" required />
        </div>
        <div id="provincia-error" class="error-message"></div>


        <div class="form-field">
          <input id="cap" name="cap" type="text" placeholder="cap" required />
        </div>
        <div id="cap-error" class="error-message"></div>



             <div class="form-field">
          <input type="password" placeholder="Password" name="password" id="password" required />
        </div>
        <div id="pass-error" class="error-message"></div>


        <div class="form-field">
          <button class="btn" type="submit" value="Submit">Registrati</button>
        </div>
      </form>

      <a href="">Hai dimenticato la password?</a>
      <a href="login.html">Hai già un account? Accedi!</a>
    </div>
  </div>

</body>

</html>
