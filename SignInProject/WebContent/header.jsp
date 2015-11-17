<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*, java.util.Locale, java.util.ResourceBundle" %>
<%@ page import="javax.servlet.*,javax.servlet.http.* "%>

<!-- IMPORTS FOR JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%
<<<<<<< HEAD
	ResourceBundle bundle = ResourceBundle.getBundle("com.amzi.international.TestBundle");
	Locale locale = request.getLocale();
	String language = locale.getLanguage();
	String country = locale.getCountry();
=======
	Locale locale = request.getLocale();
	String language = locale.getLanguage();
	String country = locale.getCountry();
	ResourceBundle bundle = ResourceBundle.getBundle("com.amzi.international.TestBundle", locale);
>>>>>>> refs/heads/internationalization
%>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.amzi.international.TestBundle" />
<html lang="${language}">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%out.println(bundle.getString("my.store_name")); %></title>
<link href="${pageContext.request.contextPath}/styles.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div id="div_language">
		<form>
            <select id="language" name="language" onchange="submit()">
            	<option value="" ></option>
                <option value="en_US" ${language == 'en' ? 'selected' : ''}>English</option>
                <option value="fr_CA" ${language == 'fr' ? 'selected' : ''}>Francais</option>
            </select>
        </form>
	</div>
	<div id="header">
		<a href=/SignInProject/index.jsp><fmt:message key="my.store_name"/></a>
		| <a href=/SignInProject/signup.jsp><%out.println(bundle.getString("my.not_a_member") + "?"); %></a>
		| <a href=/SignInProject/signin.jsp><%out.println(bundle.getString("my.already_a_member") + "?"); %></a>
		| <a href="/SignInProject/products.jsp"><%out.println(bundle.getString("my.products")); %></a>
		| <a href="/SignInProject/cart.jsp">Cart</a>
	</div>
	<div id="content">
</body>
</html>