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
	<%@ include file="footer.jsp"%>
</body>
</html>