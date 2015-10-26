<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<html>
<head>
<title>Using a DataSource</title>
</head>
<body>
<h1>Using a DataSource</h1>
<%
    Connection connection = null;
    String url = "jdbc:mysql://localhost:8888/";
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
      }catch(Exception e){ //Note, ClassNotFoundException caused error. Ask about this
        e.printStackTrace();
      }
   
    stmt = connection.createStatement();
    result = stmt.executeQuery("SELECT * FROM products");
    rsmd = result.getMetaData();
    columns = rsmd.getColumnCount();
 %>
 <table width="90%" border="1">
   <tr>
   <% // write out the header cells containing the column labels
      try {
         for (int i=1; i<=columns; i++) {
                  if(i == 1){
                          continue;
                  }
              out.write("<th>" + rsmd.getColumnLabel(i) + "</th>");
         }
   %>
   </tr>
   <% // now write out one row for each entry in the database table
    int productID = 0;
         while (result.next()) {
            out.write("<tr>");
            for (int i=1; i<=columns; i++){
                if(i == 1){
                        productID = Integer.parseInt(result.getString(i));
                        continue;
                }
                if(i == 2){
              out.write("<td>" + "<a href='fullProduct.jsp?productID=" + productID +"'>" + result.getString(i) + "</a>" + "</td>");
                }
                else{
                        out.write("<td>" + result.getString(i) + "</td>");
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
</body>
</html>