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

import com.asif.dao.PinChange;
import com.asif.dao.User;
import com.asif.model.ATMPinCodeMatcher;

/**
 * Servlet implementation class PinChangeController
 */
@WebServlet("/PinChangeController")
public class PinChangeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PinChange pinChange = new PinChange();
		String value = request.getParameter("action");
		
		if("pinChange".equalsIgnoreCase(value)) {
			String userName = request.getParameter("userName");
			String oldPin = request.getParameter("oldPin");
			String newPin = request.getParameter("newPin");
			
			User user = new User();
			user.setUserName(userName);
			user.setPinNumber(oldPin);
			
			
			ATMPinCodeMatcher matcher = new ATMPinCodeMatcher();
			//PinChange change = new PinChange();
			int a = 0;
			try {
				boolean status = matcher.pinValidate(user);
				if(status) {
					user.setPinNumber(newPin);
					a = pinChange.pinChange(user);
					if(a != 0) {
						HttpSession session = request.getSession();
						session.setAttribute("userName", userName);
						request.setAttribute("userName", userName);
						RequestDispatcher rd = request.getRequestDispatcher("/view/success.jsp");
						rd.forward(request, response);
					}
					
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

}
