package com.asif.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.asif.dao.User;
import com.asif.model.Login;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Login login = new Login();
		String value = request.getParameter("action");
		
		if("login".equalsIgnoreCase(value)) {
			String userName = request.getParameter("user_name");
			String password = request.getParameter("password");
			
			
			User user = new User();
			
			user.setUserName(userName);
			user.setPassword(password);
			
			
			try {
				boolean v = login.userLogin(user);
				if(v) {
					HttpSession session = request.getSession();
					session.setAttribute("userName", userName);
					request.setAttribute("userName", userName);
					RequestDispatcher rd = request.getRequestDispatcher("/view/userProfile.jsp");
					rd.forward(request, response);
				}
				else {
					RequestDispatcher rd = request.getRequestDispatcher("/view/Login.jsp");
					rd.forward(request, response);
				}
			}catch(Exception ex) {
				ex.printStackTrace();
			}
		}
	}
}
