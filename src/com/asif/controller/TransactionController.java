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
import com.asif.model.Transaction;

/**
 * Servlet implementation class TransactionController
 */
@WebServlet("/TransactionController")
public class TransactionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName = request.getParameter("userName");
		double amount = Double.parseDouble(request.getParameter("amount"));
		
		TransactionDao dao = new TransactionDao();
		dao.setUserName(userName);
		dao.setTransactionAmount(amount);
		
		Transaction transaction = new Transaction();
		
		int a = 0;
		
		try {
			a = transaction.transactionValidator(dao);
			if (a != 0) {
				HttpSession session = request.getSession();
				session.setAttribute("userName", userName);
				request.setAttribute("userName", userName);
				RequestDispatcher rd = request.getRequestDispatcher("/view/transactionSuccess.jsp");
				rd.forward(request, response);
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("userName", userName);
				request.setAttribute("userName", userName);
				session.setAttribute("amount", amount);
				request.setAttribute("amount", amount);
				RequestDispatcher rd = request.getRequestDispatcher("/view/securityQ.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
