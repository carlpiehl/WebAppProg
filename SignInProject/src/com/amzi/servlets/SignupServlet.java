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
		
		out.print("<p style=\"color:green\">Check your database to see if it worked!</p>");
		RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
		rd.include(request, response);
		
		out.close();
	}
}
