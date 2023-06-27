<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="it">
  <body>
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <link rel="stylesheet" href="../styles/admin-product.css" />
      <title>Eddy Vogue Admin</title>
    </head>

    <div class="header">
      <div class="middle">
        <img alt="image" class="logo" src="img/logo.png" />
      </div>
    </div>

           <%@include file="/includes/NavBarAdmin.jsp"%>
    

    <div class="wrap">
      <div class="order-header">
        <h2>Aggiungi un prodotto</h2>
      </div>
      <form class="addproduct" action="" method="post">
        <div class="form-field">
          <input name="name" type="text" placeholder="Nome prodotto" required />
        </div>
        <div class="form-field">
          <input
            name="desc"
            type="text"
            placeholder="Descirizione prodotto"
            required
          />
        </div>
        <div class="form-field">
          <input name="brand" type="text" placeholder="Brand" required />
        </div>
        <div class="form-field">
          <input name="price" type="text" placeholder="Prezzo" required />
        </div>
        <div class="form-field">
          <input name="qnt" type="number" placeholder="Quantità" required />
        </div>
        <div class="form-field">
          <input name="discount" type="text" placeholder="Sconto" required />
        </div>
        <div class="form-field">
          <input name="img" type="file" placeholder="Carica foto" required />
        </div>
        <div class="form-field">
          <button>CARICA</button>
        </div>
      </form>
    </div>

    <div class="order-container">
      <div class="order-header">
        <h2>Prodotti</h2>
        <input type="text" id="user" placeholder="Cerca..." />
      </div>
      <div class="order-table">
        <table>
          <tr>
            <th>ID</th>
            <th>Nome Prodotto</th>
            <th>Tipologia</th>
            <th>Descirizione</th>
            <th>Prezzo</th>
            <th>Quantità</th>
            <th>Genere</th>
          </tr>

          <tr>
            <td id="id">1</td>
            <td id="name">Tacco STEVE MADDEN</td>
            <td id="type">scarpa</td>
            <td id="desc">tacco donna</td>
            <td id="price">159</td>
            <td id="qt">10</td>
            <td id="genere">Disponibile</td>
            <td>
              <a href=""><img src="icons/3dots.svg" alt="" /></a>
            </td>
          </tr>

         

         

        </table>
      </div>
    </div>
  </body>
</html>
