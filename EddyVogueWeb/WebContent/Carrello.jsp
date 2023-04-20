<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	
ProductBean product = (ProductBean) request.getAttribute("product");

	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,eddy.vogue.model.*"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Carrello</title>
</head>

<body>
	
	<% if(cart != null) { %>
		<h2>Carrello</h2>
		<table border="1">
		<tr>
			<th>Nome</th>
			<th>Azione</th>
		</tr>
		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   for(ProductBean beancart: prodcart) {
		%>
		<tr>
			<td><%=beancart.getName()%></td>
			<td><a href="carrello?action=deleteC&id=<%=beancart.getCode()%>">Rimuovi</a></td>
		</tr>
		<%} %>
	</table>		
	<% } %>	
</body>
</html>