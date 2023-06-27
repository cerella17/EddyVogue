<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="it">
  <head>
    <link rel="stylesheet" href="styles/error.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Errore ${pageContext.errorData.statusCode}</title>
  </head>
  <body>
    <div class="header">
      <div class="middle">
        <div class="topcentre">
          <a href="home.html"><img alt="image" class="logo" src="img/logo.png" /></a>
        </div>
      </div>
    </div>

    <div class="container-error">
      <div class="error-image">
        <img src="img/error.png" alt="Not Found" />
      </div>
      <div class="error-description">
        <h1>${pageContext.errorData.statusCode}</h1>
        <h4>Errore</h4>
        <h6>
          La pagina che stai cercando non esiste o si è verificato un altro errore.
        </h6>
        <a href="./ProductView.jsp">TORNA ALLA HOME</a>
      </div>
    </div>
  </body>
</html>
