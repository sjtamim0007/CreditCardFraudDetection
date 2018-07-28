package com.asif.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	public static Connection conn = null;
	
	public static Connection getConnection() {
		if(conn != null) {
			return conn;
		}
		else {
			try {
				String driver ="com.mysql.jdbc.Driver";
				String url = "jdbc:mysql://localhost:3306/credit_card";
				String user = "asif";
				String password = "1234";
				Class.forName(driver);
				conn = DriverManager.getConnection(url, user, password);
			}
			catch(ClassNotFoundException ex) {
				System.out.println(ex);
			}catch(SQLException ex) {
				System.out.println(ex);
			}
		}
		return conn;
	}
}
