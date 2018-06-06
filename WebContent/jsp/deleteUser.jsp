<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page import="java.util.Iterator"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="https://fonts.googleapis.com/css?family=Ubuntu+Condensed|Varela+Round" rel="stylesheet">
		<link rel="stylesheet" href="css/style.css">
		<title>Insert title here</title>
	</head>
	
	<body class="lightGrey">
	
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
				<%@ include file="adminButtons.jsp"%>
		
					<br class="clear"/>
				</section>
				
				<!-- RIGHT SIDE -->
				<section id="rightSide">
				
					<h3>DELETE USER SECTION</h3>
					<br /><br /><br />

					<form action="search" method="post" class="form">
						<input type="search" placeholder="Search for user..." name="search"
						value="<%=session.getAttribute("searchString") == null ? "" : session.getAttribute("searchString")%>">
						<input class="button" type="submit" value="Search">
					</form>

					<form action="deleteUser" method="post" class="form">
						<select name="userID">
							<%
								ArrayList<User> searchResults = (ArrayList) session.getAttribute("searchResult");
								Iterator<User> iterator = searchResults.iterator();
								while (iterator.hasNext()) {
									User user = iterator.next();
							%>
							<option value="<%=user.getUserID()%>"><%=user.getUsername()%></option>
							<%
								}
							%>
						</select> <input class="button" type="submit" value="Delete user">
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