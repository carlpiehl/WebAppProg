<%@ page
	import="java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.util.concurrent.atomic.AtomicInteger"
	language="java" contentType="text/html; charset=ISO-8859-1"
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ include file="header.jsp"%>
<%@ page import="java.io.*, java.util.Locale, java.util.ResourceBundle"%>
<title><fmt:message key="my.cart" /></title>
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

	String urlID = null;
	String variant = null;

	HashMap<String, AtomicInteger> cart = (HashMap<String, AtomicInteger>) session.getAttribute("cart");

	try {
		Class.forName(driver).newInstance();
		connection = DriverManager.getConnection(url + dbName, uname, pass);
	} catch (Exception e) {
		e.printStackTrace();
	}

	stmt = connection.createStatement();
	result = stmt.executeQuery("SELECT * FROM products");
	rsmd = result.getMetaData();
	columns = rsmd.getColumnCount();
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
						if (i == 1 || i == 4 || i == 6 || i == 7) {
							continue;
						}
						if (i == 3) {
							out.write("<th> short description </th>");
						} else {
							out.write("<th>" + rsmd.getColumnLabel(i) + "</th>");
						}
					}
					out.write("<th> quantity </th>");
					out.write("<th> increase </th>");
					out.write("<th> decrease </th>");
					out.write("<th> Remove </th>");
			%>
		</tr>
		<%
			for (String product : cart.keySet()) {
					int productID = Integer.parseInt(product);
					pst = connection.prepareStatement("SELECT * FROM products WHERE pk_product = ?");
					pst.setString(1, product);

					result = pst.executeQuery();
					result.next();
					out.write("<tr>");
					for (int j = 1; j <= columns; j++) {
						if (j == 1 || j == 4 || j == 6 || j == 7) {
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

				result.close();
				stmt.close();
				connection.close();
			} catch (SQLException e) {
				System.out.println("Error " + e);
			}
			urlID = "https://kingd-myshopify-com.myshopify.com/cart/" + urlID;
			out.print("<a href="+urlID+">Checkout</a>");
		%>
		<br/>
		<br/>
	</table>

  <%// <a href="https://kingd-myshopify-com.myshopify.com/cart/8802719557:1&9193644997:1">Permalink</a>%>

	<%@ include file="footer.jsp"%>
</body>
</html>
