<%-- jsp: cart
     Description: This is a page that is accessed by clicking the "add to cart" button the fullProduct.jsp,
     			  or by clicking the cart option from within the header menu. It takes the "cart" value
     			  stored in session and uses it to display the items that the current user has added to cart
     			  for potential purchase. It also allows users to purchase these items through shopify.
	 Purpose:     It displays the list of current items that are stored in cart, allowing the user to 
	 			  change the quantity of each item being purchased, and remove items from cart. 
--%>
<%@ page
	import="java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.util.concurrent.atomic.AtomicInteger"
	language="java" contentType="text/html; charset=ISO-8859-1"
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="header.jsp"%>
<%@ page
	import="java.io.*, java.util.Locale, java.util.ResourceBundle, java.text.NumberFormat"%>
<title><fmt:message key="my.cart" /></title>
</head>

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
	double num;
	
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

	String urlID = null;
	String variant = null;

	HashMap<String, AtomicInteger> cart = (HashMap<String, AtomicInteger>) session.getAttribute("cart");

	try {
		Class.forName(driver).newInstance();
		connection = DriverManager.getConnection(url + dbName, uname, pass);
	} catch (Exception e) {
		e.printStackTrace();
	}
	try {
		stmt = connection.createStatement();
		result = stmt.executeQuery("SELECT * FROM products");
		rsmd = result.getMetaData();
		columns = rsmd.getColumnCount();
		} catch(Exception e) {
			
		}
%>
<body>
	<h1>
		<fmt:message key="my.cart" />
	</h1>
	<table width="90%" border="1">
		<tr>
			<%
				try {
					for (int i = 1; i <= columns; i++) {
						/*						if (i == 1 || i == 4 || i == 6 || i == 7) {
						continue;
					}*/
					switch(i){
					case 2:
						%><th><fmt:message key="my.name" /></th><%
						break;
					case 3:
						%><th><fmt:message key="my.short_description" /></th><%
						break;
					case 5:
						%><th><fmt:message key="my.price" /></th><%
						break;
					case 6:
						%><th><fmt:message key="my.variant_id" /></th><%
						break;
					case 8:
						break;
					default:
						continue;
					}
					
					/* 
					if (i == 3) {
						out.write("<th> short description </th>");
					} else {
						out.write("<th>" + rsmd.getColumnLabel(i) + "</th>");
					} */
				}
		%>
			<th><fmt:message key="my.quantity" />
			<th><fmt:message key="my.increase" />
			<th><fmt:message key="my.decrease" />
			<th><fmt:message key="my.remove" />
		</tr>
		<%
			try {
			for (String product : cart.keySet()) {
					int productID = Integer.parseInt(product);
					pst = connection.prepareStatement("SELECT * FROM products WHERE pk_product = ?");
					pst.setString(1, product);

					result = pst.executeQuery();
					result.next();
					out.write("<tr>");
					for (int j = 1; j <= columns; j++) {
						if (j == 5){
							num = Double.parseDouble(result.getString("price"));
							out.write("<td><center>" + defaultFormat.format(num) + "</center></td>");
						}
						if (j == 1 || j == 4 || j == 5 || j == 6 || j == 7) {
							continue;
						}
						if (j == 8) {
							variant = result.getString(j);
							if (urlID != null) {
								urlID += "," + variant + ":" + cart.get(product);// + .
							} else {
								urlID = variant + ":" + cart.get(product);
							}
						}
						out.write("<td><center>" + result.getString(j) + "</center></td>");
					}

					out.write("<td><center>" + cart.get(product).toString() + "</center></td>");
					//out.write("<td><center>" + productID + "</center></td>");
					//out.write("<td><center>" + "<a href='removeFromCartServlet.java?productID=" + productID +"'>Remove</a></center></td>");
					out.write(
							"<td><center> <form action='addCartServlet' method='post'> <input type='hidden' name= 'productID' value="
									+ productID + "> <input id='text' type='submit' value='+' ></form></center></td>");

					out.write(
							"<td><center> <form action='subCartServlet' method='post'> <input type='hidden' name= 'productID' value="
									+ productID + "> <input id='text' type='submit' value='-' ></form></center></td>");
					out.write(
							"<td><center> <form action='removeFromCartServlet' method='post'> <input type='hidden' name= 'productID' value="
									+ productID
									+ "> <input id='text' type='submit' value='Remove' ></form></center></td>");
					//out.write("<td><center>" + session.getAttribute("name").toString() + "</center></td>");
					out.write("</tr>");
				}
			} catch (Exception e) {}
		try{
			out.write(urlID);
		} catch (Exception e) {}
		
			result.close();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			System.out.println("Error " + e);
		}
			urlID = "https://kingd-myshopify-com.myshopify.com/cart/" + urlID;
			out.print("<a href="+urlID+">Checkout</a>");
		%>
		<br />
		<br />
	</table>

	<%// <a href="https://kingd-myshopify-com.myshopify.com/cart/8802719557:1&9193644997:1">Permalink</a>%>

	<%@ include file="footer.jsp"%>
</body>
</html>
