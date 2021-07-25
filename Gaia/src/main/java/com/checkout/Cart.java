package com.checkout;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Cart
 */
@WebServlet("/Cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int straw =Integer.parseInt(request.getParameter("straw"));
			int jute =Integer.parseInt(request.getParameter("jute"));
			int mat =Integer.parseInt(request.getParameter("mat"));
			int deter =Integer.parseInt(request.getParameter("deter"));
			int bamb =Integer.parseInt(request.getParameter("bamb"));
			int trash =Integer.parseInt(request.getParameter("trash"));
			float total = 0;
			HttpSession session  = request.getSession();
			session.setAttribute("straw", straw);
			session.setAttribute("jute", jute);
			session.setAttribute("mat", mat);
			session.setAttribute("deter", deter);
			session.setAttribute("bamb", bamb);
			session.setAttribute("trash", trash);
			
		if(straw!=0) {
			total+= straw * 19.9;
		}
		if(jute!=0) {
			total+= jute * 23;
		}
		if(mat!=0) {
			total+= mat * 73.2;
		}
		if(deter!=0) {
			total+= deter * 40;
		}
		if(bamb!=0) {
			total+= bamb * 45;
		}
		if(trash!=0) {
			total+= trash * 20;
		}
			
		session.setAttribute("total", total);
		
		response.sendRedirect("Cart.jsp");
			
	}

}
