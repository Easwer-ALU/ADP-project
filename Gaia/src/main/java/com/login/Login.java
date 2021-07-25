package com.login;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet  {
	
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("name");
		String pass = request.getParameter("pass");
		
		LoginDao dao = new LoginDao();
		
		try {
		if(dao.check(uname, pass))  {
			
			HttpSession session = request.getSession();
			session.setAttribute("username", uname);
			session.setAttribute("errormsg", " ");
			response.sendRedirect("Retriever	");
		}
		else {
			HttpSession session = request.getSession();
			session.setAttribute("errormsg","Invalid username or password");
			response.sendRedirect("Login.jsp");
		}
	}catch (SQLException	e) {
		e.printStackTrace();
	}
	}

}
