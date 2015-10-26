<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*, java.util.Locale, java.util.ResourceBundle" %>
<%@ page import="javax.servlet.*,javax.servlet.http.* "%>
<%
	ResourceBundle bundle = ResourceBundle.getBundle("com.amzi.international.TestBundle");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/styles.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div id="header">
		<a href=/SignInProject/index.jsp><%bundle.getString("my.storeName"); %></a> | <a
			href=/SignInProject/signup.jsp>Not a Member?</a>
		<!-- TODO: Use the Deployment Descriptor for the URL -->
		| <a href=/SignInProject/signin.jsp>Already a Member?</a>
		<!-- TODO: Use the Deployment Descriptor for the URL -->
		| <a href="/SignInProject/about.jsp">About Us</a>
	</div>
</body>
</html>