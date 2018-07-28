package com.asif.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.asif.dao.QuestionDao;
import com.asif.dao.User;
import com.asif.utility.ConnectionProvider;

public class Question {
	private Connection con;
	
	public Question() {
		con = ConnectionProvider.getConnection();
	}
	
	public boolean validateAnswer(QuestionDao answer) throws SQLException {
		String userName = answer.getUserName();
		String answer2 = answer.getAnswer2();
		
		PreparedStatement ps = con.prepareStatement("select user_name,security_question2 from user where user_name=? and security_question2=?");
		ps.setString(1, userName);
		ps.setString(2, answer2);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			String dbUserName = rs.getString("user_name");
			String dbans = rs.getString("security_question2");
			
			if(dbUserName.equals(userName) && dbans.equals(answer2)) {
				return true;
			}
		}
		
		//int a =0;
		return false;
	}
}
