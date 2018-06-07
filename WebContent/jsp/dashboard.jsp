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
					<img src="<%=game.getImagePath()%>">
		
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
							<%
								ArrayList<Points> arrPoints = (ArrayList) session.getAttribute("arrPoints");
								Iterator<Points> iterator = arrPoints.iterator();
								while (iterator.hasNext()) {
									Points points = iterator.next();
							%>
							<tr>
							<td><%=points.getName()%></td><td><%=points.getPoints()%></td>
							</tr>
							<%
								}
							%>
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