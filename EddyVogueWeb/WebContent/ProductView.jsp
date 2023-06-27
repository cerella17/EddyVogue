<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./home");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
	
	
%>


<!DOCTYPE html>
<html lang="it">
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,eddy.vogue.model.*"%>

  <head>
    	<%@include file="/includes/Head.jsp"%>
<link href="styles/home.css" rel="stylesheet" type="text/css">
            <script src="http://code.jquery.com/jquery-2.0.0.min.js"></script>
            <script src="script/jquery.js"></script>
    <title>Eddy Vogue</title>
  </head>

  <body>
    
	<jsp:include page="includes/NavBar.jsp"></jsp:include>
    <div class="mediahome">
      <video class="mediahome" autoplay muted loop>
        <source src="video/balenciaga.mp4" type="video/mp4" />
      </video>
    </div>

    <div class="colum">
      <div class="card">
        <img alt="image" class="imgbox" src="img/novita.jpg" />
        <div class="overlay">
          <a href="/EddyVogueWeb/catalogo.jsp">Novità</a>
        </div>
      </div>

      <div class="card">
        <img alt="image" class="imgbox" src="img/donna.jpg" />
        <div class="overlay">
          <a href="/EddyVogueWeb/donna.jsp">Donna</a>
        </div>
      </div>

      <div class="card">
        <img alt="image" class="imgbox" src="img/uomo.jpg" />
        <div class="overlay">
          <a href="/EddyVogueWeb/uomo.jsp">Uomo</a>
        </div>
      </div>
    </div>

   

    <div class="carousel">
    <%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
      <div class="product">
        <a href="./Prodotto.jsp?id=<%=bean.getCode()%>"> <img class="imgbox" src="getImage?id=<%=bean.getCode() %>" alt="Immagine del prodotto"/></a>

        <div class="description">
          <p style="font-weight: bold; margin-bottom: 0"><%=bean.getName()%></p>
          <p style="margin-top: 0"><%=bean.getPrice()%>€</p>
        </div>
      </div>
<%
				}
			} 
		%>
      
    </div>

   <div class="imgcontainer">
      <img alt="image" src="img/Moda1.jpg" alt="Not Found" />
 <a href="/EddyVogueWeb/donna.jsp">Esplora</a>    </div>

    <div class="newsletter">
      <h2>Vuoi ricervere uno sconto del 5% sul prossimo ordine?</h2>
      <div class="form">
        <input type="text" placeholder="Inserisci la tua email" />
        <button>ISCRIVITI</button>
      </div>
      <h6>
        Ricevi news via email da EddyVogue. Puoi disiscriverti in qualsiasi
        momento, è totalmente gratis.
      </h6>
    </div>

	    <%@include file="/includes/Footer.jsp"%>

  </body>
</html>
