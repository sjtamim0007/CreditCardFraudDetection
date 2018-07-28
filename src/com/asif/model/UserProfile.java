package com.asif.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.asif.dao.User;
import com.asif.utility.ConnectionProvider;

public class UserProfile {
	private Connection con;
	public UserProfile() {
		con = ConnectionProvider.getConnection();
	}
	
	public int userProfile(User user)throws SQLException {
		int a = 0;
		String userName = user.getUserName();
		
		String sql = "select * from user where user_name='" + userName +"'";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, userName);
		
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			user.setUserName( rs.getString("user_name"));
			user.setFirstName( rs.getString("first_name"));
			user.setLastName( rs.getString("last_name"));
			user.setMobileNumber( rs.getString("mobile"));
		}
		
		return a;
	}
}
