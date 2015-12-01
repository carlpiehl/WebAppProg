/*
   Class: AddItemToDB
   A class that that is called by AddItemToDBServlet.java in order to connect to the "store_db" 
   database and store a new product.
   
   Functions:
   getConnection()   - establishes a connection to the "store_db" database using "root" credentials,
   									 stores it in "connection" and returns it.
   setUpProduct	()   - takes Strings "prodName", "prodDescShort", "prodDescLong", "prodPrice", "inStock", "rating"
                     and uses them to add a new product to "store_db".
   closeConnection() - closes the connection to "store_db"
 	 
   NOTE: 						 - Used http://hmkcode.com/java-mysql/ tutorial for majority of this class
*/
package com.amzi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddItemToDB {
	
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
  Function Name: setUpProduct
  Parameters: String prodName 		 - this is the name of the new product being added.
  						String prodDescShort - this is the short description of the new product being added. 
  						String prodDescLong  - this is the long description of the new product being added.
  						String prodPrice     - this is the price of the new product being added.
  						String inStock       - this is the quantity of this product that is available for purchase
  						String rating        - this is the rating of the product(10.2 decimal value is translated into stars)					
  Purpose: 		To add a new product to the "products" table within "store_db"
  */
	public void setUpProduct(String prodName, String prodDescShort, String prodDescLong, String prodPrice, String inStock, String rating ){
		
		try{
			PreparedStatement pst = 
				connection.prepareStatement("INSERT INTO products (name, descriptionShort, descriptionLong, price, quantity, rating)"
						+ "VALUES (?, ?, ?, ?, ?, ?)");
				pst.setString(1, prodName);
				pst.setString(2, prodDescShort);
				pst.setString(3, prodDescLong);
				pst.setString(4, prodPrice);
				pst.setString(5, inStock);
				pst.setString(6, rating);
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
