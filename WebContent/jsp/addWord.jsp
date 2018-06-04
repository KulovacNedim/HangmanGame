<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page import="java.util.Iterator"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
</head>
<body class="lightGrey">
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
<%@ include file="adminButtons.jsp"%>
		</section>
		
	<!-- RIGHT SIDE -->
		<section id="rightSide">
		
		<h3>ADD WORD SECTION</h3>
			
	<form action="addWord" method="post">
		<label>Word</label> <input type="text" name="word" id="word" value=""><br />

		<select name="categoryID">

			<%
				ArrayList<Category> categories = (ArrayList) session.getAttribute("categories");
				Iterator<Category> iterator = categories.iterator();
				while (iterator.hasNext()) {
					Category category = iterator.next();
			%>
			<option value="<%=category.getCategoryID()%>"><%=category.getCategoryName()%></option>

			<%
				}
			%>

		</select> 
		
		<input type="submit" value="Save word">
	</form>
		</section>
		
	</section>
	
	<!-- FOOTER -->
	<section id="footer">
			<%
		if (request.getAttribute("wordRegSuccess") != null) {
	%>
	<%=request.getAttribute("wordRegSuccess")%><br />
	<%
		}
	%>
	</section>
</section>

</body>
</html>