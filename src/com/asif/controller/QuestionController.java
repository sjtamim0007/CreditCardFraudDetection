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

import com.asif.dao.QuestionDao;
import com.asif.dao.TransactionDao;
import com.asif.dao.User;
import com.asif.model.ATMPinCodeMatcher;
import com.asif.model.Question;
import com.asif.model.Transaction;

/**
 * Servlet implementation class SecurityServlet
 */
@WebServlet("/SecurityServlet")
public class QuestionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName = request.getParameter("userName");
		String answer2 = request.getParameter("answer2");
		Double amount = Double.parseDouble(request.getParameter("amount"));
		
		QuestionDao ans = new QuestionDao();
		ans.setUserName(userName);
		ans.setAnswer2(answer2);
		
		Question ques = new Question();
		
		try {
			if(ques.validateAnswer(ans)) {
				TransactionDao tr = new TransactionDao();
				tr.setUserName(ans.getUserName());
				tr.setTransactionAmount(amount);
				
				Transaction transaction = new Transaction();
				int a = transaction.transactionComplete(tr);
				System.out.println("a "+a);
				if(a != 0) {
					RequestDispatcher rd = request.getRequestDispatcher("/view/transactionSuccess.jsp");
					rd.forward(request, response);
				}
				else {
					System.out.println("transaction not Completed");
				}
				
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("/view/fraudent.jsp");
				rd.forward(request, response);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
