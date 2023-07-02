package eddy.vogue.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<ProductBean> products;
	
	public Cart() {
		products = new ArrayList<>();
	}
	
	public void addProduct(ProductBean product) {
	
		for(ProductBean prod : products) {
			if(prod.getCode() == product.getCode()) {
				prod.setQuantitaAcquisto(prod.getQuantitaAcquisto()+1);
				return ;
			}
		}
		
		products.add(product); 
	}
	
	public void addQuant(ProductBean product,int quantita) {
		
		for(ProductBean prod : products) {
			if(prod.getCode() == product.getCode()) {
				prod.setQuantitaAcquisto(quantita);
				return ;
			}
		}
		
		products.add(product); 
	}
	
	public void deleteProduct(ProductBean product) {
		for(ProductBean prod : products) {
			if(prod.getCode() == product.getCode()) {
				products.remove(prod);
				break;
			}
		}
 	}
	
	public List<ProductBean> getProducts() {
		return  products;
	}
}
