<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="model.User"%>
<%@page import="model.Game"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Points"%>
<%@page import="java.util.Iterator"%>
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
			
			<table>
			<tr>
			<td>User</td><td>Points</td>
			</tr>
			<%
				ArrayList<Points> arrPoints = (ArrayList) session.getAttribute("arrPoints");
				Iterator<Points> iterator = arrPoints.iterator();
				while (iterator.hasNext()) {
					Points points = iterator.next();
			%>
			
			<tr>
			<td><%=points.getUserID()%></td><td><%=points.getPoints()%></td>
			</tr>
			<%
				}
			%>
			
			
			</table>
		
		</section>
		
	</section>
	
	<!-- FOOTER -->
	<section id="footer">
		fd
	</section>
</section>

	
</body>
</html>