package com.asif.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.asif.dao.User;
import com.asif.utility.ConnectionProvider;

public class UserRegistration {
	private Connection conn;
	
	public UserRegistration() {
		conn =ConnectionProvider.getConnection();
	}
	
	public int addUserInfo(User user) throws SQLException {
		int a = 0;
		
		String sql = "insert into user"
				+ "(first_name,last_name,user_name,email,password,pin_number,mobile,date_of_birth,"
				+ "marital_status,gender,current_address,parmanent_address,city,nationality,"
				+ "profession,card_type,security_question1,security_question2) "
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, user.getFirstName());
		ps.setString(2, user.getLastName());
		ps.setString(3, user.getUserName());
		ps.setString(4, user.getEmail());
		ps.setString(5, user.getPassword());
		ps.setString(6, user.getPinNumber());
		ps.setString(7, user.getMobileNumber());
		ps.setString(8, user.getDateOfBirth());
		ps.setString(9, user.getMaritalStatus());
		ps.setString(10, user.getGender());
		ps.setString(11, user.getCurrentAddress());
		ps.setString(12, user.getParmanentAddress());
		ps.setString(13, user.getCity());
		ps.setString(14, user.getNationality());
		ps.setString(15, user.getProfession());
		ps.setString(16, user.getCard_type());
		ps.setString(17, user.getQuestion1());
		ps.setString(18, user.getQuestion2());
		
		a = ps.executeUpdate();
		return a;
		//ps.execute();
		
	}
}
