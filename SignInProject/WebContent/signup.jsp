<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<form action="signupServlet" method="post">
		<fieldset style="width: 300px">
			<legend><%out.print(bundle.getString("my.sign_up"));%></legend>

			<table>
				<tr>
					<td><%out.print(bundle.getString("my.username"));%>:</td>
					<td><input type="text" name="uname" required="required" /></td>
				</tr>
				<tr>
					<td><%out.print(bundle.getString("my.email"));%>:</td>
					<td><input type="email" name="uemail" required="required" /></td>
				</tr>
				<tr>
					<td><%out.print(bundle.getString("my.password"));%>:</td>
					<td><input type="password" name="upass" required="required" /></td>
					<%-- add password confirmation--%>
				</tr>
				<tr>
					<td><input type="submit" value=<%out.print(bundle.getString("my.sign_up_label"));%> /></td>
				</tr>
			</table>
		</fieldset>
	</form>
	<%@ include file="footer.jsp"%>
</body>
</html>