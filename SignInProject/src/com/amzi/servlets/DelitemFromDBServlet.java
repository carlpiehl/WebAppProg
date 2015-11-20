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

import com.amzi.dao.DelitemFromDB;

import com.amzi.dao.LoginDao;

//Servlet packages
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class DelitemFromDBServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	DelitemFromDB delItem = new DelitemFromDB();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String productID = request.getParameter("productID");
		
		HttpSession session = request.getSession(false);  
    	
		//TODO: Add error checking
		
		delItem.getConnection();
    	//TODO: Add validation, write according message below
		delItem.delProduct(productID);
		
		out.print("<p style=\"color:green\">Check your database to see if it worked!</p>");
		RequestDispatcher rd = request.getRequestDispatcher("/admin/adminHome.jsp");
		rd.include(request, response);
		
		out.close();
	}
}
