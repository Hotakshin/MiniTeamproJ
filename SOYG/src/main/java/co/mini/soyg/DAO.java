package co.mini.soyg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@soyg2.cyjec66chjxh.ap-northeast-2.rds.amazonaws.com:1521:SOYG2";
	private String user = "SOYG2";
	private String passwd = "SOYG1234";
	public Connection conn;

	public DAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, passwd);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
