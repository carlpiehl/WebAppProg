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
		String pass=request.getParameter("upass");
		String email=request.getParameter("uemail");
	
		HttpSession session = request.getSession(false);  
    	if(session!=null){
    		session.setAttribute("name", name);
    	}
		//This part should be in an if method, but currently signUp is void
		//according to mebigfatguy on irc, this should not occur here, do it in signUp
    	//we will need a connection pool
    	accountDao.getConnection();
		//Make sure to add validation in the sign up, so if this returns say -1,
		//it means the email was already in use and we should print an error,
		//then .include and return
		accountDao.signUp(name, pass, email);
		
		out.print("<p style=\"color:green\">Check your database to see if it worked!</p>");
		RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
		rd.include(request, response);
		
		out.close();
	}
}
