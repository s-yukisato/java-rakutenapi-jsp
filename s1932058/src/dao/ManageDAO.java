package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ManageDAO {
	static {
		try {
			Class.forName("org.h2.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean insert(String id, String title, String author, String publisher, int price, String imageUrl, String comment,
			int evaluation, String state, String purchaseStore, String purchaseDate) {
		String url = "jdbc:h2:tcp://localhost/c:/pleiades/h2/s1932058";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, "user", "pass");
			String sql = "INSERT INTO MANAGE"
					+ "(id, title, author, publisher, price, imageUrl, comment, evaluation, nowstate, purchaseStore, purchaseDate) "
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pre = conn.prepareStatement(sql);
			pre.setString(1, id);
			pre.setString(2, title);
			pre.setString(3, author);
			pre.setString(4, publisher);
			pre.setInt(5, price);
			pre.setString(6, imageUrl);
			pre.setString(7, comment);
			pre.setInt(8,evaluation );
			pre.setString(9, state);
			pre.setString(10, purchaseStore);
			pre.setString(11, purchaseDate);
			int result = pre.executeUpdate();
			if (result == 1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}
}