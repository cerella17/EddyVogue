<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <body>
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <link rel="stylesheet" href="../styles/admin-user.css" />
      <title>Eddy Vogue Admin</title>
    </head>

    <div class="header">
      <div class="middle">
        <img alt="image" class="logo" src="img/logo.png" />
      </div>
    </div>

        <%@include file="/includes/NavBarAdmin.jsp"%>
    

    <div class="order-container">
      <div class="order-header">
        <h2>Utenti</h2>
      </div>
      <div class="order-table">
        <table title"dettagli utenti">
          <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Cognome</th>
            <th>Email</th>
            <th>Indirizzo</th>
            <th>Città</th>
            <th>Provincia</th>
            <th>CAP</th>
            <th>Password</th>
          </tr>

          <tr>
            <td id="id">1</td>
            <td id="name">Edmondo</td>
            <td id="surname">De Simone</td>
            <td>edmondo888@gmail.com</td>
            <td id="address">Via Alfonso Russo 29</td>
            <td id="city">Salerno</td>
            <td id="prov">Salerno</td>
            <td id="code">84127</td>
            <td id="psw">Ciao123@</td>
            <td>
              <a href=""><img src="icons/3dots.svg" alt="" /></a>
            </td>
          </tr>

          <tr>
            <td id="id">1</td>
            <td id="name">Edmondo</td>
            <td id="surname">De Simone</td>
            <td>edmondo888@gmail.com</td>
            <td id="address">Via Alfonso Russo 29</td>
            <td id="city">Salerno</td>
            <td id="prov">Salerno</td>
            <td id="code">84127</td>
            <td id="psw">Ciao123@</td>
            <td>
              <a href=""><img src="icons/3dots.svg" alt="" /></a>
            </td>
          </tr>

          <tr>
            <td id="id">1</td>
            <td id="name">Edmondo</td>
            <td id="surname">De Simone</td>
            <td>edmondo888@gmail.com</td>
            <td id="address">Via Alfonso Russo 29</td>
            <td id="city">Salerno</td>
            <td id="prov">Salerno</td>
            <td id="code">84127</td>
            <td id="psw">Ciao123@</td>
            <td>
              <a href=""><img src="icons/3dots.svg" alt="" /></a>
            </td>
          </tr>

        </table>
      </div>
    </div>
  </body>
</html>
