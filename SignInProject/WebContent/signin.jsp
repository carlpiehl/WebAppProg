<%-- jsp: signin
     Description: This is a page that is called when pressing the "already a member"
     			  button on the top menu. The user uses this to login into either a regular
     			  user account or an admin account.
	 Function:    This page displays a username textfield and password textfield. 
	 			  It uses these  fields to grab the corresponding information 
	 			  from the user, and passes it along to loginServlet.java.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="header.jsp"%>
<link href="${pageContext.request.contextPath}/styles.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><fmt:message key="my.sign_in"/></title>
</head>
<body>
	<form action="loginServlet" method="post">
		<fieldset style="width: 300px">
			<legend><fmt:message key="my.login_to_app"/></legend>
			<table>
				<tr>
					<td><fmt:message key="my.user_id"/></td>
					<td><input type="text" name="username" required="required" /></td>
				</tr>
				<tr>
					<td><fmt:message key="my.password"/></td>
					<td><input type="password" name="userpass" required="required" /></td>
				</tr>
				<tr>
					<td><input type="submit" value=<fmt:message key="my.login"/> /></td>
				</tr>
			</table>
		</fieldset>
	</form>
	<%@ include file="footer.jsp"%>
</body>
</html>
