<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="model.User"%>
<%@page import="model.Game"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Points" isErrorPage="false"
	errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					
					<h1>TOP 10 SCORES:</h1>
					
					<section class="scrollWindow">
					
						<table class="table">
							<tr>
							<td>USER</td><td>SCORE</td>
							</tr>
							
							<c:forEach items="${sessionScope.arrPoints}" var="arrPoints" varStatus="loop">
							
								<tr>
								<td>${arrPoints.name}</td><td>${arrPoints.points}</td>
								</tr>
							
							</c:forEach>
							
						</table>
					</section>
				
					<a href="welcome"><input class="button1" type="button" value="WELCOME SCREEN"></a>
				
					<br class="clear"/>
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