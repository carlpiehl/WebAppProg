//Used http://hmkcode.com/java-mysql/ tutorial for majority of this
package com.amzi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DelitemFromDB {
	
	Connection connection = null;
	
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
	
	//probably make this boolean or something to indicate success or failure, for now no email check
	public void delProduct(String prodID){
		/*"A ResultSet object maintains a cursor pointing to its current row of data.
		 * Initially the cursor is positioned before the first row.
		 * The next method moves the cursor to the next row, and because it returns false 
		 * when there are no more rows in the ResultSet object, it can be used in a while loop
		 * to iterate through the result set.
		 */
		//TODO: Ensure email (primary key) does not already exist (use ResultSet)
		//TODO: If email exists, set return value and error checking in SignupServlet
		//TODO: Consider adding unique ID, might not be necessary
		//TODO: 
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
