/*
   Class: LoginDao
   A class that that is called by LoginServlet.java in order to connect to the "store_db" 
   database and determine whether a user has an account. It is also used to grab the 
   userID, and the admin flag, all of which is stored together in the "userStatus" int array.
   It is also called by SignupServlet.java to grab a new user's userID and admin flag.
   
   Functions:
   validate()        - establishes a connection to the "store_db" database using "root" credentials,
   									 - stores it in "conn", 
   									 - sends a query asking to find a user with the given username stored in String "name" 
   									   and the given password stored in String "pass" 	 
   									 - uses the results to determine whether a username exist with the corresponding password
   									 - if so, then the class returns a userStatus array with [0] = 1, [1] = userId, [2] = adminFlag
   								   - if not, then the class returns a userStatus array with [0] = 0, [1] = 0, [2] = 0
   
   NOTE: 						 - Used http://hmkcode.com/java-mysql/ tutorial for majority of this class
*/
package com.amzi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {//boolean
	public static int[] validate(String name, String pass) {
		boolean status = false;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "store_db";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root";
		String password = "root";
		int [] userStatus = new int [3];
		try {
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url + dbName, userName, password);

			pst = conn.prepareStatement("select * from users where uname=? and pass=?");
			pst.setString(1, name);
			pst.setString(2, pass);

			rs = pst.executeQuery();
			status = rs.next();
			userStatus[1] = rs.getInt("pk_user");
			userStatus[2] = rs.getInt("is_admin");


		} catch (Exception e) {
			System.out.println(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		if (status){
			userStatus[0] = 1;
		}else{
			userStatus[0] = 0;
		}
		return userStatus;
		//return status;
	}
}