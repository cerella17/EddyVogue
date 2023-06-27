<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%


	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./catalogo");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
	
	
%>


<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,eddy.vogue.model.*"%>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="styles/catalogo.css" />
        <link rel="stylesheet" href="styles/home.css" />
                    <script src="http://code.jquery.com/jquery-2.0.0.min.js"></script>
        
        <script src="script/index.js"></script>
        
    
    <title>Eddy Vogue</title>
  </head>

      <%@include file="/includes/NavBar.jsp"%>
  

  <div class="container">
    <div class="title">
      <p>IL NOSTO CATALOGO</p>
    </div>
    <div class="wrapper">
     <div class="filters-container">
       
        <div class="searchbar" id="searchbar">
							<input type="text" name="search" placeholder="Cerca"
								autocomplete="off" />
						
						<div class="searchbar-ajax">
								<ul>
									
								</ul>
						</div>
						</div>
      </div>

         

        
      <div class="product-container">
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
    </div>

	    <%@include file="/includes/Footer.jsp"%>

</html>
