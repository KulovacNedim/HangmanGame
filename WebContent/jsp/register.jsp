<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			<img src="images/6.png">
			<br class="clear"/>
		</section>
		
	<!-- RIGHT SIDE -->
		<section id="rightSide">
		
		<h1>USER REGISTER</h1>
		
		<form action="register" method="post" class="form">
			 
			    <label>Enter username: </label> 
			    <input type="text" name="username" id="username" value="<%= request.getAttribute("username") == null ? "" : request.getAttribute("username")%>">
			 
			    <label>Enter password: </label>
			    <input type="password" name="password" id="password"  value="<%= request.getAttribute("password") == null ? "" : request.getAttribute("password")%>">
			    <br /> <br />
			    <input class="button" type="submit" value="Register">

			     <a href="login"><input class="button" type="button" value="GO TO LOGIN PAGE"></a>

			</form>
			
<!-- 			<form action="register" method="post"> -->
<!-- 			<table  class="loginTable"> -->
<!-- 			  <tr> -->
<!-- 			    <td colspan="2">USER REGISTER</td> -->
<!-- 			  </tr> -->
<!-- 			  <tr> -->
<!-- 			    <td><label>Enter username: </label> </td> -->
<%-- 			    <td><input type="text" name="username" id="username" value="<%= request.getAttribute("username") == null ? "" : request.getAttribute("username")%>"><br /> </td> --%>
<!-- 			  </tr> -->
<!-- 			  <tr> -->
<!-- 			    <td><label>Enter password: </label></td> -->
<%-- 			    <td><input type="password" name="password" id="password"  value="<%= request.getAttribute("password") == null ? "" : request.getAttribute("password")%>"><br /> </td> --%>
<!-- 			  </tr> -->
<!-- 			  <tr> -->
<!-- 			    <td colspan="2"><input type="submit" value="Register"></td> -->
<!-- 			  </tr> -->
<!-- 			  <tr> -->
<!-- 			    <tr> -->
<!-- 			      <td colspan="2"><a href="login"><input type="button" value="GO TO LOGIN PAGE"></a></td> -->
<!-- 			  </tr> -->
<!-- 			  </tr> -->
<!-- 			</table> -->
<!-- 			</form> -->
			<br class="clear"/>
		</section>
		<br class="clear"/>
	</section>
	
	<!-- FOOTER -->
	<section id="footer">
		<% if (request.getAttribute("errorMessage") != null) { %>
		<p><%=request.getAttribute("errorMessage")%></p><br />
		<% } %>
		<% if (request.getAttribute("passErrorMessage") != null) { %>
		<p><%=request.getAttribute("passErrorMessage")%></p><br />
		<% } %>
		
	</section>
	
</section>

	
</body>
</html>