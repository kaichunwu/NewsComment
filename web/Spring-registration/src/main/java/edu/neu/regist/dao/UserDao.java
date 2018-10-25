package edu.neu.regist.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import edu.neu.regist.domain.User;

public class UserDao {

	public String addUser(User user,DataSource dataSource) {
		Connection con = null;
		try {
			con = dataSource.getConnection();
			Statement st=con.createStatement();
			String str="INSERT INTO USERS (USERNAME, PASSWORD, ENABLED)"
					+ " VALUES(\""+user.getUsername()+"\",\""
					+user.getPassword()+"\",true);";
			st.executeUpdate(str);
			str="INSERT INTO AUTHORITIES (USERNAME, AUTHORITY)"
					+ " VALUES(\""+user.getUsername()+"\",\""
					+roleSelect(user.getRole())+"\");";
			st.executeUpdate(str);
			st.close();
			con.close();
			System.out.println("successful");
			return "successful";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "fail";
	}
	
	public String roleSelect(String role) {
		String rolename = "";
		switch(role) {
		case "user" : rolename = "ROLE_USER";break;
		case "supervisor" : rolename = "ROLE_SUPERVISOR";break;
		default: rolename = role;
		}
		return rolename;
	}
	
}
