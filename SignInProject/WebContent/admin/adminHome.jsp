<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="../header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><fmt:message key="my.admin_home"/></title>
</head>
<body>
	<h3><fmt:message key="my.hello_admin"/></h3>
	<a href="../AddItemToDB.jsp"> Add a product to database.</a>
	<br/>
 	<br/>
    <a href="../delProductsFromDB.jsp"> Remove products from database.</a>
	
		<%@ include file="../footer.jsp"%>
	
</body>
</html>