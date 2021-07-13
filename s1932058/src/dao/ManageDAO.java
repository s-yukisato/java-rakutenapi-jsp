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

	public boolean insert(int id, String name) {
		String url = "jdbc:h2:tcp://localhost/c:/pleiades/h2/s1932058";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, "user", "pass");
			String sql = "INSERT INTO test(id, name) VALUES(?,?)";
			PreparedStatement pre = conn.prepareStatement(sql);
			pre.setInt(1, id);
			pre.setString(2, name);
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