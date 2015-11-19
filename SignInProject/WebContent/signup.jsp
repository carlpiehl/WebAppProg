<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<%@ include file="header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><fmt:message key="my.sign_up" /></title>
</head>
<body>
	<form action="signupServlet" method="post">
		<fieldset style="width: 300px">
			<legend><fmt:message key="my.sign_up"/></legend>

			<table>
				<tr>
					<td><fmt:message key="my.username"/>:</td>
					<td><input type="text" name="uname" required="required" /></td>
				</tr>
				<tr>
					<td><fmt:message key="my.email"/>:</td>
					<td><input type="email" name="uemail" required="required" /></td>
				</tr>
				<tr>
					<td><fmt:message key="my.password"/>:</td>
					<td><input type="password" name="upass" required="required" /></td>
					<%-- add password confirmation--%>
				</tr>
				<tr>
					<td><input type="submit" value=<fmt:message key="my.sign_up_label"/> /></td>
				</tr>
			</table>
		</fieldset>
	</form>
	<%@ include file="footer.jsp"%>
</body>
</html>
