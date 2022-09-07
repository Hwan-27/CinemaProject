package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBcon {
	private static Connection conn = null;
	private String url = "jdbc:oracle:thin:@localhost:1521/xe";
	private String uid = "green01";
	private String upw = "1234";

	private DBcon() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, uid, upw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		if (conn == null) {
			new DBcon();
		}
		return conn;
	}
}
