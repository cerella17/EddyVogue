package eddy.vogue.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductDao implements ProductModel {

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/eddyvogue");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	private static final String TABLE_NAME = "Prodotto";

	@Override
	public synchronized void doSave(ProductBean product) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ProductDao.TABLE_NAME
				+ " (Nome, Tipologia,Descrizione, Prezzo, Quantita,Genere) VALUES (?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getName());
			preparedStatement.setString(2, product.getDescription());
			preparedStatement.setInt(3, product.getPrice());
			preparedStatement.setInt(4, product.getQuantity());

			preparedStatement.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}

	@Override
	public synchronized ProductBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		String selectSQL = "SELECT * FROM " + ProductDao.TABLE_NAME + " WHERE ID_Prodotto = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				bean.setCode(rs.getInt("ID_Prodotto"));
				bean.setName(rs.getString("Nome"));
				bean.setTipologia(rs.getString("Tipologia"));
				bean.setGenere(rs.getString("Genere"));
				bean.setDescription(rs.getString("Descrizione"));
				bean.setPrice(rs.getInt("Prezzo"));
				bean.setQuantity(rs.getInt("Quantita"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}

	@Override
	public synchronized boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ProductDao.TABLE_NAME + " WHERE ID_Prodotto = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}

	@Override
	public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductDao.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCode(rs.getInt("ID_Prodotto"));
				bean.setName(rs.getString("Nome"));
				bean.setDescription(rs.getString("Descrizione"));
				bean.setPrice(rs.getInt("Prezzo"));
				bean.setQuantity(rs.getInt("Quantita"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}
	public void effettuaOrdine(List<ProductBean> cis, int id_utente, String indirizzo) throws SQLException {
		Connection c = null;
		PreparedStatement p = null;

		String query1 = 
				"INSERT INTO " + ProductDao.TABLE_ORDINE + " (id_utente, indirizzo)"
				+ " VALUES (?,?)";
		String query2 = 
				"INSERT INTO " + ProductDao.TABLE_ORDER_ITEM + " (id_ordine, id_info_prodotto, quantita, prezzo)"
				+ " VALUES (?,?,?,?)";
		String queryDiminuisciQuantita = 
				"UPDATE " + ProductDao.TABLE_PROD_IN_VENDITA
				+ " SET quantita = quantita - ?"
				+ " WHERE id_info_prodotto = ?";
		String queryRemoveProdottiFiniti = 
				"DELETE FROM " + ProductDao.TABLE_PROD_IN_VENDITA
				+ " WHERE quantita = 0 ";
				
		
		for(int i=1;i<cis.size();i++) {
			query2+=",(?,?,?,?)";
		}

		try {
			c = ds.getConnection();
			// prendo l'id della nuova row creata
			p = c.prepareStatement(query1, Statement.RETURN_GENERATED_KEYS);
			p.setInt(1, id_utente);
			p.setString(2, indirizzo);
			p.executeUpdate();
			ResultSet rs = p.getGeneratedKeys();
			rs.next();
			int id = rs.getInt(1);
			rs.close();
			p.close();
			
			p = c.prepareStatement(query2);
			for(int i=0;i<cis.size();i++) {
				p.setInt((i*4)+1, id);
				p.setInt((i*4)+2, cis.get(i).getProductBean().getId());
				p.setInt((i*4)+3, cis.get(i).getQuantita());
				p.setDouble((i*4)+4, cis.get(i).getProductBean().getPrezzo());
				PreparedStatement p_diminuisci = c.prepareStatement(queryDiminuisciQuantita);
				p_diminuisci.setInt(1, cis.get(i).getQuantita());
				p_diminuisci.setInt(2, cis.get(i).getProductBean().getId());
				p_diminuisci.executeUpdate();
				p_diminuisci.close();
			}
			p.executeUpdate();
			p.close();
			
			p = c.prepareStatement(queryRemoveProdottiFiniti);
			p.executeUpdate();			
		} finally {
			if (c != null)
				c.close();
		}
	}		
}
