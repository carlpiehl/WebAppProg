<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Page</title>
</head>
<body>
  <%
  Connection connection = null;
  String url = "jdbc:mysql://localhost:8888/";
  String dbName = "store_db";
  String driver = "com.mysql.jdbc.Driver";
  String uname = "root";
  String pass = "root";
  
  ResultSet result = null;
  PreparedStatement pst = null;
  ResultSetMetaData rsmd = null;
  int columns = 0;
  
  try{
    Class.forName(driver).newInstance();
    connection = DriverManager.getConnection(url + dbName, uname, pass);
  }catch(Exception e){
    e.printStackTrace();
  }
  
  String productID = request.getParameter("productID");
  pst = connection.prepareStatement("SELECT * FROM products WHERE pk_product = ?");
  pst.setString(1, productID);
  
  result = pst.executeQuery();
  rsmd = result.getMetaData();
  columns = rsmd.getColumnCount();
  %>
    
    
    
</body>
</html>