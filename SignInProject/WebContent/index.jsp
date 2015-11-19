<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<ul>
		<li>GTX Titan X - $1000</li>
		<li>GNU/Linux - free as in freedom</li>
		<li>Leather Trench Coat XXXL, Black - $35</li>
		<li>Web Development in assembly - $25</li>
		<li>Micro$hill Botnet 10 - $100</li>
		<li>5 year old Gentoo thinkpad - $50</li>
	</ul>
	<%@ include file="footer.jsp"%>
	
</body>
</html>