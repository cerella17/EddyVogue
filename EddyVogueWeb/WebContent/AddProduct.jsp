<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="it">
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,eddy.vogue.model.*"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Aggiungi prodotto</title>
</head>

<body>
	
	<h2>Insert</h2>
	<form action="addproduct" method="post">
		<input type="hidden" name="action" value="insert"> 
		
		<label for="Nome">Nome:</label><br> 
		<input name="Nome" type="text" maxlength="20" required placeholder="Nome"><br> 
		
		<label for="Tipologia">Tipologia:</label><br>
		<textarea name="Tipologia" maxlength="100" rows="3" required placeholder="Tipologia"></textarea><br>
		
		<label for="description">Descrizione:</label><br>
		<textarea name="Descrizione" maxlength="100" rows="3" required placeholder="Descrizione"></textarea><br>
		
		<label for="Prezzo">Prezzo:</label><br> 
		<input name="Prezzo" type="number" min="0" value="0" required><br>

		<label for="Quantita">Quantita:</label><br> 
		<input name="Quantita" type="number" min="1" value="1" required><br>
		
			<label for="Genere">Genere:</label><br>
		<textarea name="Genere" maxlength="100" rows="3" required placeholder="Genere"></textarea><br>

		<input type="submit" value="Add"><input type="reset" value="Reset">
	</form>
	
</body>
</html>
