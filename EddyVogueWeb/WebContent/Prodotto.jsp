<%@ page contentType="text/html; charset=UTF-8" import="eddy.vogue.model.ProductBean,eddy.vogue.model.Cart"%>


<% 
	if(request.getParameter("id")==null){
		response.sendRedirect("./product");
		return;
	}
ProductBean product = (ProductBean) request.getAttribute("product");
	if(product == null){
		response.sendRedirect("Prodotto?id="+request.getParameter("id"));
		return;
	}
	
	Cart cart = (Cart) request.getAttribute("cart");

%>


<!DOCTYPE html>
<html lang="it">

<head>
	<link rel="stylesheet" href="styles/prodotto.css">
    <title>Prodotto</title>
  </head>


<body>

    <%@include file="/includes/NavBar.jsp"%>
	

 

  <div class="product">
    <div class="product-image">
      <img src="getImage?id=<%=product.getCode()%>" alt="Prodotto" />
    </div>

    <div class="product-settings">
      <div class="settings-header">
        <p class="frist"><%=product.getName() %></p>
        <p class="second"><%=product.getDescription() %></p>
        <p class="third"><%=product.getPrice() %>€</p>
      </div>

   

   <div class="size">
        <div>
          <span id="tit">TAGLIA</span>
          <span>- Taglia unica</span>
        </div>
        
      </div> 

      <div class="buttons">
       <a href="carrello?action=addC&id=<%=product.getCode()%>"> 
        <button id="add">AGGIUNGI AL CARRELLO</button>
        </a>
      </div>
    </div>
  </div>

  <footer>
    <div class="footer-container">
      <div class="footer-logo">
        <img src="img/Eddy Vogue2.png" alt="EddyVogue" />
      </div>

      <div class="container-menu">
        <div class="footer-menu">
          <ul>
            <li><p>ASSISTENZA CLIENTI</p></li>
            <li><a href="">AIUTO</a></li>
            <li><p>LAVORA CON NOI</p></li>
            <li><a href="">OPPORTUNITÃ DI LAVORO</a></li>
          </ul>
        </div>

        <div class="footer-menu">
          <ul>
            <li><a href="">CONTATTI</a></li>
            <li><a href="">LA NOSTRA STORIA</a></li>
            <li><a href="">L'AZIENDA</a></li>
            <li><a href="">NEGOZI EDDY VOGUE</a></li>
            <li><a href="">PRIVACY</a></li>
            <li><a href="">COOKIE</a></li>
          </ul>
        </div>

        <div class="footer-menu">
          <ul>
            <li><p>SHOPPING ONLINE</p></li>
            <li><a href="">PREZZI E VALUTA</a></li>
            <li><a href="">FORME DI PAGAMENTO</a></li>
            <li><a href="">MODALITÃ DI SPEDIZIONE</a></li>
            <li><a href="">TERMINI LEGALI</a></li>
            <li><a href="">VIRTUAL GIFT CARD</a></li>
          </ul>
        </div>
      </div>
    </div>

    <div class="copy">
      <p>Â© 2023 EDDY VOGUE S.P.A. - Via Roma 69, 84127 Salerno(SA)</p>
    </div>
  </footer>
  </body>
</html>
