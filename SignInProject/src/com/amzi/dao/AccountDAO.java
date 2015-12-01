/*
   Class: AccountDAO
   A class that that is called by SignupServlet.java in order to connect to the "store_db" 
   database and store a new user.
   
   Functions:
   getConnection()   - establishes a connection to the database using "root" credentials,
   									 stores it in "connection" and returns it.
   signUp	()  		   - takes Strings "uname", "email", and "pass" from SignupServlet.java  
 									   and uses them to add a new user to "store_db".
 	 closeConnection() - closes the connection to store_db
 	 
   NOTE: 						 - Used http://hmkcode.com/java-mysql/ tutorial for majority of this class
*/
package com.amzi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO {
	
	Connection connection = null;

	/*
  Function Name: getConnection
  Parameters: String url    - this is used to connect to the local mySQL server
							String dbName - this is used to access the correct database
							String driver - this is used to run the correct driver
							String uname  - this is used to store the username credential for accessing the database
							String pass   - this is used to store the password credential for accessing the database
  Purpose: 		To establish a connection to the database
  */
	public Connection getConnection(){
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "store_db";
		String driver = "com.mysql.jdbc.Driver";
		String uname = "root";
		String pass = "root";
		
		try{
			Class.forName(driver).newInstance();
			connection = DriverManager.getConnection(url + dbName, uname, pass);
		}catch(Exception e){ //Note, ClassNotFoundException caused error. Ask about this
			e.printStackTrace();
		}
		//Question: is this excessive / redundant, if we have a closeConnection method?
		return connection;
	}
	
	/*
  Function Name: signUP
  Parameters: String uname - this is the username of the new user being added.
  						String email - this is the email address of the new user being added,
  						String pass  - this is the password of the new user being added.
  Purpose: 		To add a new user to the "users" table within "store_db"
  */
	public void signUp(String uname, String email, String pass){

		//TODO: Ensure email (primary key) does not already exist (use ResultSet)
		//TODO: If email exists, set return value and error checking in SignupServlet
		//TODO: Consider adding unique ID, might not be necessary
		try{
			PreparedStatement pst = 
				connection.prepareStatement("INSERT INTO users (uname, email, pass) VALUES (?, ?, ?)");
				pst.setString(1, uname);
				pst.setString(2, email);
				pst.setString(3, pass);
				pst.execute();
			//can assign rs.next() to boolean for checking, with email query
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	
	/*
  Function Name: closeConnection
  Parameters: none
  Purpose: 		To close the connection to the database
  						that was established in getConnection
  */
	public void closeConnection(){
		if(connection != null){
			try{
				connection.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
}
