package com.asif.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.asif.utility.ConnectionProvider;

public class PinChange {
	private Connection con;
	
	public PinChange() {
		con = ConnectionProvider.getConnection();
	}
	
	public int pinChange(User user) throws SQLException{
		int a = 0;
		
		String userName = user.getUserName();
		//int newPin = 0;
		
		String sql = "update user set pin_number=? where user_name ='" + userName+ "' ";
		PreparedStatement ps = con.prepareStatement(sql);
		
		
		ps.setString(1, user.getPinNumber());
		
		a = ps.executeUpdate();
		
		return a;
	}
}
