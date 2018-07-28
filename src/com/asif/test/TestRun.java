package com.asif.test;

import java.sql.SQLException;

import com.asif.dao.TransactionDao;

public class TestRun {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		TransactionDao transaction = new TransactionDao();
		transaction.setUserName("as");
		
		Test test = new Test();
		test.readData(transaction);
		
//		Test2 test2 = new Test2();
//		test2.readData(transaction);

	}

}
