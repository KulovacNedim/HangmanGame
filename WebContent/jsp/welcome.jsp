<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="model.User"%>
<%@page import="model.Game"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Ubuntu+Condensed|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
</head>
<body class="lightGrey">

	<% User user = (User) session.getAttribute("user");%>
	<% Game game = (Game) session.getAttribute("game");%>
	
<%-- 	<% session.setAttribute("user", user);%> --%>

<section id="container">
	
	<!-- HEADER -->
	<section id="header">
		<%@ include file="header.jsp"%>
		<br class="clear"/>
	</section>
	
	<!-- CONTENT -->
	<section id="content">
		
	<!-- LEFT SIDE -->
		<section id="leftSide">
		<img src="<%=game.getImagePath()%>">
		<br class="clear"/>
		</section>
		
	<!-- RIGHT SIDE -->
		<section id="rightSide">
			
			<h1>WELCOME TO MAIN MENU</h1>
			<br /><br /><br /><br /><br />
<!-- 			<a href="categoryOptionsServlet" class="button" role="button">PLAY NEW GAME</a><br /><br /><br /> -->
			<a href="categoryOptionsServlet"><input class="button1" type="button" value="PLAY NEW GAME">
<!-- 			<a href="dashboard" class="button" role="button">DASHBOARD</a><br /><br /><br /> -->
			<a href="dashboard"><input class="button1" type="button" value="DASHBOARD">
			<% if (user.isAdmin()) { %>
			<%@ include file="adminFunctions.jsp"%>
			<% } %>
<!-- 			<a href='logout'class="button" >LOGOUT</a> -->
			<a href="logout"><input class="button1" type="button" value="LOGOUT">
		
			<br class="clear"/>
		</section>
		<br class="clear"/>
	</section>
	
	<!-- FOOTER -->
	<section id="footer">

	</section>
</section>

</body>
</html>