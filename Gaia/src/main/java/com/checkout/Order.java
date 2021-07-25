package com.checkout;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Order
 */
@WebServlet("/Order")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String sql = "SELECT log_id FROM login WHERE uname = ?";

	String url = "jdbc:mysql://localhost:3306/gaia";
	String username = "root";
	String password = "easwer#358";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Random rand = new Random();
		int ord_id = rand.nextInt(35);
		String delname = request.getParameter("delname");
		String deladd = request.getParameter("deladd");
		String delivery = request.getParameter("delivery");
		String pay = request.getParameter("payment");

		
		  String straw =request.getParameter("straw"); 
		  String jute =request.getParameter("jute"); 
		  String mat  =request.getParameter("mat");
		  String deter  = request.getParameter("deter");
		  String bamb = request.getParameter("bamb"); 
		  String trash = request.getParameter("trash");
		 
		  Date date = Calendar.getInstance().getTime();  
		  DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");  
		  String ft = dateFormat.format(date);  
		
		  String deli = "INSERT INTO del_detail VALUES(?,?,?,?,?)";
				
		HttpSession session = request.getSession();
		float amount = (Float) session.getAttribute("total");
		String user = (String) session.getAttribute("username");
		
	 	String update = "INSERT INTO order_detail VALUES(?,?,?,?,?)";
	 	String prod = "0";
		  
	 	try { Class.forName("com.mysql.cj.jdbc.Driver"); Connection con =
		  DriverManager.getConnection(url,username,password); 
		  PreparedStatement st =  con.prepareStatement(sql);
		 PreparedStatement orb = con.prepareStatement(deli);
		 PreparedStatement st1 =  con.prepareStatement(update);
		 orb.setInt(1, ord_id);
		 orb.setString(2, delname);
		 orb.setString(3, deladd);
		 orb.setString(4, delivery);
		 orb.setString(5,pay);
		 orb.executeUpdate();
		 
		 System.out.println("deli_detail updated");
		
		 
		 st.setString(1, user);		  
		  ResultSet rs = st.executeQuery();
		  if(rs.next()) {
			  String log = rs.getString("log_id");
			  session.setAttribute("log", log);
		  }
		  String log = (String)session.getAttribute("log");
		  
			System.out.println(straw);
		  	
		  if(straw !=null) {
			 String str = "straw";
			  System.out.println(prod+str);
		  }
		  if(jute!=null) {
			  prod = prod+ "Jute bag ";
			  
			  System.out.println(prod);
		  }
		  if(mat!=null) {
		
			  prod = prod+ "Hemp Mat ";
			  System.out.println(prod);
		  }
		  if(deter!=null) {
			  prod = prod+ "Detergent ";
			  System.out.println(prod);
			
		  }
		  if(bamb!=null) {
			
			  prod = prod+ "Bamboo Dish Cloth ";
			  System.out.println(prod);
		  }
		  if(trash!=null) {
			  prod = prod+ "Trash Bag ";
			  System.out.println(prod);
		  }
		  
		  	st1.setString(1, log);
		  	st1.setInt(2, ord_id);
		  	st1.setString(3, prod);
		  	st1.setString(4, ft);
		  	st1.setFloat(5, amount);
		  
		  	System.out.println(prod);
		  	
		  	st1.executeUpdate();
		  	
		  }catch (SQLException e) { e.printStackTrace(); } catch
		  (ClassNotFoundException e) { e.printStackTrace(); }
		 
	}

}
