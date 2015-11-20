<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<form action="AddItemToDBServlet" method="post">
		<fieldset style="width: 400px">
			<legend><%out.print("Enter new Item");%></legend>

			<table>
				<tr>
					<td><%out.print("Product Name:");%>:</td>
					<td><input type="text" name="prodName" required="required" /></td>
				</tr>
				<tr>
					<td><%out.print("Product Short Description");%>:</td>
					<td><input type="text" name="prodDescShort" required="required" /></td>
				</tr>
				<tr>
					<td><%out.print("Product Long Description");%>:</td>
					<td><input type="text" name="prodDesLong" required="required" /></td>
					<%-- add password confirmation--%>
				</tr>
				<tr>
					<td><%out.print("Product Price (10.2 decimal value only)");%>:</td>
					<td><input type="text" name="prodPrice" required="required" /></td>
				</tr>
				<tr>
					<td><%out.print("Quantity that will be available for purchase (int value only)");%>:</td>
					<td><input type="text" name="inStock" required="required" /></td>
				</tr>
				<tr>
					<td><%out.print("Rating ( 2.1 decimal value only)");%>:</td>
					<td><input type="text" name="rating" required="required" /></td>
				</tr>
				<tr>
					<td><input type="submit" value=<%out.print("submit");%> /></td>
				</tr>
			</table>
		</fieldset>
	</form>
	<%@ include file="footer.jsp"%>
</body>
</html>