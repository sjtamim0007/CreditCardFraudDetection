package com.asif.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.asif.dao.User;
import com.asif.utility.ConnectionProvider;

public class AccountDetails {
	private Connection con;
	public AccountDetails() {
		con = ConnectionProvider.getConnection();
	}
	
	public List<User> getAccountDetails(User user) throws SQLException{
		List<User> details = new ArrayList<>();
		String userName = user.getUserName();
		PreparedStatement ps = con.prepareStatement("select first_name,last_name,email from user where user_name ='"+userName+"'");
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			User user2 = new User();
			user2.setFirstName(rs.getString("first_name"));
			user2.setLastName(rs.getString("last_name"));
			user2.setEmail(rs.getString("email"));
			details.add(user2);
		}
		
		return details;
	}
}
