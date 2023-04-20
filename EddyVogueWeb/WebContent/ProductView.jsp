<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,eddy.vogue.model.*"%>

<head>
	<%@include file="/includes/Head.jsp"%>
	<link rel="stylesheet" href="styles/home.css">
	
</head>

<body>
    <%@include file="/includes/NavBar.jsp"%>
     <div class="mediahome">
        <video class="mediahome" autoplay muted loop>
            <source src="video/balenciaga.mp4" type="video/mp4">
        </video>

    </div>
      
    <div class="colum">

        <div class="card">
            <a href="" > <img class="imgbox" src="img/novita.jpg"></a>
        </div>

        <div class="card">
            <a href="" > <img class="imgbox" src="img/donna.jpg"></a>
        </div>
        
        <div class="card">
            <a href="" > <img class="imgbox" src="img/uomo.jpg"></a>
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
            <a href=""> <img class="imgbox" src="img/Scarpa1.png" /></a>
                <div class="description">
                    <p style="font-weight: bold; margin-bottom: 0"><%=bean.getName()%></p>
                    <p style="margin-top: 0"><%=bean.getPrice()%>€</p>
                    <a href="product?action=addC&id=<%=bean.getCode()%>">Aggiungi al carrello</a>
                </div>
        </div>
     
        <%
				}
			} 
		%>
		   </div>
	
	
	
	    <%@include file="/includes/Footer.jsp"%>
	
</body>
</html>