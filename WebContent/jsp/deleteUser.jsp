<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page import="java.util.Iterator"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
</head>
<body>
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
			<p>Search for user</p>
	<form action="search" method="post">


		<input type="search" placeholder="Search for user..." name="search"
			value="<%=session.getAttribute("searchString") == null ? "" : session.getAttribute("searchString")%>">
		<input type="submit" value="Search">
	</form>

	<form action="deleteUser" method="post">
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

			
		</select> <input type="submit" value="DELETE USER">
	</form>
		</section>
		
	</section>
	
	<!-- FOOTER -->
	<section id="footer">
		<%
		if (request.getAttribute("userDelSuccess") != null) {
	%>
	<%=request.getAttribute("userDelSuccess")%><br />
	<%
		}
	%>
	</section>
</section>



	




</body>
</html>