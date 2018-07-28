
package com.asif.kmeans;

import com.asif.dao.TransactionDao;
import com.asif.hmm.*;
import com.asif.utility.ConnectionProvider;

import java.util.*;
import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author asif sadi
 */
public class kMeans {

    // Number of clusters
    private int k;
    // Array of clusters
    private cluster[] clusters;
    //Number of iterations
    private int nIterations;
    //Vector of data points
    private Vector<kMeansPoint> kMeansPoints;
    //Copy of Vector of data points
    private Vector<kMeansPoint> kMeansPointsClone;
    //Name of the input file
    private String inputFileName;
    //Name of cluster output file
    private String clusterResultFileName;

    public String getInputFileName() {
        return inputFileName;
    }

    public void setInputFileName(String inputFileName) {
        this.inputFileName = inputFileName;
    }

    public kMeans(int k) {
        this.k = k;
        this.clusterResultFileName = "clusterResult.txt";
        this.clusters = new cluster[this.k];
        this.nIterations = 0;
        this.kMeansPoints = new Vector<kMeansPoint>();
        this.kMeansPointsClone = new Vector<kMeansPoint>();
    }

    public kMeans(int k, String inputFileName) {

        this.k = k;
        this.inputFileName = inputFileName;
        this.clusterResultFileName = "clusterResult.txt";
        this.clusters = new cluster[this.k];
        this.nIterations = 0;
        this.kMeansPoints = new Vector<kMeansPoint>();
        this.kMeansPointsClone = new Vector<kMeansPoint>();

    }

    public Vector<kMeansPoint> getkMeansPoints() {
        return kMeansPoints;
    }

   
    public void readData(TransactionDao transaction) throws SQLException {
		Connection conn = ConnectionProvider.getConnection();

		
		//Vector<Integer> list = new Vector<>();
		//int[] list2 = new int[5];
		
		String userName = transaction.getUserName();
		int transactionAmount;
		
		Statement smt = conn.createStatement();
		
		String sql = "SELECT transaction_id, transaction_amount \r\n" + 
				"FROM transaction where userName='"+userName+"' \r\n" + 
				"ORDER BY transaction_id DESC \r\n" + 
				"LIMIT 10";
		//String sql="select transaction_amount from transaction where(userName='" + userName + "'); order by transaction_id desc";
		//ResultSet rs = smt.executeQuery("select transaction_amount from transaction where (userName='" + userName + "'); ");
		
		
		ResultSet rs = smt.executeQuery(sql);
   /* BufferedReader in = new BufferedReader(new FileReader(this.inputFileName));
    String line = "";
    while ((line = in.readLine()) != null) {
        // System.out.println("line"+line);
        StringTokenizer st = new StringTokenizer(line, " \t\n\r\f,");
        //System.out.println("st"+st.countTokens());
        //this.kMeansPoints.setSize(kMeansPoints.size());
        int count = 0; */

        kMeansPoints.setSize(10);

        int i = 0;

        while(rs.next()) {
			transactionAmount = rs.getInt("transaction_amount");
			kMeansPoint dp = new kMeansPoint(1, transactionAmount );
            dp.assignToCluster(0);
            this.kMeansPoints.set(i, dp);
            i++;
		}
       /* while (st.hasMoreTokens()) {
            kMeansPoint dp = new kMeansPoint(1, Integer.parseInt(st.nextToken()));
            dp.assignToCluster(0);
            this.kMeansPoints.set(i, dp);
            i++;
        }

        //System.out.println("kMeansPoints "+kMeansPoints);
    }*/
        System.out.println("kMeansPoints "+kMeansPoints);

}

    public void newTransactionModf(int transaction) {
        int i = 0;
        int rule[] = new int[this.k];
        kMeansPointsClone.setSize(kMeansPoints.size());

        for (i = 0; i < kMeansPoints.size(); i++) {

            kMeansPointsClone.setElementAt(new kMeansPoint(1, kMeansPoints.get(i).getY()), i);
            kMeansPointsClone.get(i).assignToCluster(kMeansPoints.get(i).getClusterNumber());
        }

        for (i = 0; i < (kMeansPoints.size() - 1); i++) {
            kMeansPoints.set(i, kMeansPoints.get(i + 1));
            kMeansPoints.get(i).assignToCluster(kMeansPoints.get(i).getClusterNumber());
        }

        kMeansPoints.set(i, new kMeansPoint(1, transaction));

        Vector<cluster> unOrdredCluster = new Vector<cluster>(this.getK());

        for (int j = 0; j < this.getK(); j++) {
            unOrdredCluster.add(j, this.getCluster(j));
        }

        for (int kk = 0; kk <= this.getK() - 2; kk++) {
            for (int j = 0; j <= this.getK() - 2 - kk; j++) {
                if (unOrdredCluster.get(j).getMean().getY() > unOrdredCluster.get(j + 1).getMean().getY()) {
                    swapCluster(j, j + 1, unOrdredCluster);
                }
            }
        }

        int temp;

        for (int j = 0; j < this.k; j++) {
            temp = unOrdredCluster.get(j).getClusterNumber();
            //System.out.println("temp " + temp);
            rule[temp] = j + this.k;
        }

        //System.out.println("cluster####" + unOrdredCluster);

        double max = 100000;
        int transClstrNo = 0;

        for (int j = 0; j < this.getK(); j++) {
            double mean = unOrdredCluster.get(j).getMean().getY();
            double diff = transaction - mean;
            if (max > Math.abs(diff)) {
                transClstrNo = unOrdredCluster.get(j).getClusterNumber();
                max = diff;
            }

        }
        kMeansPoints.get(i).assignToCluster(rule[transClstrNo] - this.k);

        fileWrite(clusterResultFileName, 0);
        //this.outputProcessor();

        System.out.println("**************" + this + "\n********* last transection gets  cluster no" + kMeansPoints.get(kMeansPoints.size() - 1).getClusterNumber());

    }

    public void newTransaction(int transaction) {
        int i = 0;
        /*System.out.println("before transaction the value of vector");
        for (i = 0; i < kMeansPoints.size(); i++) {
        System.out.print("  " + kMeansPoints.get(i));
        }*/

        kMeansPointsClone.setSize(kMeansPoints.size());
        for (i = 0; i < kMeansPoints.size(); i++) {

            kMeansPointsClone.setElementAt(new kMeansPoint(1, kMeansPoints.get(i).getY()), i);
            kMeansPointsClone.get(i).assignToCluster(kMeansPoints.get(i).getClusterNumber());
        }
        //System.out.println("\n kMeansPointsClone " + kMeansPointsClone);

        for (i = 0; i < (kMeansPoints.size() - 1); i++) {
            kMeansPoints.set(i, kMeansPoints.get(i + 1));
            kMeansPoints.get(i).assignToCluster(0);
        }
        kMeansPoints.set(i, new kMeansPoint(1, transaction));
        kMeansPoints.get(i).assignToCluster(0);

        // kMeansPoints.get(i).assignToCluster(0);
        /*System.out.println("\nafter transaction the value of vector");
        for (i = 0; i < kMeansPoints.size(); i++) {
        System.out.println("\nafter transaction the value of vector");
        System.out.print("  " + kMeansPoints.get(i));
        }*/
       
        this.runKMeans();

        this.outputProcessor();
        System.out.println("**************" + this + "\n********* last transection gets  cluster no" + kMeansPoints.get(kMeansPoints.size() - 1).getClusterNumber());

    }

    public void runKMeans() {

        for (int i = 0; i < k; i++) {

            this.clusters[i] = new cluster(i);
            this.clusters[i].setMean((this.kMeansPoints.get((int) (Math.random() * this.kMeansPoints.size()))));
            System.out.println("Mean : " + this.clusters[i]);
        }

        do {

            Iterator i = this.kMeansPoints.iterator();
            while (i.hasNext()) {
                this.assignToCluster((kMeansPoint) (i.next()));
            }

            this.nIterations++;

        } while (this.updateMeans());

    }

    private void assignToCluster(kMeansPoint dp) {

        int currentCluster = dp.getClusterNumber();
        //System.out.println("Dp: " + dp);
        //System.out.println("Current : " + currentCluster);
        //System.out.println("cluster.getMean : " + this.clusters[currentCluster].getMean());
        double minDistance = kMeansPoint.distance(dp, this.clusters[currentCluster].getMean());

        for (int i = 0; i < this.k; i++) {
            if (kMeansPoint.distance(dp, this.clusters[i].getMean()) < minDistance) {

                minDistance = kMeansPoint.distance(dp, this.clusters[i].getMean());
                currentCluster = i;

            }
        }

        dp.assignToCluster(currentCluster);

    }

    private boolean updateMeans() {

        boolean reply = false;

        int[] x = new int[this.k];
        int[] y = new int[this.k];
        int[] size = new int[this.k];
        kMeansPoint[] pastMeans = new kMeansPoint[this.k];

        for (int i = 0; i < this.k; i++) {

            x[i] = 0;
            y[i] = 0;
            size[i] = 0;
            pastMeans[i] = this.clusters[i].getMean();

        }

        Iterator i = this.kMeansPoints.iterator();
        while (i.hasNext()) {

            kMeansPoint dp = (kMeansPoint) (i.next());
            //System.out.println("Update Dp: " + dp);
            int currentCluster = dp.getClusterNumber();
            //System.out.println("dp.currentCluster : "+currentCluster);
            //System.out.println("dp.getX : "+dp.getX());
            //System.out.println("dp.getY : "+dp.getY());
            x[currentCluster] += dp.getX();
            //System.out.println("X : "+x[currentCluster]);
            y[currentCluster] += dp.getY();
            //System.out.println("Y : "+y[currentCluster]);
            size[currentCluster]++;
            //System.out.println("Size : "+size[currentCluster]);
            //System.out.println("############################################################");

        }

        for (int j = 0; j < this.k; j++) {
            //System.out.println("Size J : "+size[j]);
            if (size[j] != 0) {

                x[j] /= size[j];
                y[j] /= size[j];
                kMeansPoint temp = new kMeansPoint(x[j], y[j]);
                temp.assignToCluster(j);
                this.clusters[j].setMean(temp);
                if (kMeansPoint.distance(pastMeans[j], this.clusters[j].getMean()) != 0) {
                    reply = true;
                }

            }
        }

        return reply;

    }

    public int getK() {

        return this.k;

    }

    public cluster getCluster(int index) {

        return this.clusters[index];

    }

    @Override
    public String toString() {

        return kMeansPoints.toString();      

    }

    public Vector getDataPoints() {

        return this.kMeansPoints;

    }

    public Vector<kMeansPoint> outputProcessor() {
        int noOfClusters = this.k, i;
        int rule[] = new int[noOfClusters];
        int temp;
        Vector<cluster> unOrdredCluster = new Vector<cluster>(noOfClusters);
        // Vector<kMeansPoint> finalVector=new Vector<kMeansPoint>(noOfClusters);
        //System.out.println();
        //System.out.println(kMeansPoints);
        for (i = 0; i < noOfClusters; i++) {
            //System.out.println("Testing loop" + this.getCluster(i));
            unOrdredCluster.add(i, this.getCluster(i));
        }

        /// int key = 0;
        for (i = 0; i <= noOfClusters - 2; i++) {
            for (int j = 0; j <= noOfClusters - 2 - i; j++) {
                     if (unOrdredCluster.get(j).getMean().getY() > unOrdredCluster.get(j + 1).getMean().getY()) {
                    swapCluster(j, j + 1, unOrdredCluster);
                }
                     //System.out.println("getMean.getY1 : "+unOrdredCluster.get(j).getMean().getY()+ " getMean.getY2 : "+unOrdredCluster.get(j+1).getMean().getY());
           
            }
            
        }


        for (i = 0; i < noOfClusters; i++) {
        //System.out.println(" after bubble sort " + unOrdredCluster.get(i));
        }
        for (i = 0; i < noOfClusters; i++) {
            temp = unOrdredCluster.get(i).getClusterNumber();
            //System.out.println("temp " + temp);
            rule[temp] = i + noOfClusters;

        }
         for (i = 0; i < noOfClusters; i++) {
        //System.out.println("tjis is rule  " + rule[i]);
        }
         System.out.println("KmeansPOintSize: "+kMeansPoints.size());
        for (i = 0; i < kMeansPoints.size(); i++) {
            kMeansPoints.get(i).assignToCluster(rule[kMeansPoints.get(i).getClusterNumber()]);
            //System.out.println("KmeansPOint1 : "+kMeansPoints.get(i));
        }
        for (i = 0; i < kMeansPoints.size(); i++) {
            kMeansPoints.get(i).assignToCluster(kMeansPoints.get(i).getClusterNumber() - noOfClusters);
        }

        fileWrite(clusterResultFileName, 0);
        /*try {
        FileWriter out = new FileWriter("input.txt");
        out.write(" ");
        for (i = 0; i < kMeansPoints.size(); i++) {
        int clstr = kMeansPoints.get(i).getClusterNumber();
        String str = Integer.toString(clstr);
        out.write(str);
        //System.out.println("cluster no " + kMeansPoints.get(i).getClusterNumber());
        out.write(" ");
        }
        out.flush();
        } catch (IOException e) {
        System.err.println(e);
        System.exit(-1);
        }*/
        //System.out.println("after adding transaction and outputProcessor() the value of kmeanspoints ");
        //System.out.println(kMeansPoints);

        return kMeansPoints;

    }

    public void swapCluster(int firstIndex, int secondIndex, Vector<cluster> clusterArray) {
        cluster temp = clusterArray.get(secondIndex);
        clusterArray.set(secondIndex, clusterArray.get(firstIndex));
        clusterArray.set(firstIndex, temp);
    }

    public static void main(String[] args) {

    	kMeans km = new kMeans(3);
        TransactionDao transaction = new TransactionDao();
        transaction.setUserName("as");

        try {
            //System.out.println("before read data");
            km.readData(transaction);
        } catch (Exception e) {
            System.err.println(e);
            System.exit(-1);
        }

        km.runKMeans();
        km.outputProcessor();
        System.out.println("ur clustering is successful" + km);
        //System.out.println("get cluster mean "+km.getCluster(0).getMean());

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
            fileWrite(inputFileName, 1);
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
//                for (int i = 0; i < kMeansPoints.size(); i++) {
//                    //int clstr = kMeansPoints.get(i).getY();
//                    itemToWrite = Integer.toString(clstr);
//                    out.write(itemToWrite);
//                    out.write(" ");
//                }
            }
            out.flush();
        } catch (IOException e) {
            System.err.println(e);
            System.exit(-1);
        }
    }
}
