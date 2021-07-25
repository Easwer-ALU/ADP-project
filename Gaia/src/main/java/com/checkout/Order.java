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

		HttpSession session = request.getSession();
		
		  String straw = session.getAttribute("straw").toString();
			 String jute = (String)session.getAttribute("jute").toString();
			 String mat  = (String)session.getAttribute("mat").toString();
			 String deter = (String)session.getAttribute("deter").toString();
			 String bamb =  (String)session.getAttribute("bamb").toString(); 
			 String trash =  (String)session.getAttribute("trash").toString();
			 
		  
		  Date date = Calendar.getInstance().getTime();  
		  DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");  
		  String ft = dateFormat.format(date);  
		
		  String deli = "INSERT INTO del_detail VALUES(?,?,?,?,?)";
				
		
		float amount = (Float) session.getAttribute("total");
		String user = (String) session.getAttribute("username");
		
	 	String update = "INSERT INTO order_detail VALUES(?,?,?,?,?)";
	 	String prod = "";
		  
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
		  
			String str = "0";
		  	
		  if(!straw.equals(str)) {
			 prod= prod+"Metal Straw "+straw+",";
			 
		  }
			
			  if(!jute.equals(str)) {
				  prod = prod+ "Jute bag "+jute+",";
			  	
			  } 
			  
			  if(!mat.endsWith(str)) {
			  
			  prod = prod+ "Hemp Mat "+mat+","; 
		  }
			  
			  if(!deter.equals(str)) { 
				  
				  prod = prod+ "Detergent "+deter+","; 
			 
			 
			  } 
			  if(!bamb.equals(str)) {
			  	  prod = prod+ "Bamboo Dish Cloth "+bamb+","; 
			  	
			  }
			  if(!trash.equals(str)) {
				  prod = prod+ "Trash Bag "+trash; 
				  
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
		 
	 	response.sendRedirect("Retriever");
	}
	
	
}
