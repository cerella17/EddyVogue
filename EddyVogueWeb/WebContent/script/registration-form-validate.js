window.onload = ()=>{// Funzione di validazione del modulo
function formValidate(event) {
  event.preventDefault(); // Blocca l'invio del modulo
  // Recupera gli elementi del modulo

  let email = document.getElementById("email");
  let nome = document.getElementById("nome");
  let cognome = document.getElementById("cognome");
  let indirizzo = document.getElementById("indirizzo");
  let citta = document.getElementById("citta");
  let provincia = document.getElementById("provincia");
  let cap = document.getElementById("CAP");
  let pass = document.getElementById("pass");
  let isValid = true;

  // Esegue la validazione di ogni campo e tiene traccia del risultato complessivo
  isValid = email_validate(email, "email-error") && isValid;
  isValid = pass_validate(pass, 7, 15, "pass-error") && isValid;
  isValid = allLetter(nome, "nome-error", "nome") && isValid;
  isValid = allLetter(cognome, "cognome-error", "cognome") && isValid;
  isValid = allLetter(citta, "citta-error", "citta") && isValid;
  isValid = allLetter(provincia, "provincia-error", "provincia") && isValid;
  isValid = alphanumeric(cap, "cap-error", "cap") && isValid;
  isValid = alphanumeric(indirizzo, "indirizzo-error", "indirizzo") && isValid;

  // Se ci sono errori, impedisce l'invio del modulo
  if (!isValid) {
    return isValid;
  }
  return isValid;
}
function formValidateProfilo(event) {
  event.preventDefault(); // Blocca l'invio del modulo
  // Recupera gli elementi del modulo

  let email = document.getElementById("email");
  let nome = document.getElementById("nome");
  let cognome = document.getElementById("cognome");

  let isValid = true;

  // Esegue la validazione di ogni campo e tiene traccia del risultato complessivo
  isValid = email_validate(email, "email-error") && isValid;
  isValid = allLetter(nome, "nome-error", "nome") && isValid;
  isValid = allLetter(cognome, "cognome-error", "cognome") && isValid;

  // Se ci sono errori, impedisce l'invio del modulo
  if (!isValid) {
    return isValid;
  }
  return isValid;
}
function formValidateIndirizzo(event) {
  event.preventDefault(); // Blocca l'invio del modulo
  // Recupera gli elementi del modulo
  let indirizzo = document.getElementById("indirizzo");
  let citta = document.getElementById("citta");
  let provincia = document.getElementById("provincia");
  let cap = document.getElementById("CAP");
  let isValid = true;
  // Esegue la validazione di ogni campo e tiene traccia del risultato complessivo
  isValid = alphanumeric(indirizzo, "indirizzo-error", "indirizzo") && isValid;
  isValid = allLetter(citta, "citta-error", "citta") && isValid;
  isValid = allLetter(provincia, "provincia-error", "provincia") && isValid;
  isValid = alphanumeric(cap, "cap-error", "cap") && isValid;

  // Se ci sono errori, impedisce l'invio del modulo
  if (!isValid) {
    return isValid;
  }
  return isValid;
}
// Funzione di validazione dell'email
function email_validate(email, errorId) {
  let valuemail = email.value;
  let atpos = valuemail.indexOf("@");
  let dotpos = valuemail.lastIndexOf(".");
  let emailError = document.getElementById(errorId);

  // Verifica se l'email è valida
  if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= valuemail.length) {
    // Mostra il messaggio di errore e aggiunge la classe di stile 'error-field'
    emailError.textContent = "Email non valida";
    emailError.style.display = "block";
    email.classList.add("error-field");
    return false;
  } else {
    // Nasconde il messaggio di errore e rimuove la classe di stile 'error-field'
    emailError.style.display = "none";
    email.classList.remove("error-field");

    // Aggiunge un gestore di eventi per l'evento "input" sul campo email per nascondere il messaggio di errore
    email.addEventListener("input", function () {
      hideErrorMessage(errorId);
    });

    return true;
  }
}

// Funzione di validazione alfanumerica
function alphanumeric(parametro, errorId, campo) {
  var alpha = /^[0-9a-zA-Z]+$/; // Espressione regolare per verificare solo caratteri alfanumerici
  var parameterError = document.getElementById(errorId);

  // Verifica se il parametro contiene solo caratteri alfanumerici
  if (parametro.value.match(alpha)) {
    // Aggiunge un gestore di eventi per l'evento "input" sul campo parametro per nascondere il messaggio di errore
    parametro.addEventListener("input", function () {
      hideErrorMessage(errorId);
    });

    return true;
  } else {
    // Mostra il messaggio di errore e aggiunge la classe di stile 'error-field'
    parameterError.textContent = campo + " non valido";
    parameterError.style.display = "inline";
    parametro.classList.add("error-field");
    parametro.focus();
    return false;
  }
}

// Funzione di validazione solo per lettere
function allLetter(parametro, errorId, campo) {
  var caratteri = /^[a-zA-Z]+$/; // Espressione regolare per verificare solo lettere
  var parameterError = document.getElementById(errorId);

  // Verifica se il parametro contiene solo lettere
  if (parametro.value.match(caratteri)) {
    // Aggiunge un gestore di eventi per l'evento "input" sul campo parametro per nascondere il messaggio di errore
    parametro.addEventListener("input", function () {
      hideErrorMessage(errorId);
    });

    return true;
  } else {
    // Mostra il messaggio di errore e aggiunge la classe di stile 'error-field'
    parameterError.textContent = campo + " non valido";
    parameterError.style.display = "inline";
    parametro.classList.add("error-field");
    parametro.focus();
    return false;
  }
}

// Funzione di validazione della password
function pass_validate(pass, mx, my, errorId) {
  var pass_len = pass.value.length;
  var passError = document.getElementById(errorId);

  // Verifica se la lunghezza della password è valida
  if (pass_len == 0 || pass_len >= my || pass_len < mx) {
    // Mostra il messaggio di errore e aggiunge la classe di stile 'error-field'
    passError.textContent = "Password non valida";
    passError.style.display = "inline";
    pass.classList.add("error-field");
    pass.focus();
    return false;
  } else {
    // Nasconde il messaggio di errore e rimuove la classe di stile 'error-field'
    passError.style.display = "none";
    pass.classList.remove("error-field");

    // Aggiunge un gestore di eventi per l'evento "input" sul campo pass per nascondere il messaggio di errore
    pass.addEventListener("input", function () {
      hideErrorMessage(errorId);
    });

    return true;
  }
}

// Funzione per nascondere il messaggio di errore
function hideErrorMessage(errorId) {
  var errorElement = document.getElementById(errorId);
  errorElement.style.display = "none";
}
}
