package com.gaia;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Retriever
 */
@WebServlet("/Retriever")
public class Retriever extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String url= "jdbc:mysql://localhost:3306/gaia";
	String username = "root";
	String password = "easwer#358";
	String sql = "SELECT * FROM user_data WHERE log_id =? ";
	String sql2 = "Select  log_id FROM login WHERE uname =?";
	String sql3 = "SELECT * FROM order_detail WHERE log_id=?";
	String sql4 = "SELECT COUNT(*) FROM order_detail WHERE log_id=?";
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("username");
		if(session.getAttribute("username")==null){
			response.sendRedirect("Login.jsp");
		}
		else{
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(url,username,password);
				PreparedStatement st = con.prepareStatement(sql2);
				
				st.setString(1,user);
				ResultSet rs=st.executeQuery();
				while(rs.next()) {
					int id = rs.getInt(1);
					session.setAttribute("id", id);
				}
				int id =(Integer)session.getAttribute("id");
				System.out.println(id);
			
				PreparedStatement stat = con.prepareStatement(sql3);
			
				stat.setInt(1,id);
			
								
				PreparedStatement st1 = con.prepareStatement(sql);
				st1.setInt(1, id);
				ResultSet rs1 = st1.executeQuery();
			
				while(rs1.next()) {
					String name = rs1.getString("name");
					String phon = rs1.getString("ph_no");
					String mail = rs1.getString("email");
					String add = rs1.getString("address");
					session.setAttribute("name", name);
					session.setAttribute("phno", phon);
					session.setAttribute("mail", mail);
					session.setAttribute("add", add);
				}
				}
				catch (SQLException	e) {
					e.printStackTrace();
				}catch (ClassNotFoundException	e) {
					e.printStackTrace();
				}
			response.sendRedirect("Account.jsp");
		}
		
	}


}
