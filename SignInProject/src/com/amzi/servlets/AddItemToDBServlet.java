package com.amzi.servlets;

//IO packages
import java.io.IOException;
import java.io.PrintWriter;

//DAO packages
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.amzi.dao.AddItemToDB;

import com.amzi.dao.LoginDao;

//Servlet packages
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class AddItemToDBServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	AddItemToDB addItem = new AddItemToDB();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String prodName = request.getParameter("prodName");
		String prodDescShort = request.getParameter("prodDescShort");
		String prodDesLong = request.getParameter("prodDescLong");
		String prodPrice = request.getParameter("prodPrice");
		String inStock = request.getParameter("inStock");
		String rating = request.getParameter("rating");
		
		HttpSession session = request.getSession(false);  
    	
		//TODO: Add error checking
    	addItem.getConnection();
    	//TODO: Add validation, write according message below
    	addItem.setUpProduct(prodName, prodDescShort, prodDesLong, prodPrice, inStock, rating);
		
		//out.print("<p style=\"color:green\">Check your database to see if it worked!</p>");
		RequestDispatcher rd = request.getRequestDispatcher("adminHome.jsp");
		rd.include(request, response);
		
		out.close();
	}
}
