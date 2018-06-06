<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="model.User"%>
<%@page import="model.Game"%>
<%@page import="model.Category"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="https://fonts.googleapis.com/css?family=Ubuntu+Condensed|Varela+Round" rel="stylesheet"> 
		<link rel="stylesheet" href="css/style.css">
		<title>Insert title here</title>
	</head>
	
	<body class="lightGrey">

		<% Game game = (Game) session.getAttribute("game");%>

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
					<br />
					<h1>Congratulations!!!</h1>
					<h1>YOU WON!!!</h1>
					<br />
					<h3>YOUR GENERAL SCORE IS: <%= Game.getGeneralScore() %></h3>
					<br/>
					<br/>
					<a href="newGame"><input class="button1" type="button" value="PLAY NEW GAME"></a>
					<a href="welcome"><input class="button1" type="button" value="WELCOME SCREEN"></a>
					<a href="logout"><input class="button1" type="button" value="LOG OUT"></a>
				</section>
				
				<br class="clear"/>
			</section>
			
			<!-- FOOTER -->
			<section id="footer">
				<%@ include file="footer.jsp"%>
			</section>
			
		</section>
	
	</body>
</html>