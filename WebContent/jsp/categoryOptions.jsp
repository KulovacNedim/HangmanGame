<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="model.Category"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Game"%>
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
	</section>
	
	<!-- CONTENT -->
	<section id="content">
		
	<!-- LEFT SIDE -->
		<section id="leftSide">
<!-- 			<img src="images/7.png"> -->
<img src="<%=game.getImagePath()%>">
		</section>
		
	<!-- RIGHT SIDE -->
		<section id="rightSide">
				<h1>Choose one of categories:</h1>
				
				
		

	<form action="newGame" method=get>
<section class="scrollWindow">
		<%
			ArrayList<Category> categories = (ArrayList) session.getAttribute("categories");
			Iterator<Category> iterator = categories.iterator();
			while (iterator.hasNext()) {
				Category category = iterator.next();
		%>
		<input class="optionList" type="radio" name="categoryString" id="searchCriteria"
			value="<%=category.getCategoryName()%>"><%=category.getCategoryName()%><br />

		<%
			}
		%>
		</section>
<input type="submit" class="button1" value="PLAY">

	</form>
	
		</section>
		
	</section>
	
	<!-- FOOTER -->
	<section id="footer">
	<% if (request.getAttribute("categoryErrorMessage") != null) { %>
		<p><%=request.getAttribute("categoryErrorMessage")%></p><br />
		<% } %>
	</section>
</section>



		
</body>
</html>