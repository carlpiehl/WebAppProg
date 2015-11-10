<%@ page import="java.sql.*, javax.sql.*, javax.naming.*, java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
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
    PreparedStatement pst = null;
    Statement stmt = null;
    ResultSetMetaData rsmd = null;
    int columns = 0;
   
    ArrayList<String> cart = (ArrayList<String>)session.getAttribute("cart");
    
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
	<table width="90%" border="1">
		 <tr>
		 <%
		   try{
		     for(int i=1; i<=columns; i++){
		    	 if(i == 1 || i == 4 || i == 6 || i == 7){
		    		 continue;
		    	 }
		    	 if(i == 3){
		    		 out.write("<th> short description </th>");
		    	 }
		    	 else{
		    		 out.write("<th>" + rsmd.getColumnLabel(i) + "</th>"); 
		    	 }
		     }
		     %>
		</tr>
		<%
		 for(int i = 0; i < cart.size(); i++){
			 pst = connection.prepareStatement("SELECT * FROM products WHERE pk_product = ?");
			 pst.setString(1, cart.get(i));
			 
			 result = pst.executeQuery();
			 result.next();
			 out.write("<tr>");
			 for(int j=1; j <= columns; j++){
				 if(j == 1 || j == 4 || j == 6 || j == 7){
					 continue;
				 }
				 out.write("<td><center>" + result.getString(j) + "</center></td>");
			 }
			 out.write("</tr>");
		 }
		 
		 result.close();
		 stmt.close();
		 connection.close();
		   }catch(SQLException e){
			   System.out.println("Error " + e);
		   }
		 %>	
  </table>
	
	<%@ include file="footer.jsp"%>
</body>
</html>