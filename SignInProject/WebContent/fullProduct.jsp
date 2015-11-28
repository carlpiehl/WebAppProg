<%-- jsp: fullProduct
     Description: This is a page that is called by clicking on one of the products listed in product.jsp
     			  or on the links presented when using search.jsp. It is used to show more information
     			  about product that catches a user's interest, as well as allows the user to be able to 
     			  add this product to cart.
	 Function:    It takes productID that is handed to it by one of the above mentioned classes,
	 			  then uses it to search for a product within the products table and displays
	 			  all of the information regarding this product that is stored within the database.
	 			  It also has an "add to cart" link that passes the productID to addCartServlet.java.
--%>
<%@page
	import="com.sun.xml.internal.ws.policy.privateutil.PolicyUtils.IO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*, javax.sql.*, javax.naming.*, java.text.NumberFormat"%>
<html>
<head>
<%@ include file="header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><fmt:message key="my.product_page" /></title>
</head>
<body>
	<%
	Locale french = new Locale("fr", "CA");
	NumberFormat defaultFormat = NumberFormat.getCurrencyInstance();
	String reqLang = request.getParameter("language");
	if (reqLang == null) {
		reqLang = "en_US";
	}
	try {
		if (reqLang.equals("fr_CA")) {
			defaultFormat = NumberFormat.getCurrencyInstance(french);
		}
	} catch (Exception e) {
		
	}
  
  Connection connection = null;
  String url = "jdbc:mysql://localhost:3306/";
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
  try {
	  result = pst.executeQuery();
	  rsmd = result.getMetaData();
	  columns = rsmd.getColumnCount();
	  while(result.next()){
      	out.write("<h1>");
      	out.write(result.getString("name"));
      	out.write("</h1>");
      	out.write("<div id=\"productDesk\">");
      	out.write(result.getString("descriptionShort"));
      	out.write("<br/>");
      	int stars = (int) result.getFloat("rating");
      	int i;
      	for (i = 0; i < stars ; i++){ 
      		out.write("<img src=\"images/star.png\"/>");
      	}
      	for (; i < 5; i++){
      		out.write("<img src=\"images/antistar.png\"/>");
      	}
		double num = Double.parseDouble(result.getString("price"));
      	out.write("<br/>Price: "+ defaultFormat.format(num) + " and free shipping over " + defaultFormat.format(50));
      	out.write("<br/><p>");
      	out.write(result.getString("descriptionLong"));
      	out.write("</p>");
      }
  	result.close();
  	pst.close();
  	connection.close();
  } //end of try block
      catch(SQLException e){
          System.out.println("Error " + e);
      }
      finally{
          try{
              if(pst != null){
                  pst.close();
              }
          }catch(SQLException e){}
              try{
                  if(connection != null){
                      connection.close();
              }
      }catch(SQLException e){}
  }
    %>
	<div id="addToCart">
		<form action="addCartServlet" method="post">
			<input type="hidden" name="productID" value="<%=productID%>">
			<input id="cartButton" type="submit" value="add to cart">
		</form>
	</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
