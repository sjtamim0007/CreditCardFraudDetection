package com.asif.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.asif.dao.TransactionDao;
import com.asif.utility.ConnectionProvider;

public class Test2 {
private Connection conn;
	
	public Test2() {
		conn = ConnectionProvider.getConnection();
	}
	
	public void readData(TransactionDao transaction) throws SQLException {
		Map<String, Double> list = new HashMap<>();
		double[] list2 = new double[10];
		
		String userName = transaction.getUserName();
		double transactionAmount;
		
		String sql = "SELECT transaction_amount \r\n" + 
				"FROM transaction where userName=? \r\n" + 
				"ORDER BY transaction_id DESC \r\n" + 
				"LIMIT 10";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, userName);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			String dbUserName = rs.getString(1);
			double transactionAm = rs.getDouble("transaction_amount");
			list.put(dbUserName, transactionAm);
		}
		System.out.println(list);
	}
}