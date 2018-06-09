<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="model.Category"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Game"%>
<%@page import="java.util.List" isErrorPage="false"
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
						
						<h1>Choose one of categories:</h1>

						<form action="gameFlow" method=post class="optionList">
							
							<section class="scrollWindow">

								<c:forEach items="${sessionScope.categories}" var="category" varStatus="loop">
									<input  type="radio" name="categoryString" id="searchCriteria"
										value="${category.categoryName}">${category.categoryName}<br />
								</c:forEach>
								
								<br class="clear"/>
							</section>
							
							<input type="submit" class="button1" value="PLAY">
						</form>
						
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