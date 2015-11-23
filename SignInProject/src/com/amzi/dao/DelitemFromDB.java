/*
   Class: DelitemFromDB
   A class that that is called by DelitemFromDBServlet.java in order to connect to the "store_db" 
   database and delete a product.
   
   Functions:
   getConnection()   - establishes a connection to the "store_db" database using "root" credentials,
   									 stores it in "connection" and returns it.
   delProduct ()		 - takes Strings "prodID", and uses it to delete a product from "store_db".
 	 closeConnection() - closes the connection to "store_db"
 	 
   NOTE: 						 - Used http://hmkcode.com/java-mysql/ tutorial for majority of this class
*/
package com.amzi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DelitemFromDB {
	
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
  Parameters: String prodID - the product id used to identify which product to delete					
  Purpose: 		To delete an entry from "products" table within "store_db" that 
  						corresponds to the given product ID
  */
	public void delProduct(String prodID){
		try{
			PreparedStatement pst = 
				connection.prepareStatement("DELETE FROM products where pk_product=?");
				pst.setString(1,prodID);
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
