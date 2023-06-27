<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./donna");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
	
	
%>


<!DOCTYPE html>
<html lang="it">
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,eddy.vogue.model.*"%>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="styles/donna.css" />
    <title>Eddy Vogue</title>
  </head>

  <body>
        <%@include file="/includes/NavBar.jsp"%>
    
    <div class="cards">
      <div class="photo">
        <img src="img/dcard1.jpg" alt="" />
      </div>
      <div class="photo">
        <img src="img/dcard2.jpg" alt="" />
      </div>
      <div class="photo">
        <img src="img/dcard3.jpg" alt="" />
      </div>
    </div>

    <div class="container">
      <p> DONNA</p>
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
    </div>

  	    <%@include file="/includes/Footer.jsp"%>
  
  </body>
</html>
