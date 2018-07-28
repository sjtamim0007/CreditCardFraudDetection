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
import com.asif.model.ATMPinCodeMatcher;

/**
 * Servlet implementation class PinCodeMatcherController
 */
@WebServlet("/PinCodeMatcherController")
public class PinCodeMatcherController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String pinCode = request.getParameter("pin_number");
		
		User user = new User();
		user.setUserName(userName);
		user.setPinNumber(pinCode);
		
		ATMPinCodeMatcher matcher = new ATMPinCodeMatcher();
		
		try {
			boolean status = matcher.pinValidate(user);
			if(status) {
				HttpSession session = request.getSession();
				session.setAttribute("userName", userName);
				request.setAttribute("userName", userName);
				RequestDispatcher rd = request.getRequestDispatcher("/view/atm.jsp");
				rd.forward(request, response);
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("/view/error.jsp");
				rd.forward(request, response);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}

}

