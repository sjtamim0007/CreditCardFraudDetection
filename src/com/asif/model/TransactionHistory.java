package com.asif.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.asif.dao.TransactionDao;
import com.asif.utility.ConnectionProvider;

public class TransactionHistory {
	private Connection con;

	public TransactionHistory() {
		con = ConnectionProvider.getConnection();
	}

	public List<TransactionDao> getTransactionHistory(TransactionDao transaction) throws SQLException {
		String userName = transaction.getUserName();
		List<TransactionDao> transactionHistory = new ArrayList<>();
		Statement smt = con.createStatement();
		String sql = "SELECT userName, transaction_amount " + "FROM transaction where userName='" + userName + "' ";
		ResultSet rs = smt.executeQuery(sql);
		while (rs.next()) {
			TransactionDao dao = new TransactionDao();
			dao.setUserName(rs.getString("userName"));
			dao.setTransactionAmount(rs.getDouble("transaction_amount"));
			transactionHistory.add(dao);
		}
		return transactionHistory;
	}
}
