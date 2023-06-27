package eddy.vogue.model;

import java.io.Serializable;
import java.io.InputStream;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int code;
	String name;
	String description;
	String tipologia;
	String genere;
	int price;
	int quantity;
	int quantitaAcquisto;
	private InputStream immagineIS;


	public ProductBean() {
		code = -1;
		name = "";
		description = "";
		quantity = 0;
		genere = "";
		tipologia ="";
		quantitaAcquisto = 1;
	}

	public int getCode() {
		return code;
	}

	public int getQuantitaAcquisto() {
		return quantitaAcquisto;
	}

	public void setQuantitaAcquisto(int quantitaAcquisto) {
		this.quantitaAcquisto = quantitaAcquisto;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getTipologia() {
		return tipologia;
	}

	public void setTipologia(String tipologia) {
		this.tipologia = tipologia;
	}
	public String getGenere() {
		return genere;
	}

	public void setGenere(String genere) {
		this.genere = genere;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public InputStream getImmagineIS() {
		return immagineIS;
	}

	public void setImmagineIS(InputStream immagineIS) {
		this.immagineIS = immagineIS;
	}

	@Override
	public String toString() {
		return name + " (" + code + "), " + price + " " + quantity + ". " + description;
	}

}
