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
			
			<div class="alignRight">
			<p>Player: ${game.user.username}</p>
			<p>Game score: ${game.score}</p>
			</div>
			<div class="alignLeft">
			<p>Word category: ${game.category.categoryName}</p>
			<p class="smallFont">MISSES: ${game.misses}</p>
			<p class="smallFont">USED LETTERS: ${game.usedLetters}</p>
			</div>
			
			<p class="word">${game.solutionPlaceholder}</p>
			
			
			<form action="game" method="post" class="form">
				<label>Enter letter or whole word:  </label> 
				<input type="text" name="letter" id="letter" autocomplete="off" autofocus><br /> 
		
				<input class="button" type="submit" value="ENTER">
			</form>
			
			
			
			<br class="clear"/>
		</section>
		<br class="clear"/>
	</section>
	
	<!-- FOOTER -->
	<section id="footer">
		
		<% if (request.getAttribute("emptyInputErrorMessage") != null) { %>
	<p><%=request.getAttribute("emptyInputErrorMessage")%></p><br />
	<% } %>
	
	<% if (request.getAttribute("letterUsedErrorMessage") != null) { %>
	<p><%=request.getAttribute("letterUsedErrorMessage")%></p><<br />
	<% } %>
	</section>
</section>
	
	<div id="demo">
		<p>word: ${game.word.word} (for demonstration purpose only - delete when app is complited)</p>
	</div>
</body>
</html>