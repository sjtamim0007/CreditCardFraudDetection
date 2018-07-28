package com.asif.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.asif.dao.User;
import com.asif.utility.ConnectionProvider;

public class ATMPinCodeMatcher {
	private Connection conn;
	
	public ATMPinCodeMatcher() {
		conn = ConnectionProvider.getConnection();
	}
	
	public boolean pinValidate(User user) throws SQLException {
		String userName = user.getUserName();
		String pinCode = user.getPinNumber();
		
		PreparedStatement ps = conn.prepareStatement("select user_name,pin_number from user where user_name=? and pin_number=?");
		ps.setString(1, userName);
		ps.setString(2, pinCode);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			String dbUserName = rs.getString("user_name");
			String dbPinCode = rs.getString("pin_number");
			
			if(dbUserName.equals(userName) && dbPinCode.equals(pinCode)) {
				return true;
			}
		}
		
		return false;
	}
	
	public void updatePinCode(User user) {
		String userName = user.getUserName();
		String pinMatch = user.getPinNumber();
		
		
	}
}

