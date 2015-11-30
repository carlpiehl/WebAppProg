<%-- jsp: index
     Description: This is the front page of the application. It is the first page that is displayed when
          	      the user comes to this site for the first time. 
	 Function:    This page be made to display the top 5 rated items for sale.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*, javax.sql.*, javax.naming.*, java.text.NumberFormat"%>
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<%@ include file="header.jsp"%>
	<%@ page import="java.io.*, java.util.Locale, java.util.ResourceBundle" %>
	<title><fmt:message key="my.welcome"/></title>
</head>
<body>
	
	<h3><fmt:message key="my.welcome"/></h3>
	<h3><fmt:message key="my.today's_deals"/>!!!</h3>
	<p><fmt:message key="my.list_of_deals"/></p>
	
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
		result = stmt.executeQuery("SELECT * FROM products ORDER BY rating DESC");
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
			for(int j = 0; j<5; j++){
				if (result.next()) {
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
