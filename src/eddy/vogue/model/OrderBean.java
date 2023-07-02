package eddy.vogue.model;

import java.io.Serializable;

public class OrderBean implements Serializable {
	private static final long serialVersionUID = 1L;

	private ProductBean pb;
	private String data;
	private String indirizzo;
	private int id_utente;
	private int id_ordine;
	private String prezzo;


	
	public OrderBean(ProductBean pb, String data, String indirizzo, int id_utente) {
		this.pb = pb;
		this.data = data;
		this.indirizzo = indirizzo;
		this.id_utente=id_utente;

	}
	public OrderBean(ProductBean pb, String data, String indirizzo, int id_utente,int id_ordine,String prezzo) {
		this.pb = pb;
		this.data = data;
		this.indirizzo = indirizzo;
		this.id_utente=id_utente;
		this.id_ordine=id_ordine;
		this.prezzo=prezzo;

	}

	public ProductBean getPb() {
		return pb;
	}

	public void setPb(ProductBean pb) {
		this.pb = pb;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
	public String getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(String prezzo) {
		this.prezzo = prezzo;
	}
	
	public int getIdUtente() {
		return id_utente;
	}
	public int getIdOrdine() {
		return id_ordine;
	}

	public void setIdUtente(int id_utente) {
		this.id_utente = id_utente;
	}
	public void setIdOrdine(int id_ordine) {
		this.id_ordine = id_ordine;
	}

}