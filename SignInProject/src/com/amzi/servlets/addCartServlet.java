/*
   Class: addCartServlet
   A class that that is called by pressing the "add to cart" within the "fullProduct.jsp" 
   or one of the "+" buttons within the "cart.jsp".
   
   It is used to grab a HashMap<String, AtomicInt> called "cart" from the session
   (or create one if it doesn't already exist),
   
   to find a product(using <String>) for the corresponding "productID"
   (or add it to the cart if it doesn't already exist),
   
   increment its quantity(<AtomicInteger>) by one,
   and store "cart" in the session.
   
   Functions:
   doPost()					 - takes HttpServletRequest "request", HttpServletResponse "response"
   									 and completes the above mentioned steps for the given "productID",
   									 which is a parameter stored in request.
   									 - then directs the application to run "cart.jsp"
*/
package com.amzi.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.io.PrintWriter;
import java.util.concurrent.atomic.AtomicInteger;


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
	
		//---------------------------------------------------------------------------------------------------
		HashMap<String, AtomicInteger> cart = (HashMap<String, AtomicInteger>) session.getAttribute("cart");
		
		if(cart == null){//if cart2 is null, make a cart2 hashmap
			cart = new HashMap<String, AtomicInteger>();
		}
		
		if(cart.containsKey(productID)){
			cart.get(productID).incrementAndGet();
		}else {
			cart.put(productID, new AtomicInteger(1));
		}
		session.setAttribute("cart", cart);
		//------------------------------------------------------------------------------------------------------
		
		RequestDispatcher rd = request.getRequestDispatcher("fullProduct.jsp?productID="+productID);
		out.print("Product has been added to cart");
		rd.include(request, response);
		response.sendRedirect("cart.jsp");
	}
}
