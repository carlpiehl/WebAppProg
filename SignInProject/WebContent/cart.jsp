<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<%@ include file="header.jsp"%>
	<%@ page import="java.io.*, java.util.Locale, java.util.ResourceBundle" %>
	<title>Cart</title>
</head>
<%
    Connection connection = null;
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "store_db";
    String driver = "com.mysql.jdbc.Driver";
    String uname = "root";
    String pass = "root";
    
    ResultSet result = null;
    Statement stmt = null;
    ResultSetMetaData rsmd = null;
    int columns = 0;
   
    try{
        Class.forName(driver).newInstance();
        connection = DriverManager.getConnection(url + dbName, uname, pass);
      }catch(Exception e){
        e.printStackTrace();
      }
   
    stmt = connection.createStatement();
    result = stmt.executeQuery("SELECT * FROM products");
    rsmd = result.getMetaData();
    columns = rsmd.getColumnCount();
 %>
<body>
	<p>
		<ul>
			<li>Item 1</li>
		</ul>
	</p>
	<%@ include file="footer.jsp"%>
</body>
</html>