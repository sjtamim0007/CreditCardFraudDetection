package com.asif.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import com.asif.dao.TransactionDao;
import com.asif.kmeans.kMeans;
import com.asif.utility.ConnectionProvider;

public class Test {
	private Connection conn;
	
	public Test() {
		conn = ConnectionProvider.getConnection();
	}
	
	public void readData(TransactionDao transaction) throws SQLException {
		Vector<Double> list = new Vector<>();
		double[] list2 = new double[10];
		
		String userName = transaction.getUserName();
		double transactionAmount;
		
		Statement smt = conn.createStatement();
		
		String sql = "SELECT transaction_id, transaction_amount \r\n" + 
				"FROM transaction where userName='"+userName+"' \r\n" + 
				"ORDER BY transaction_id DESC \r\n" + 
				"LIMIT 10";
		//String sql="select transaction_amount from transaction where(userName='" + userName + "'); order by transaction_id desc";
		//ResultSet rs = smt.executeQuery("select transaction_amount from transaction where (userName='" + userName + "'); ");
		
		
		ResultSet rs = smt.executeQuery(sql);
		
		int i=0;
		
		while(rs.next()) {
			transactionAmount = rs.getDouble("transaction_amount");
			list2[i] = transactionAmount;
			i++;
		}
		
//		ResultSet rs2 = smt.executeQuery("select transaction_amount from transaction order by transaction_id desc limit 10");
//		
//		int j=0;
//		
//		while(rs2.next()) {
//			transactionAmount = rs2.getDouble("transaction_amount");
//			list2[j] = transactionAmount;
//			j++;
//		}
		
		for(double d: list2) {
			System.out.println(d);
		}
	}
	
	public static void main(String[] args) {

        kMeans km = new kMeans(3, "input1.txt");

        try {
            //System.out.println("before read data");
            //km.readData();
        } catch (Exception e) {
            System.err.println(e);
            System.exit(-1);
        }

        km.runKMeans();
        km.outputProcessor();
        System.out.println("ur clustering is successful" + km);
        //System.out.println("get cluster mean "+km.getCluster(0).getMean());

    }
	
}





