package com.amzi.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.io.PrintWriter;
import java.util.concurrent.atomic.AtomicInteger;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class subCartServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		HttpSession session = request.getSession(false);
		String productID = request.getParameter("productID");
		PrintWriter out = response.getWriter();
		
		@SuppressWarnings("unchecked")
	
		//---------------------------------------------------------------------------------------------------
		HashMap<String, AtomicInteger> cart = (HashMap<String, AtomicInteger>) session.getAttribute("cart");
		//---------------------------------------------------------------------------------------------------


		//---------------------------------------------------------------------------------------------------
		if(cart == null){//if cart2 is null, make a cart2 hashmap
			cart = new HashMap<String, AtomicInteger>();
		}
		
		if(cart.containsKey(productID)){
			if(cart.get(productID).get() > 1){
				cart.get(productID).decrementAndGet();
			}
		}
		session.setAttribute("cart", cart);
		//------------------------------------------------------------------------------------------------------
		
		RequestDispatcher rd = request.getRequestDispatcher("fullProduct.jsp?productID="+productID);
		out.print("Product has been added to cart");
		rd.include(request, response);
		response.sendRedirect("cart.jsp");
	}
}
