package com.asif.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.asif.dao.TransactionDao;
import com.asif.model.TransactionHistory;

/**
 * Servlet implementation class TransactionHistoryController
 */
@WebServlet("/TransactionHistoryController")
public class TransactionHistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String value = request.getParameter("action");
		
		TransactionDao transaction = new TransactionDao();
		transaction.setUserName(userName);
		
		if(value.equalsIgnoreCase("transactionHistory")) {
			TransactionHistory history = new TransactionHistory();
			try {
				HttpSession session = request.getSession();
				session.setAttribute("userName", userName);
				request.setAttribute("userName", userName);
				//history.getTransactionHistory(transaction);
				request.setAttribute("transactionHistory",history.getTransactionHistory(transaction));
				RequestDispatcher rd = request.getRequestDispatcher("/view/transactionHistory.jsp");
				rd.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
