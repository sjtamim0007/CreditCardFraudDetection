package com.asif.hmm;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.asif.dao.TransactionDao;
//import com.asif.kmeans.*;
import com.asif.kmeans.Clustering;

/**
 *
 * @author asif sadi
 */
public class Main {

    public static void main(String args[]) {

    	int noOfClusters = 3;
        int noOfStates = 6;
        //String fileName = "input1.txt";
        TransactionDao transaction = new TransactionDao();
    	transaction.setUserName("as");
        //kMeans km = new kMeans(noOfClusters);
    	Clustering km = new Clustering(noOfClusters);

        try {
            System.out.println("before read data");
            km.readData(transaction);
        } catch (SQLException e) {
            //System.err.println(e);
        	e.printStackTrace();
            System.exit(-1);
        }

        //km.runKMeans();
        //km.outputProcessor();
        //System.out.println("Clustering done \n" + km);


        //  Initializing the HMM
        HMM hmm = new HMM(noOfStates, noOfClusters);
        hmm.initializeHMM();
              
        try {
            hmm.train(hmm.readFile(), 100);
            hmm.print();
        } catch (IOException ex) {
        }
        // Detection Phase starts
        Detector detector = new Detector(hmm);
        detector.setThreshold(0.4);
        double alpha = 0;
        try {
        alpha = detector.calculateAlpha(30000, km);
        } catch (IOException ex) {
        Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    

       /* double customerprofile[] = km.customerProfile(hmm);
        System.out.print("this is our customer profile  " + "<");
        for (int i = 0; i < customerprofile.length; i++) {
            System.out.print(customerprofile[i] + ",");
        }
        System.out.println(">");*/

        km.commit(detector.fraudEvaluation(alpha));


    }
    
}