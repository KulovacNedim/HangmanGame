<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="model.User"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
</head>
<body>

	<% User user = (User) session.getAttribute("user");%>
<%-- 	<% session.setAttribute("user", user);%> --%>

<section id="container">
	
	<!-- HEADER -->
	<section id="header">
		<%@ include file="header.jsp"%>
	</section>
	
	<!-- CONTENT -->
	<section id="content">
		
	<!-- LEFT SIDE -->
		<section id="leftSide">
			<img src="images/7.png">
		</section>
		
	<!-- RIGHT SIDE -->
		<section id="rightSide">
			
			<h1>WELCOME TO MAIN MENU</h1>
			
			<a href="categoryOptionsServlet" class="btn btn-info" role="button">PLAY NEW GAME</a><br />
			<a href="dashboard" class="btn btn-info" role="button">DASHBOARD</a><br />
			<% if (user.isAdmin()) { %>
			<%@ include file="adminFunctions.jsp"%>
			<% } %>
			<a href='logout'>LOGOUT</a>
			
		</section>
		
	</section>
	
	<!-- FOOTER -->
	<section id="footer">

	</section>
</section>

</body>
</html>