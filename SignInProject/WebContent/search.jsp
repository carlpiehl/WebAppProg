<%-- jsp: search
     Description: This is a page that is called when using the search bar found in the top menu. 
     			  The user can use this to quickly find an item that they are looking for 
     			  without having to make their way through the entire database.
	 Function:    This page searches the product names within the products table
	 			  in order to find products that contain the sequence of letters,
	 			  that are passed by the search bar within menu.jsp.
--%>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<html>
<head>
	<%@ include file="header.jsp"%>
	<title><fmt:message key="my.search"/></title>
</head>
<body>
	<h1><fmt:message key="my.search"/></h1>
	
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
    PreparedStatement pst = null;
    try{
        Class.forName(driver).newInstance();
        connection = DriverManager.getConnection(url + dbName, uname, pass);
      }catch(Exception e){
        e.printStackTrace();
      }
   
    String productName = request.getParameter("productName");
  	stmt = connection.createStatement();
    result = stmt.executeQuery("SELECT * FROM products WHERE name LIKE '%" + productName + "%'");
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
