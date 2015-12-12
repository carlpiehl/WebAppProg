/*
   Class: LoginServlet
   A class that that is called by SignIn.jsp in order to call LoginDao.java,
   determine whether a "username" and its corresponding "password" 
   are stored within the "store_db" database. It then stores the user's
   relevant information into the session.
   
   Functions:
   doPost()   			 - takes HttpServletRequest "request", HttpServletResponse "response",
      							 - and grabs Strings n("username") and p("password") from "request".
   									 
   									 - then passes these variables to LoginDao.java 
   									 using the function call  "validate".
   									 - if the username exist and has the corresponding password
   									 		- the user's name, userId, and adminflag are stored in the session
   									 		
   									 		- if the username belongs does not belong to an admin
   									 			- then directs the application to run the welcome.jsp
   									 		
   									 		- else the username belongs to an admin
   									 		  - then directs the application to run the adminHome.jsp
   									 
   									 - else there is no given "n" and corresponding "p" found in the "store_db" database
   									 		- then directs application to run the index.jsp
   									  	 
   NOTE: 						 - Used http://hmkcode.com/java-mysql/ tutorial for majority of this class
*/
package com.amzi.servlets;  
  
import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
  
import com.amzi.dao.LoginDao; 
  
public class LoginServlet extends HttpServlet{  
  
    private static final long serialVersionUID = 1L;  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)    
            throws ServletException, IOException {    
  
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();    
        
        String n=request.getParameter("username");    
        String p=request.getParameter("userpass");   
        
        HttpSession session = request.getSession(true);  
        int [] userStatus = LoginDao.validate(n, p);
        if(userStatus[0] == 1){
        //if(LoginDao.validate(n, p)){
        	session.setAttribute("name", n);
        	session.setAttribute("userStatus", userStatus);
        	if (userStatus[2] == 0){//if not admin go to welcome page
        			RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
        			rd.forward(request,response);
        	
        	}else {//if admin go to admin Homepage
              RequestDispatcher rd=request.getRequestDispatcher("adminHome.jsp");
              rd.forward(request,response);
        	}
          
        }    
        else{    
            out.print("<p style=\"color:red\">Sorry username or password error</p>");    
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");    
            rd.include(request,response);    
        }
  
        out.close();    
    }    
}