package com.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class LoginDao
 */
@WebServlet("/LoginDao")
public class LoginDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	String sql = "SELECT * FROM login where uname=? AND pass=?";
	String url= "jdbc:mysql://localhost:3306/gaia";
	String username = "root";
	String password = "easwer#358";
    
    public boolean check(String uname,String pass) throws SQLException {
    	try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username,password);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,uname);
			st.setString(2, pass);
			ResultSet rs = st.executeQuery();
			if(rs.next()) 
			{
				return true;
			}
    	}
			catch (ClassNotFoundException	e) {
				e.printStackTrace();
			}
			return false;
		
	}
    }

	


