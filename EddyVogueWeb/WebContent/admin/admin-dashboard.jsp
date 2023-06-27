

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
        <img src="icons/sales.svg" alt="" />
        <div class="text-info">
          <p>Vendite Totali</p>
          <h3>5.000€</h3>
        </div>
      </div>

      <div class="info">
        <img src="icons/orders.svg" alt="" />
        <div class="text-info">
          <p>Ordini Totali</p>
          <h3>303</h3>
        </div>
      </div>

      <div class="info">
        <img src="icons/product.svg" alt="" />
        <div class="text-info">
          <p>Prodotti Totali</p>
          <h3>1069</h3>
        </div>
      </div>
    </div>

    <div class="order-container">
      <div class="order-header">
        <h2>Ordini recenti</h2>
      </div>
      <div class="order-table">
        <table title="dettagli ordine">
          <tr>
            <th>ID</th>
            <th>ID U</th>
            <th>ID P</th>
            <th>Data</th>
            <th>Indirizzo</th>
            <th>Dettagli</th>
          </tr>

          <tr>
            <td id="id">1</td>
            <td id="idu">2</td>
            <td id="idp">1245</td>
            <td id="date">12/06/2023</td>
            <td id="address">Via Alfonso Russo 29</td>
            <td id="details">Spedito</td>
            <td>
              <a href=""><img src="icons/3dots.svg" alt="" /></a>
            </td>
          </tr>

       

       
        </table>
      </div>
    </div>
  </body>
</html>
