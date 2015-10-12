<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Application</title>
</head>
<body>
	<form action="loginServlet" method="post">
		<fieldset style="width: 300px">
			<legend> Login to App </legend>
			<table>
				<tr>
					<td>User ID</td>
					<td><input type="text" name="username" required="required" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="userpass" required="required" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Login" /></td>
				</tr>
			</table>
		</fieldset>
	</form>
	
	<form action="signupServlet" method="post">
		<fieldset style="width: 300px">
			<legend> Sign Up </legend>
			
			<table>
				<tr>
					 <td>Username:</td>
					 <td><input type="text" name="uname" required="required" /></td>
				</tr>
				<tr>
				   <td>Email:</td>
           <td><input type="email" name="uemail" required="required" /></td>
        </tr>
        <tr>
					 <td>Password:</td>
					 <td><input type="password" name="upass" required="required" /></td>
					 <%-- add password confirmation--%>
				</tr>
				<tr>
					 <td><input type="submit" value="Sign Up" /></td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>