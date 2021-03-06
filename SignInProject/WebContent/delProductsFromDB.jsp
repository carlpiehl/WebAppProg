<%-- jsp: delProductsFromDB
     Description: This is a page that is called by clicking the "Remove products from database"
     			  button on "admin.jsp". It shows the full product list and lets the user 
     			  remove products from this list.
	 Function:    It then passes the required information to the DelitemFromDBServlet.java 
	 			  in order to process the product removal within the database.
--%>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<html>
<head>
	<%@ include file="header.jsp"%>
	<title><fmt:message key="my.products"/></title>
</head>
<body>
	<h1><fmt:message key="my.product_list"/></h1>
	
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
 <table width="90%" border="1">
   <tr>
   <%
      try {
         for (int i=1; i<=columns; i++) {
                  if(i == 1 || i == 4 || i == 7){
                          continue;
                  }
              out.write("<th>" + rsmd.getColumnLabel(i) + "</th>");
         }
         out.write("<th>DeleteFromDB</th>");
   %>
   </tr>
   <% 
    int productID = 0;
         while (result.next()) {
            out.write("<tr>");
            for (int i=1; i<=columns; i++){
                if(i == 1){
                        productID = Integer.parseInt(result.getString(i));
                        continue;
                }
                if(i == 2){
              out.write("<td><center>" + "<a href='fullProduct.jsp?productID=" + productID +"'>" + result.getString(i) + "</a></center>" + "</td>");
                }
                else if(i == 4 || i == 7){
                	continue;
                }else{
                        out.write("<td><center>" + result.getString(i) + "</center></td>");
                }
            }
           out.write("<td><center> <form action='DelitemFromDBServlet' method='post'> <input type='hidden' name= 'productID' value=" 
     					 + productID + "> <input id='text' type='submit' value='Delete' ></form></center></td>");
           
           out.write("</tr>");
         }
 
         // close the connection, resultset, and the statement
         result.close();
         stmt.close();
         connection.close();
      } // end of the try block
      catch (SQLException e) {
         System.out.println("Error " + e);
      }
      // ensure everything is closed
    finally {
     try {
       if (stmt != null)
        stmt.close();
       }  catch (SQLException e) {}
       try {
        if (connection != null)
         connection.close();
        } catch (SQLException e) {}
    }
   
    %>
	</table>
	<%@ include file="footer.jsp"%>
	</body>
</html>
