package com.asif.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.asif.dao.User;
import com.asif.utility.ConnectionProvider;

public class BalanceCheck {
	private Connection con;



	public BalanceCheck() {

		con = ConnectionProvider.getConnection();

	}

	
public double balanceCheck(User user) throws SQLException{

		String userName = user.getUserName();

		double balance = 0;

		
Statement smt = con.createStatement();

		
String sql = "SELECT user_name, balance " + "FROM user where user_name='" + userName+ "' ";

		/*
		PreparedStatement ps = con.prepareStatement("select user_name,balance from user where user_name=? and balance=?");

		ps.setString(1, userName);

		ps.setDouble(2, balance);*/

		ResultSet rs = smt.executeQuery(sql);


		while(rs.next()) {

			String dbUserName = rs.getString("user_name");

			double dbBalance = rs.getDouble("balance");

			if(dbUserName.equals(userName)) {

				balance = dbBalance;

			}


		}
	
	
		return balance;

	}


}
