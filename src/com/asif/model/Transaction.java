package com.asif.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.asif.dao.TransactionDao;
import com.asif.hmm.Detector;
import com.asif.hmm.HMM;
import com.asif.hmm.Main;
import com.asif.kmeans.Clustering;
import com.asif.utility.ConnectionProvider;

public class Transaction {
	private Connection con;
	private int noOfClusters = 3;
	private int noOfStates = 6;

	public Transaction() {
		con = ConnectionProvider.getConnection();
	}

	public int transactionValidator(TransactionDao transaction) throws SQLException {

		String userName = transaction.getUserName();
		double amount = transaction.getTransactionAmount();

		Clustering km = new Clustering(noOfClusters);
		km.readData(transaction);

		HMM hmm = new HMM(noOfStates, noOfClusters);
		hmm.initializeHMM();

		try {
			hmm.train(hmm.readFile(), 100);
		} catch (IOException e) {
			e.printStackTrace();
		}

		Detector detector = new Detector(hmm);
		detector.setThreshold(0.4);

		double alpha = 0;
		try {
			alpha = detector.calculateAlpha(amount, km);
		} catch (IOException ex) {
			Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
		}

		boolean result = detector.fraudEvaluation(alpha);
		int a = 0;
		if (result) {
			a = 0;
			System.out.println("There is a fraud.");
		}

		else {
			PreparedStatement ps = con
					.prepareStatement("insert into transaction(userName,transaction_amount)" + " values(?,?)");

			ps.setString(1, transaction.getUserName());
			ps.setDouble(2, transaction.getTransactionAmount());

			a = ps.executeUpdate();
		}

		return a;

	}
	
	public int transactionComplete(TransactionDao transaction) throws SQLException{
		int a = 0;
		if( a!= 0) {
			System.out.println("Transaction not completed");
		}
		else {
			PreparedStatement ps = con.prepareStatement("insert into transaction(userName, transaction_amount)" + " values(?,?)");
			ps.setString(1, transaction.getUserName());
			ps.setDouble(2, transaction.getTransactionAmount());
			
			a = ps.executeUpdate();
		}
		return a;
	}
	
	/*private String returnQuestion() {
		String question = "";
		return question;
	}*/
}