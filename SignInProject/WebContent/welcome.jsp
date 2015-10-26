<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome <%=session.getAttribute("name")%></title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h3>Login successful!!!</h3>
	<h4>
		Hello,
		<%=session.getAttribute("name")%></h4>
	<%@ include file="footer.jsp"%>
</body>
</html>