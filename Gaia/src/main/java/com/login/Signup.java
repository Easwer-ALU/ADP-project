package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	String sql = "INSERT INTO user_data VALUES (?,?,?,?,?)";
	String sql2 = "INSERT INTO login VALUES(?,?,?)";
	String url= "jdbc:mysql://localhost:3306/gaia";
	String username = "root";
	String password = "easwer#358";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Random rand = new Random();
		int ran = 	rand.nextInt(35);
		String uname = request.getParameter("usename");
		System.out.println("usename");
		String name = request.getParameter("Cusname");
		String phn = request.getParameter("phno");
		String email = request.getParameter("email");
		String add = request.getParameter("address");
		String pass = request.getParameter("pass");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username,password);
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setInt(1,ran);
			st.setString(2, name);
			st.setString(3, phn);
			st.setString(4, email);
			st.setString(5,add);
			
			PreparedStatement st1 = con.prepareStatement(sql2);
			st1.setInt(1, ran);
			st1.setString(2, uname);
			st1.setString(3,pass);
			
			st.executeUpdate();
			st1.executeUpdate();
		
    	}catch (SQLException	e) {
				e.printStackTrace();
			}
		catch (ClassNotFoundException	e) {
			e.printStackTrace();
		}
	
		HttpSession session = request.getSession();
		session.setAttribute("username", uname);
		response.sendRedirect("Account.jsp");
	}

}
