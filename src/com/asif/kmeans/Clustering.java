package com.asif.kmeans;

import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collection;
import java.util.Collections;
import java.util.Vector;

import com.asif.dao.TransactionDao;
import com.asif.hmm.HMM;
import com.asif.kmeans.cluster;
import com.asif.kmeans.kMeans;
import com.asif.kmeans.kMeansPoint;
import com.asif.utility.ConnectionProvider;

public class Clustering {
	// Number of clusters
	private int k;
	// Array of clusters
	private cluster[] clusters;
	// Number of iterations
	private int nIterations;
	// Vector of data points
	private Vector<kMeansPoint> kMeansPoints;
	// Copy of Vector of data points
	private Vector<kMeansPoint> kMeansPointsClone;
	// Name of the input file
	private String inputFileName;
	// Name of cluster output file
	private String clusterResultFileName;

	public String getInputFileName() {
		return inputFileName;
	}

	public void setInputFileName(String inputFileName) {
		this.inputFileName = inputFileName;
	}

	public Clustering(int k) {
		this.k = k;
		this.clusterResultFileName = "clusterResult.txt";
		this.clusters = new cluster[this.k];
		this.nIterations = 0;
		this.kMeansPoints = new Vector<kMeansPoint>();
		this.kMeansPointsClone = new Vector<kMeansPoint>();
	}

	public static void main(String args[]) {

		int noOfClusters = 3;
		int noOfStates = 6;
		// String fileName = "input1.txt";
		// kMeans km = new kMeans(noOfClusters);
		Clustering cluster = new Clustering(noOfClusters);

		TransactionDao transaction = new TransactionDao();
		transaction.setUserName("as");
		try {
			// System.out.println("before read data");
			cluster.readData(transaction);
		} catch (Exception e) {
			System.err.println(e);
			System.exit(-1);
		}
		cluster.newTransactionModf(8500);
	}

	public void readData(TransactionDao transaction) throws SQLException {
		Connection conn = ConnectionProvider.getConnection();

		String userName = transaction.getUserName();
		int transactionAmount;

		Statement smt = conn.createStatement();

		String sql = "SELECT transaction_id, transaction_amount \r\n" + "FROM transaction where userName='" + userName
				+ "' \r\n" + "ORDER BY transaction_id DESC \r\n" + "LIMIT 10";

		ResultSet rs = smt.executeQuery(sql);

		kMeansPoints.setSize(10);

		int i = 0;

		while (rs.next()) {
			transactionAmount = rs.getInt("transaction_amount");
			if (transactionAmount > 0 && transactionAmount < 5999) {
				kMeansPoint dp = new kMeansPoint(1, transactionAmount);
				dp.assignToCluster(0);
				this.kMeansPoints.set(i, dp);
				i++;
			}

			else if (transactionAmount > 5999 && transactionAmount < 10999) {
				kMeansPoint dp = new kMeansPoint(1, transactionAmount);
				dp.assignToCluster(1);
				this.kMeansPoints.set(i, dp);
				i++;
			} else if (transactionAmount > 10999 && transactionAmount < 40001) {
				kMeansPoint dp = new kMeansPoint(1, transactionAmount);
				dp.assignToCluster(2);
				this.kMeansPoints.set(i, dp);
				i++;
			}
		}
		Collections.reverse(kMeansPoints);

		System.out.println("kMeansPoints " + kMeansPoints);
		fileWrite(clusterResultFileName, 0);

	}

	public void newTransactionModf(double transactionAmount) {
		int i = 9;
		//int rule[] = new int[this.k];
		kMeansPointsClone.setSize(kMeansPoints.size());

		for (i = 0; i < kMeansPoints.size(); i++) {

			kMeansPointsClone.setElementAt(new kMeansPoint(1, kMeansPoints.get(i).getY()), i);
			kMeansPointsClone.get(i).assignToCluster(kMeansPoints.get(i).getClusterNumber());
		}

		for (i = 0; i < (kMeansPoints.size() - 1); i++) {
			kMeansPoints.set(i, kMeansPoints.get(i + 1));
			kMeansPoints.get(i).assignToCluster(kMeansPoints.get(i).getClusterNumber());
		}
		
		

		kMeansPoints.set(i, new kMeansPoint(1, transactionAmount));
		defineCluster(transactionAmount);
		fileWrite(clusterResultFileName, 0);
		System.out.println("after insert: "+kMeansPoints);
	}
	
	public void defineCluster(double transactionAmount) {
		int i = 9;
		if (transactionAmount > 0 && transactionAmount < 5999) {
			kMeansPoint dp = new kMeansPoint(1, transactionAmount);
			dp.assignToCluster(0);
			this.kMeansPoints.set(i, dp);
			//i++;
		}

		else if (transactionAmount > 5999 && transactionAmount < 10999) {
			kMeansPoint dp = new kMeansPoint(1, transactionAmount);
			dp.assignToCluster(1);
			this.kMeansPoints.set(i, dp);
			//i++;
		} else if (transactionAmount > 10999 && transactionAmount < 800001) {
			kMeansPoint dp = new kMeansPoint(1, transactionAmount);
			dp.assignToCluster(2);
			this.kMeansPoints.set(i, dp);
			//i++;
		}
	}
	
	public void fileWrite(String fileName, int typeOfWrite) {
        String itemToWrite = null;
        try {
            FileWriter out = new FileWriter(fileName);
            out.write(" ");
            //type of cluster = 0 for cluster number
            if (typeOfWrite == 0) {
                for (int i = 0; i < kMeansPoints.size(); i++) {
                    int clstr = kMeansPoints.get(i).getClusterNumber();
                    itemToWrite = Integer.toString(clstr);
                    out.write(itemToWrite);
                    out.write(" ");

                }
            } //type of write = 1 for value Y
            else {
                for (int i = 0; i < kMeansPoints.size(); i++) {
                    int clstr = (int) kMeansPoints.get(i).getY();
                    itemToWrite = Integer.toString(clstr);
                    out.write(itemToWrite);
                    out.write(" ");
                }
            }
            out.flush();
        } catch (IOException e) {
            System.err.println(e);
            System.exit(-1);
        }
    }
	
	public double[] customerProfile(HMM hmm) {

        double customerprofile[] = new double[hmm.sigmaSize];
        for (int i = 0; i < kMeansPoints.size(); i++) {
            int j = kMeansPoints.get(i).getClusterNumber();
            customerprofile[j]++;
        }
        for (int i = 0; i < hmm.sigmaSize; i++) {
            customerprofile[i] = (customerprofile[i] / kMeansPoints.size()) * 100;
        }
        return customerprofile;

    }
	public void commit(boolean bool) {
        //System.out.println("\nvalue of boolean "+bool);
        if (bool) {
            System.out.println("There is a Fraud !!!");
            for (int i = 0; i < kMeansPoints.size(); i++) {
                kMeansPoints.set(i, kMeansPointsClone.get(i));
            }
            fileWrite(clusterResultFileName, 0);
        } else {
            System.out.println("There is no Fraud !!!");
            //fileWrite(inputFileName, 1);
        }

    }
}
