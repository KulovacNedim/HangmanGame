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
			<img src="<%=game.getImagePath()%>">
		</section>
		
	<!-- RIGHT SIDE -->
		<section id="rightSide">
			
			<p>You are logged as: ${game.user.username}</p>
			<p>Your current score: ${game.score}</p>
			<p>Word category: ${game.category.categoryName}</p>
			<p>Misses: ${game.misses}</p>
			<br/>
			<p>WORD: ${game.solutionPlaceholder}</p>
			<br/>
			<p>USED LETTERS: ${game.usedLetters}</p>
			
			<form action="game" method="post">
		<label>Enter letter or whole word </label> 
		<input type="text" name="letter" id="letter"><br /> 

		
		<input type="submit" value="ENTER">
	</form>
			
		</section>
		
	</section>
	
	<!-- FOOTER -->
	<section id="footer">
		<p>word: ${game.word.word} (for demonstration purpouse only - delete when app is complited)</p>
		<% if (request.getAttribute("emptyInputErrorMessage") != null) { %>
	<p><%=request.getAttribute("emptyInputErrorMessage")%></p><br />
	<% } %>
	
	<% if (request.getAttribute("letterUsedErrorMessage") != null) { %>
	<p><%=request.getAttribute("letterUsedErrorMessage")%></p><<br />
	<% } %>
	</section>
</section>
	
</body>
</html>