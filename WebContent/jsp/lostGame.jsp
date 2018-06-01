<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="model.User"%>
<%@page import="model.Game"%>
<%@page import="model.Category"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
</head>
<body>

	<% Game game = (Game) session.getAttribute("game");%>

	
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
<%-- 		<% game = null;%> --%>
			<h3>YOU LOST GAME</h3>
			<p>Your general score is saved.</p>
			
			<br/>
			<br/>
			<a href="newGame"><input type="button" value="PLAY NEW GAME"></a>
			<a href="logout"><input type="button" value="LOG OUT"></a>
		</section>
		
	</section>
	
	<!-- FOOTER -->
	<section id="footer">
		fd
	</section>
</section>

	
</body>
</html>