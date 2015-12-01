<%-- jsp: adminHome
     Description: This is a page that is called by LoginServlet.java, when the user logs into an
     			  admin account. It is used in order to allow admin users to access the 
     			  AddItemToDB.jsp and the delProductFromDB.jsp that are not meant to be available 
     			  to regular users.
	 Function:     It displays text buttons that allow access to the tools mentioned above.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><fmt:message key="my.admin_home"/></title>
</head>
<body>
	
    <% int [] userStatus = (int []) session.getAttribute("userStatus");
    try{
    	if (userStatus[2] == 1){
    		%>
    		<h3><fmt:message key="my.hello_admin"/></h3>
    		<a href="AddItemToDB.jsp"><fmt:message key="my.add_product_to_database"/></a>
			<br/>
 			<br/>
    		<a href="delProductsFromDB.jsp"><fmt:message key="my.remove_product_from_database"/></a>
    		<%
    	}else{
    		%><h3><fmt:message key="my.you_are_not_admin"/></h3><%
    	}
    	
    } catch(Exception e){
    	%><h3><fmt:message key="my.you_are_not_admin"/></h3><%
    }
    %>
    
	
	
	
		<%@ include file="footer.jsp"%>
	
</body>
</html>