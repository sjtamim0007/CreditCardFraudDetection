package com.asif.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asif.dao.User;
import com.asif.model.UserRegistration;

/**
 * Servlet implementation class RegistrationController
 */
@WebServlet("/Registration")
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserRegistration registration = new UserRegistration();
		String value = request.getParameter("action");
		
		if("registration".equalsIgnoreCase(value)) {
			String firstName = request.getParameter("first_name");
			String lastName = request.getParameter("last_name");
			String userName = request.getParameter("user_name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String pinNumber = request.getParameter("pin_number");
			String mobileNumber = request.getParameter("mobile");
			String dateOfBirth = request.getParameter("date_of_birth");
			String maritalStatus = request.getParameter("marital_status");
			String gender = request.getParameter("gender");
			String currentAddress = request.getParameter("current_address");
			String parmanentAddress = request.getParameter("parmanent_address");
			String city = request.getParameter("city");
			String nationality = request.getParameter("nationality");
			String profession = request.getParameter("profession");
			String card_type = request.getParameter("card_type");
			String question1 = request.getParameter("security_question1");
			String question2 = request.getParameter("security_question2");
			
			User user = new User();
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setUserName(userName);
			user.setEmail(email);
			user.setPassword(password);
			user.setPinNumber(pinNumber);
			user.setMobileNumber(mobileNumber);
			user.setDateOfBirth(dateOfBirth);
			user.setMaritalStatus(maritalStatus);
			user.setGender(gender);
			user.setCurrentAddress(currentAddress);
			user.setParmanentAddress(parmanentAddress);
			user.setCity(city);
			user.setNationality(nationality);
			user.setProfession(profession);
			user.setCard_type(card_type);
			user.setQuestion1(question1);
			user.setQuestion2(question2);
			
			int a = 0;
			
			try {
				a = registration.addUserInfo(user);
				
				if(a != 0) {
					RequestDispatcher rd = request.getRequestDispatcher("/view/success.jsp");
					rd.forward(request, response);
				}
				else {
					RequestDispatcher rd = request.getRequestDispatcher("/view/error.jsp");
					rd.forward(request, response);
				}
			}catch(Exception ex) {
				ex.printStackTrace();
			}

		}
	}

}
