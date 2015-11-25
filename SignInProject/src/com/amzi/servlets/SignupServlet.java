/*
   Class: SignupServlet
   A class that that is called by SignUp.jsp in order to call AccountDAO.java and LoginDao.java
   in order to add a user to the "store_db" database, then get its corresponding userID.
   It then stores the user's credentials into the session. 
   
   Functions:
   doPost()   			 - takes HttpServletRequest "request", HttpServletResponse "response",
      							   and grabs Strings "name"("uname"), "email"("uemail")and "pass"("upass") from "request".
   									 
   									 - then passes these variables to an instance of AccountDAO.java 
   									   using the function call "signUp".
   									 
   									 - then passes "name" and "pass" to LoginDao.validate in order to get the userID.
   									 - then direct the application to run welcome.jsp
   NOTE: 						 - Used http://hmkcode.com/java-mysql/ tutorial for majority of this class
*/
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
import com.amzi.dao.AccountDAO;
import com.amzi.dao.LoginDao;

//Servlet packages
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class SignupServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	AccountDAO accountDao = new AccountDAO();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String name=request.getParameter("uname");
		String email=request.getParameter("uemail");
		String pass=request.getParameter("upass");
		
		HttpSession session = request.getSession(false);  
    	if(session!=null){
    		session.setAttribute("name", name);
    	}
		//TODO: Add error checking
    	accountDao.getConnection();
    	//TODO: Add validation, write according message below
		accountDao.signUp(name, email, pass);
		int [] userStatus = LoginDao.validate(name, pass);
		session.setAttribute("userStatus", userStatus);
		
		out.print("<p style=\"color:green\">Check your database to see if it worked!</p>");
		RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
		rd.include(request, response);
		
		out.close();
	}
}
