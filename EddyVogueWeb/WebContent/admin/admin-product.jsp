<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
Collection<?> products = (Collection<?>) request.getAttribute("products");
if (products == null) {
	response.sendRedirect("./prodottiadmin");
	return;
}

ProductBean product = (ProductBean) request.getAttribute("product");
%>
<!DOCTYPE html>
<html lang="it">
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,eddy.vogue.model.*"%>

<body>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../styles/admin-product.css" />
<script src="../script/admin.js" type="text/javascript"></script>
<script type="text/javascript">
function FunctionProdotto(code) {
	  document.getElementById("myDropdown"+code).classList.toggle("show");
	}
	
	function openModal(code){
		document.getElementById("ModalProdotto"+code).style.display = "block";
		
	}
	function closeFun(code){
		document.getElementById("ModalProdotto"+code).style.display = "none";
	}
  </script>

<title>Eddy Vogue Admin</title>
</head>

<div class="header">
	<div class="middle">
		<img alt="image" class="logo" src="../img/logo.png" />
	</div>
</div>

<%@include file="/includes/NavBarAdmin.jsp"%>


<div class="wrap">
	<div class="order-header">
		<h2>Aggiungi un prodotto</h2>
	</div>
	<form
		style="display: flex; flex-direction: column; align-items: center"
		class="addproduct" action="addproduct?action=add" method="post"
		enctype="multipart/form-data">
		<div class="form-field">
			<input name="name" type="text" placeholder="Nome prodotto" required />
		</div>
		<div class="form-field">
			<input name="description" type="text"
				placeholder="Descirizione prodotto" required />
		</div>
		<div class="form-field">
			<input name="price" type="text" placeholder="Prezzo" required />
		</div>
		<div class="form-field">
			<input name="quantity" type="number" placeholder="Quantità" required />
		</div>
		<div class="form-field">
			<input name="tipologia" type="text" placeholder="Tipologia" required />
		</div>
		<select style="width: 11rem; height: 2rem; border-radius: 15px"
			name="genere" id="genere">
			<option value="UOMO">Uomo</option>
			<option value="DONNA">Donna</option>
			<option value="BAMBINO">Bambino</option>
		</select>
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
	</div>
	<div class="order-table">
		<table>
			<tr>
				<th>ID</th>
				<th>Nome Prodotto</th>
				<th>Descirizione</th>
				<th>Prezzo</th>
				<th>Quantità</th>
				<th>Genere</th>
				<th>Modifica</th>
			</tr>

			<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
			%>
			<tr>

				<td id="id"><%=bean.getCode()%></td>
				<td id="nome"><%=bean.getName()%></td>
				<td id="nome"><%=bean.getDescription()%></td>
				<td><%=bean.getPrice()%></td>
				<td><%=bean.getQuantity()%></td>
				<td><%=bean.getGenere()%></td>
				 <td>
              <div class="dropdown">
                <a onclick="FunctionProdotto(<%=bean.getCode()%>)" class="dropbtn"></a>
                <div id="myDropdown<%=bean.getCode()%>" class="dropdown-content">
                  <button onclick="openModal(<%=bean.getCode()%>)"  id="modifica-prodotto">Modifica</button>
                  <a href="addproduct?action=remove&id=<%=bean.getCode()%>">Rimuovi</a>
                 
                </div>
                </div>
        
            
            </td>

			</tr>
			
			<%
			}
			}
			%>





		</table>
			
			<!-- Modal content -->
			<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
			%>
			   	<div id="ModalProdotto<%=bean.getCode()%>" class="modal">
				<div class="modal-content">
				<span class="close" onclick="closeFun(<%=bean.getCode()%>)" >&times;</span>
				<form name="modifica-campi" method="post" action="addproduct?action=edit">
				<input hidden="true" id="id" name="id" type="text" value="<%=bean.getCode()%>" />
				
					<label for="fname">Nome:</label><br /> 
					<input type="text" id="name" name="name"  value="<%=bean.getName()%>" /><br />
						 <label for="lname">Tipologia:</label><br />
					<input type="text" id="tipologia" name="tipologia" value="<%=bean.getTipologia()%>" /><br />
					<br /> <label for="lname">Descrizione:</label><br /> 
					
					<input type="text" id="description" name="description" value="<%=bean.getDescription()%>" /><br />
					<label for="lname">Prezzo:</label><br />
					 <input id="price"name="price" type="tel" value="<%=bean.getPrice()%>" /> <br /> <label
						for="lname">Quantita:</label><br /> 
						<input id="quantity"type="number" name="quantity" value="<%=bean.getQuantity()%>" /> <br />
					<button class="btn" type="submit" value="Submit">Aggiorna</button>
				</form>
					</div>
			</div>
			<%
			}
			}
			%>
		
	
	</div>
</div>
</body>
</html>
