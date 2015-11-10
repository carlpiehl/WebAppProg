package com.amzi.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class addCartServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		HttpSession session = request.getSession(false);
		String productID = request.getParameter("productID");
		PrintWriter out = response.getWriter();
		
		@SuppressWarnings("unchecked")
		ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
		//can create error message if session == null or whatever fail is
		
		if(cart == null){
			cart = new ArrayList<String>();
		}
		
		cart.add(productID);
		
		session.setAttribute("cart", cart);
		
		RequestDispatcher rd = request.getRequestDispatcher("fullProduct.jsp?productID="+productID);
		out.print("Product has been added to cart");
		rd.include(request, response);
		response.sendRedirect("cart.jsp");
	}
}
