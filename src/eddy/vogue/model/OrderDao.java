package eddy.vogue.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import eddy.vogue.model.OrderBean;
import eddy.vogue.model.ProductBean;
import eddy.vogue.model.Cart;

public class OrderDao {
	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/eddyvogue");

		} catch (NamingException e) {}
		
	}
	
	private static final String TABLE_ORDINE = "Ordine";
	private static final String TABLE_PRODOTTO = "Prodotto";


	
	
	public void effettuaOrdine(List<ProductBean> cis, int id_utente, String indirizzo) throws SQLException {
		Connection c = null;
		PreparedStatement p = null;
		PreparedStatement p2 = null;

        
        String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());

        
        
        
        

		
		String query = 
				"INSERT INTO " + TABLE_ORDINE + " ( idUtente, idProdotto, data, indirizzo, dettagli, Prezzo)"
				+ " VALUES (?,?,?,?,?,?)";		
		String query2 = 
				"UPDATE " + TABLE_PRODOTTO + " SET Quantita = ? WHERE ID_Prodotto = ?";	
		
		for(int i=1;i<cis.size();i++) {
			query+=",(?,?,?,?,?,?,?)";
			query2+=",(?,?)";
		}

		try {		
			c = ds.getConnection();
			p = c.prepareStatement(query);
			p2 = c.prepareStatement(query2);
			int j=0;
	
			for(int i=0;i<cis.size();i++) {
				
				if(i!=0)j=j+6;
				int quantity = cis.get(i).getQuantity() - cis.get(i).getQuantitaAcquisto();
				p.setInt(j+1, id_utente);
				p.setInt(j+2, cis.get(i).getCode());
				p.setString(j+3, timeStamp);
				p.setString(j+4, indirizzo);
				p.setInt(j+5, cis.get(i).getQuantitaAcquisto());
				p.setString(j+6, Integer.toString(cis.get(i).getPrice()*cis.get(i).getQuantitaAcquisto())+"€");
				p2.setInt(j+1, quantity);
				p2.setInt(j+2, cis.get(i).getCode());

			}
			p.executeUpdate();
			p2.executeUpdate();
			p.close();
			
		} finally {
			try {
				if (p != null)
					p.close();
			} finally {
				if (c != null)
					c.close();
			}
		}		
	}
	
	public List<OrderBean> getOrdersFromUser(int id_utente) throws SQLException {
		Connection c = null;
		PreparedStatement p = null;
		
		List<OrderBean> pbs = new ArrayList<>();

		OrderBean ob = null;
		
		ProductBean pb = null;


		String query = 
				"SELECT id,idUtente,data,dettagli,ord.Prezzo, p.Nome,p.Descrizione,p.ID_Prodotto,indirizzo FROM eddyvogue.Ordine as ord"
				+ " INNER JOIN Prodotto as p ON p.ID_Prodotto = ord.idProdotto"
				+ " WHERE idUtente= ?";
		try {
			c = ds.getConnection();
			p = c.prepareStatement(query);
			p.setInt(1, id_utente);
			ResultSet rs = p.executeQuery();
			while (rs.next()) {
				pb = new ProductBean();
				pb.setCode(Integer.parseInt(rs.getString("ID_Prodotto")));
				pb.setName(rs.getString("Nome"));
				pb.setDescription(rs.getString("Descrizione"));
				
				ob = new OrderBean(pb,rs.getString("data"),rs.getString("indirizzo"),Integer.parseInt(rs.getString("idUtente")),Integer.parseInt(rs.getString("id")),(rs.getString("prezzo")));
				pbs.add(ob);
			}
		} finally {
			try {
				if (p != null)
					p.close();
			} finally {
				if (c != null)
					c.close();
			}
		}
		return pbs;
	}

	public List<OrderBean> getOrdrers() throws SQLException {
		Connection c = null;
		PreparedStatement p = null;
		
		List<OrderBean> pbs = new ArrayList<>();

		OrderBean ob = null;
		
		ProductBean pb = null;


		String query = 
				"SELECT id,idUtente,data,dettagli,ord.Prezzo, p.Nome,p.Descrizione,p.ID_Prodotto,indirizzo FROM eddyvogue.Ordine as ord"
				+ " INNER JOIN Prodotto as p ON p.ID_Prodotto = ord.idProdotto";
		try {
			c = ds.getConnection();
			p = c.prepareStatement(query);
			ResultSet rs = p.executeQuery();
			while (rs.next()) {
				pb = new ProductBean();
				pb.setCode(Integer.parseInt(rs.getString("ID_Prodotto")));
				pb.setName(rs.getString("Nome"));
				pb.setDescription(rs.getString("Descrizione"));
				
				ob = new OrderBean(pb,rs.getString("data"),rs.getString("indirizzo"),Integer.parseInt(rs.getString("idUtente")),Integer.parseInt(rs.getString("id")),(rs.getString("prezzo")));
				pbs.add(ob);
			}
		} finally {
			try {
				if (p != null)
					p.close();
			} finally {
				if (c != null)
					c.close();
			}
		}
		return pbs;
	}

	


}
