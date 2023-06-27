<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%
	

 Collection<?> ordini = (Collection<?>) request.getAttribute("ordini");
 if(ordini == null) {
	response.sendRedirect("./ordiniutente");	
	return;
}
	
 UserBean usr = (UserBean) session.getAttribute("user");

%>

<!DOCTYPE html>
<html lang="it">
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,eddy.vogue.model.*"%>


  <body>
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <link rel="stylesheet" href="styles/user.css" />
      <script src="script/registration-form-validate.js"></script>
        <script src="script/modifica.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.debug.js"></script>
<script type="text/javascript">
       function fattura(prezzo,ordine){
    	   var doc = new jsPDF()
	
    	    doc.text("Eddy Vogue p.Iva 0623823783 Fattura num°12015 ", 10, 10)
    	    doc.text(ordine, 10, 20)
    	        doc.text("iva 22%", 10, 30)
    	    doc.text(prezzo, 10, 40)

    	doc.save('fattura.pdf')	
      }
  </script>
      
      
      <title>Eddy Vogue</title>
    </head>

   
       <%@include file="/includes/NavBar.jsp"%>

    <div class="wrap">
      <div class="container">
        <h2>Benevenuto <%=usr.getNome()%>!</h2>
        <div class="user-info">
          <div class="user-data">
            <div class="title">
              <img src="icons/id-card.svg" alt="" />
              <h3>I tuoi dati</h3>
              <button id="modifica-profilo">(modifica)</button>
              
            </div>
            <span id="bold">NOME:</span>
            <span><%=usr.getNome()%></span>
            <br />
            <span id="bold">COGNOME:</span>
            <span><%=usr.getCognome()%></span>
            <br />
            <span id="bold">EMAIL:</span>
            <span><%=usr.getEmail()%></span>
          </div>
          <div id="ModalProfile" class="modal">
            <!-- Modal content -->

            <div class="modal-content">
              <span class="close">&times;</span>

              <form
                name="modifica-campi"
                onsubmit="formValidateProfilo(event)"
                method="post"
                action="user?action=updateDati"
              >
                <input hidden="true" id="id" name="id" type="text" value="<%=usr.getId()%>" />
              
                <label for="fname">Nome:</label><br />
                <input id="nome" name="nome" type="text" value="<%=usr.getNome()%>" />
                <br />
                <span id="nome-error"></span><br />
                <label for="lname">Cognome:</label>
                <br />
                <input id="cognome" name="cognome" type="text" value="<%=usr.getCognome()%>" />
                <br />
                <span id="cognome-error"></span><br />
                <label for="lname">Email:</label><br />
                <input id="email" name="email" type="text" value="<%=usr.getEmail()%>" />
                <span id="email-error"></span>
                <br /><br />
                <button class="btn" type="submit" value="Submit">Aggiorna</button>
              </form>
            </div>
          </div>

          <div class="user-address">
            <div class="title">
              <img src="icons/address1.svg" alt="" />
              <h3>I tuoi indirizzi</h3>
              <button id="modifica-indirizzo">(modifica)</button>
            </div>
            <span id="bold">VIA:</span>
            <span><%=usr.getIndirizzo()%></span>
            <br />
           
    
            <br />
          </div>
             <div id="ModalIndirizzo" class="modal">
              <!-- Modal content -->
              <div class="modal-content">
                <span class="close">&times;</span>
                <form name="modifica-campi" onsubmit="formValidateIndirizzo(event)" method="post" action="user?action=updateIndirizzo">
                                <input hidden="true" id="id" name="id" type="text" value="<%=usr.getId()%>" />
                
                  <label for="fname">Indirizzo:</label><br />
                  <input type="text" id="indirizzo" name="indirizzo" value="<%=usr.getIndirizzo()%>" /><br />
                

                  <button class="btn" type="submit" value="Submit">Aggiorna</button>
                </form>
              </div>
            </div>

          <div class="user-cards">
            <div class="title">
              <img src="icons/card.svg" alt="" />
              <h3>Metodi di pagamento</h3>
              <button>(modifica)</button>
            </div>
            <div class="card-title">
              <span id="bold">CARTA DI CREDITO</span>
              <a href="#"><img id="trash" src="icons/trash.svg" alt="" /></a>
            </div>
            <span>5333 4546 7342 8999</span>
          </div>
        </div>
      </div>

      <div class="order-container">
        <div class="order-header">
          <h2>Ordini recenti</h2>
        </div>
        <div class="order-table">
          <table title="dettagli ordine">
            <tr>
              <th>ID</th>
              <th>Oggetto</th>
              <th>Prezzo</th>
              <th>Stato</th>
              <th>Data ordine</th>
              <th>Fattura</th>
              
            </tr>

<%
			if (ordini != null && ordini.size() != 0) {
				Iterator<?> it = ordini.iterator();
				while (it.hasNext()) {
					OrderBean bean = (OrderBean) it.next();
		%>
            <tr>
           
              <td id="id"><%=bean.getIdOrdine()%></td>
              <td id="nome"><%=bean.getPb().getName()%></td>
              <td id="prezzo"><%=bean.getPrezzo()%></td>
              <td id="status">Spedito</td>
              <td><%=bean.getData()%></td>
              <td>
                <button onclick="fattura('<%=bean.getPb().getName()%>','<%=bean.getPrezzo()%>')" id="btnFatt">Scarica</button>
              </td>
            </tr>
            <%
				}
			} 
		%>

       
          </table>
        </div>
      </div>
    </div>
  </body>
</html>
