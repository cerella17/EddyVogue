package eddy.vogue.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.mysql.cj.jdbc.Blob;

public class ProductDao implements ProductModel {

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/eddyvogue");

		} catch (NamingException e) 
		
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
	
	public byte[] getProductImageById(int id) throws SQLException {
		Connection c = null;
		PreparedStatement p = null;

		byte[] bytes = null;

		String query = "SELECT Foto FROM Prodotto WHERE ID_PRODOTTO = ?";
		try {
			c = ds.getConnection();
			p = c.prepareStatement(query);
			p.setInt(1, id);
			ResultSet rs = p.executeQuery();
			if (rs.next()) {
				bytes = rs.getBytes("Foto");
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
		

		return bytes;
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

		Collection<ProductBean> products = new LinkedList<>();

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
				bean.setTipologia(rs.getString("Tipologia"));
				bean.setGenere(rs.getString("Genere"));
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
	
	@Override
	public synchronized Collection<ProductBean> doRetrieveMan(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<>();

		String selectSQL = "SELECT * FROM " + ProductDao.TABLE_NAME +" WHERE Genere='UOMO'";

		

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCode(rs.getInt("ID_Prodotto"));
				bean.setName(rs.getString("Nome"));
				bean.setTipologia(rs.getString("Tipologia"));
				bean.setGenere(rs.getString("Genere"));
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


@Override
public synchronized Collection<ProductBean> doRetrieveWMan(String order) throws SQLException {
	Connection connection = null;
	PreparedStatement preparedStatement = null;

	Collection<ProductBean> products = new LinkedList<>();

	String selectSQL = "SELECT * FROM " + ProductDao.TABLE_NAME +" WHERE Genere='DONNA'";

	

	try {
		connection = ds.getConnection();
		preparedStatement = connection.prepareStatement(selectSQL);

		ResultSet rs = preparedStatement.executeQuery();

		while (rs.next()) {
			ProductBean bean = new ProductBean();

			bean.setCode(rs.getInt("ID_Prodotto"));
			bean.setName(rs.getString("Nome"));
			bean.setTipologia(rs.getString("Tipologia"));
			bean.setGenere(rs.getString("Genere"));
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
public List<ProductBean> getSearchProducts(String search) throws SQLException {
	Connection c = null;
	PreparedStatement p = null;
	List<ProductBean> products = new ArrayList<>();
	
	String query = "SELECT * FROM "+ProductDao.TABLE_NAME 
			+ " WHERE nome LIKE ? "
			+ " LIMIT 5"; 
	
	try {
		c = ds.getConnection();
		p = c.prepareStatement(query);
		
		p.setString(1, '%'+search+'%');

		ResultSet rs = p.executeQuery();
		while (rs.next()) {
			ProductBean bean = new ProductBean();
			bean.setCode(rs.getInt("ID_Prodotto"));
			bean.setName(rs.getString("Nome"));
			bean.setTipologia(rs.getString("Tipologia"));
			bean.setGenere(rs.getString("Genere"));
			bean.setDescription(rs.getString("Descrizione"));
			bean.setPrice(rs.getInt("Prezzo"));
			bean.setQuantity(rs.getInt("Quantita"));
			products.add(bean);
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
	return products;
}

}


