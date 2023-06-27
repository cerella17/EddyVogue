$(document).ready(() => {
	//ajax
	function updateProducts() {
		$.post("AjaxSearchController", { "search": $("#searchbar input").val() }, function (data) {
			if (!data.error) {
				if(data.products && data.products.length > 0){
					let ul = document.querySelector(".searchbar-ajax ul");
					document.querySelector(".searchbar-ajax").style.display = "block";
					document.querySelector(".searchbar-ajax ul").innerHTML = "";
					data.products.forEach((d) => {
						let li = document.createElement("li");
						li.textContent = d.name;
						li.onclick = function () { 
							window.location.replace("Prodotto.jsp?id=" + d.code);
						};
						ul.append(li);
					})
				}
			}
		});
	}
	$("#searchbar input").on("input", () => {
		let val = $("#searchbar input").val();
		if (val == null || val == "") {
			document.querySelector(".searchbar-ajax").style.display = "none";
		} else {
			updateProducts()
		}
	});
})