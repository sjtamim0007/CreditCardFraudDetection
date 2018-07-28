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
import com.asif.model.AccountDetails;

/**
 * Servlet implementation class AccountDetailsController
 */
@WebServlet("/AccountDetailsController")
public class AccountDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String value = request.getParameter("action");
		User user = new User();
		user.setUserName(userName);
		if("userInfo".equalsIgnoreCase(value)) {
			AccountDetails ds = new AccountDetails();
			try {
				request.setAttribute("userDetails", ds.getAccountDetails(user));
				HttpSession session = request.getSession();
				session.setAttribute("userName", userName);
				request.setAttribute("userName", userName);
				RequestDispatcher rd = request.getRequestDispatcher("/view/accountDetails.jsp");
				rd.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
