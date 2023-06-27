window.onload=()=>{
var doc = new jsPDF()




function fattura(ordine, prezzo){
	console.log("di iglio")
  doc.text(prezzo, 10, 10)
    doc.text(ordine, 10, 10)

doc.save('a4.pdf')	
}




}
