<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
ProductBean product = (ProductBean) request.getAttribute("product");

Cart cart = (Cart) request.getAttribute("cart");
if (cart == null) {
	response.sendRedirect("./carrello");
	return;
}
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,eddy.vogue.model.Cart,eddy.vogue.model.ProductBean,eddy.vogue.control.*"%>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="styles/carrello.css" rel="stylesheet" type="text/css">
<title>Carrello</title>
</head>

<body>
	<div class="title">
		<p>Il Tuo Carrello</p>
	</div>
	<%
	if (cart.getProducts().size() > 0) {
	%>
	<div class="cart-container">
		<div class="products">

			<%
			List<ProductBean> prodcart = cart.getProducts();
			int totale = 0;
			for (ProductBean beancart : prodcart) {
				totale = totale + beancart.getPrice()*beancart.getQuantitaAcquisto();
			%>
			<div class="item">
				<div class="item-image">
					<a href=""><img src="img/Scarpa1.png" /></a>
				</div>

				<div class="item-info">
					<div class="rmv">
						<a href="carrello?action=deleteC&id=<%=beancart.getCode()%>">
							<img src="img/icons8-close.svg" />
						</a>
					</div>

					<h6><%=beancart.getName()%></h6>
					<br /> <span>Prezzo:</span> <span class="bolded"><%=beancart.getPrice()%>€</span>
					<br /> <span>Misura:</span> <span class="bolded">39</span> <br />
					<span>Quantità: <%=beancart.getQuantitaAcquisto()%></span>
				</div>
			</div>

			<%
			}
			%>


		</div>

		<div class="payment">
			<div class="checkout">
				<h6>ORDINE</h6>
				<div class="subtotal">
					<p>SUBTOTALE</p>
					<p><%=totale%>€</p>
				</div>

				<div class="shipping">
					<p>SPEDIZIONE</p>
					<p>0€</p>
				</div>

				<div class="total">
					<p>TOTALE (IVA inclusa)</p>
					<p class="finalprice"><%=totale%>€</p>
				</div>

				<button class="acquista">ACQUISTA</button>

				<button class="paypal">
					<img src="img/PayPal.png" alt="PayPal" />
				</button>
			</div>

			<div class="discount">
				<div class="discount-header">
					<p>Inserisci un codice sconto</p>
					<img src="icons/arrow.svg" alt="" />
				</div>
				<input type="text" placeholder="Codice Sconto" />
			</div>
		</div>
	</div>
	<%
	}
	%>





</body>
</html>