package com.asif.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.asif.dao.User;
import com.asif.utility.ConnectionProvider;

public class Login {
	private Connection conn;
	public Login() {
		conn = ConnectionProvider.getConnection();
	}
	public boolean userLogin(User user) throws SQLException {
		String userName = user.getUserName();
		String password = user.getPassword();
		String sql = "select user_name,password from user where user_name=? and password=?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, userName);
		ps.setString(2, password);
		
		ResultSet res = ps.executeQuery();
		
		while(res.next()) {
			String dbUserName = res.getString("user_name");
			String dbPassword = res.getString("password");
			
			if(userName.equals(dbUserName) && password.equals(dbPassword)) {
				return true;
			}
		}
		
		return false;
	}
}
