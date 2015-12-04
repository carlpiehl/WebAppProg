<%-- jsp: products.jsp
     Description: This page is called by clicking on the products button within the top menu.
     			  It is meant to show to the user all of the products that the money store sell
     			  allow the user to browse the inventory. 
	 Function:    This page shows a list of all products stored in the products table and the most relevant
	 			  information related to sale of each (such as quantity in stock, price and a short description). 
	 			  Each product name functions as a link that calls fullProduct.jsp with the productId, that is
	 			  associated to each name.
--%>

<%@page
	import="java.sql.*, javax.sql.*, javax.naming.*, java.text.NumberFormat"%>
<html>
<head>
<%@ include file="header.jsp"%>
<title><fmt:message key="my.products" /></title>
</head>
<body>
	<h1>
		<fmt:message key="my.product_list" />
	</h1>

	<%
		Locale french = new Locale("fr", "CA");
		NumberFormat defaultFormat = NumberFormat.getCurrencyInstance();

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
	<table width="90%" border="1">
		<tr>
			<%
				try {
					for (int i = 1; i <= columns; i++) {
/*						if (i == 1 || i == 4 || i == 7) {	// USEFULL FOR DEBUGGING : CARLs
							continue;
						} */
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
								%><th><fmt:message key="my.quantity" /></th><%
								break;
							case 8:
								%><th><fmt:message key="my.variant_id" /></th><%
								break;
							default:
								continue;
						}
						//out.write("<th>" + rsmd.getColumnLabel(i) + "</th>");  // USEFULL FOR DEBUGGING : CARL
					}
			%>
		</tr>
		<%
			int productID = 0;
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
				while (result.next()) {
					out.write("<tr>");
					for (int i = 1; i <= columns; i++) {
						if (i == 1) {
							productID = Integer.parseInt(result.getString(i));
							continue;
						}
						if (i == 2) {
							out.write("<td><center>" + "<a href='fullProduct.jsp?productID=" + productID + "&language=" + request.getParameter("language") + "'>"
									+ result.getString(i) + "</a></center>" + "</td>");
						} else if (i == 4) {
							double num = Double.parseDouble(result.getString(i + 1));
							out.write("<td><center>" + defaultFormat.format(num) + "</center></td>");
						} else if (i == 5 || i == 7) {
							continue;
						} else {
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
				} catch (SQLException e) {
				}
				try {
					if (connection != null)
						connection.close();
				} catch (SQLException e) {
				}
			}
		%>
	</table>
	<%@ include file="footer.jsp"%>
</body>
</html>
