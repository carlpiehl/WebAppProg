<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="imports.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/styles.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div id="header">
		<a href=/SignInProject/index.jsp><%out.println(bundle.getString("my.store_name")); %></a>
		| <a href=/SignInProject/signup.jsp><%out.println(bundle.getString("my.not_a_member") + "?"); %></a>
		| <a href=/SignInProject/signin.jsp><%out.println(bundle.getString("my.already_a_member") + "?"); %></a>
		| <a href="/SignInProject/about.jsp"><%out.println(bundle.getString("my.about_us")); %></a>
	</div>
</body>
</html>