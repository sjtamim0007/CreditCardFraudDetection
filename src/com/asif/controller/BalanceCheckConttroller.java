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

import com.asif.dao.User;
import com.asif.model.BalanceCheck;

/**
 * Servlet implementation class BalanceCheckConttroller
 */
@WebServlet("/BalanceCheckController")
public class BalanceCheckConttroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");

		User user = new User();

		user.setUserName(userName);


		BalanceCheck check = new BalanceCheck();


		try {

			double balance = check.balanceCheck(user);

			if(balance != 0) {

			HttpSession session = request.getSession();

				session.setAttribute("userName", userName);

				request.setAttribute("userName", userName);

				session.setAttribute("balance", balance);

				request.setAttribute("balance", balance);


				RequestDispatcher rd = request.getRequestDispatcher("/view/showBalance.jsp");

				rd.forward(request, response);

			}else {
	
				RequestDispatcher rd = request.getRequestDispatcher("/view/error.jsp");

				rd.forward(request, response);

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

	}

}
