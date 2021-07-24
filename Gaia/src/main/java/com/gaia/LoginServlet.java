package com.gaia;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String uname = request.getParameter("name");
		 String pass = request.getParameter("pass");
		 
		 LoginDao dao = new LoginDao	
		 
		 if(dao.check(uname,pass))
		 {
			 HttpSession session = request.getSession();
			 session.setAttribute("username", uname);
			 response.sendRedirect("Account.jsp");
		 }
		 else {
			 response.sendRedirect("Login.jsp")	;
		 }
	}

}
