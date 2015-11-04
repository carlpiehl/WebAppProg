<!-- 
	Author: ONLINE STORE
	
	footer.jsp
	
		This file is appended to the bottom of pages designed to be the main content of the page.
		
	NOTES:
		CARL: 'bundle' is not resolved in this page. It is declared in 'imports.jsp'. This shows an error,
	but will still run just fine. Cannot declare 'bundle' again because duplicates also cause errors
 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*, java.util.Locale, java.util.ResourceBundle" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<p>
	<div id="copyright">© 2015 <%out.print(bundle.getString("my.copyright"));%></div> <!-- IGNORE bundle not resolved (CARL) -->
	</p>
</body>
</html>