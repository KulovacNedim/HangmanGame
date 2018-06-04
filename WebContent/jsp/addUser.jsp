<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			
			

	<h3>ADD USER SECTION</h3>
	<form action="addUser" method="post">
		<label>Username</label> 
		<input type="text" name="username" id="username" value=""><br /> 
		<label>Password</label>
		<input type="password" name="password" id="password"  value=""><br /> 
		<input type="submit" value="Save user">
	</form>
	
		</section>
		
	</section>
	
	<!-- FOOTER -->
	<section id="footer">
		<%
		if (request.getAttribute("errorMessage") != null) {
	%>
	<%=request.getAttribute("errorMessage")%><br />
	<%
		}
	%>
	
	<%
		if (request.getAttribute("passErrorMessage") != null) {
	%>
	<%=request.getAttribute("passErrorMessage")%><br />
	<%
		}
	%>
	</section>
</section>

	




</body>
</html>