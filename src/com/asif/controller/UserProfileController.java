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
import com.asif.model.UserProfile;


/**
 * Servlet implementation class UserProfileController
 */
@WebServlet("/UserProfileController")
public class UserProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		
		

		UserProfile up = new UserProfile();
		User user = new User();
		user.setUserName(userName);
		
		String value=request.getParameter("action");
		if("userProfile".equalsIgnoreCase(value)) {
			try {
				int a = up.userProfile(user);
				if(a != 0) {
					HttpSession session = request.getSession();
					session.setAttribute("userName", userName);
					request.setAttribute("userName", userName);
					RequestDispatcher rd=request.getRequestDispatcher("/view/userP.jsp");
					rd.forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
	}

}
