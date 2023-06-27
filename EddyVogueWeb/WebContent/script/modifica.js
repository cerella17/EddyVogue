
window.onload = ()=>{
// Get the modal
let modalProfile = document.getElementById("ModalProfile");
let modalIndirizzo = document.getElementById("ModalIndirizzo");

// Get the button that opens the modal
let btnprofilo = document.getElementById("modifica-profilo");
let btnindirizzo = document.getElementById("modifica-indirizzo");
// Get the <span> element that closes the modal
let spanProfilo = document.getElementsByClassName("close")[0];
let spanIndirizzo = document.getElementsByClassName("close")[1];

// When the user clicks the button, open the modal
btnprofilo.onclick = function () {
  modalProfile.style.display = "block";
};
btnindirizzo.onclick = function () {
  modalIndirizzo.style.display = "block";
};
// When the user clicks on <span> (x), close the modal
spanProfilo.onclick = function () {
  modalProfile.style.display = "none";
};
spanIndirizzo.onclick = function () {
  modalIndirizzo.style.display = "none";
};

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
  if (event.target == modalProfile) {
    modalProfile.style.display = "none";
  }
};
window.onclick = function (event) {
  if (event.target == modalIndirizzo) {
    modalIndirizzo.style.display = "none";
  }
};
}
