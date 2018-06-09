<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="model.User"%>
<%@page import="model.Game"%>
<%@page import="model.Category" isErrorPage="false"
	errorPage="error.jsp"%>
<html>
	<head>
		<%@ include file="headContent.jsp"%>
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
						<img src="${game.imagePath}">
						
						<br class="clear"/>
					</section>
					
					<!-- RIGHT SIDE -->
					<section id="rightSide">
						<br />
						<h3>GAME OVER</h3>
						<br/>
						<br/>
						<p>Correct answer: ${game.word.word}</p>
						
						<section class="buttonContainer">
							<a href="welcome"><input class="button1" type="button" value="WELCOME SCREEN"></a>
							<a href="logout"><input class="button1" type="button" value="LOG OUT"></a>
						</section>
						
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