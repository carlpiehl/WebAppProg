<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign In</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<form action="loginServlet" method="post">
		<fieldset style="width: 300px">
			<legend><%out.print(bundle.getString("my.login_to_app"));%></legend>
			<table>
				<tr>
					<td><%out.print(bundle.getString("my.user_id"));%></td>
					<td><input type="text" name="username" required="required" /></td>
				</tr>
				<tr>
					<td><%out.print(bundle.getString("my.password"));%></td>
					<td><input type="password" name="userpass" required="required" /></td>
				</tr>
				<tr>
					<td><input type="submit" value=<%out.print(bundle.getString("my.login"));%> /></td>
				</tr>
			</table>
		</fieldset>
	</form>
	<%@ include file="footer.jsp"%>
</body>
</html>