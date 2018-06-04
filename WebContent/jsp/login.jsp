<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Ubuntu+Condensed|Varela+Round" rel="stylesheet"> 
<link rel="stylesheet" href="css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hangman - Login</title>
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
		</section>
		
	<!-- RIGHT SIDE -->
		<section id="rightSide">
		
			<form action="login" method="post">
			
			 
			    <h1>LOGIN</h1>
			 
			  
			    <label>Enter username: </label> 
			   <input type="text" name="username"
			id="username"> <br />
			  
			    <label>Enter password: </label>
			    <input
			type="password" name="password" id="password"><br /> <br />
			  
			    <input class="button"
			type="submit" value="Login">
			 
			    <a href="register"><input class="button" type="button" value="Register"></a>
			  
			
		</form>
			
<!-- 			<form action="login" method="post"> -->
<!-- 			<table class="loginTable"> -->
<!-- 			  <tr> -->
<!-- 			    <td colspan="2"><h1>LOGIN</h1><br /><br /></td> -->
<!-- 			  </tr> -->
<!-- 			  <tr> -->
<!-- 			    <td><label>Enter username: </label> </td> -->
<!-- 			    <td><input type="text" name="username" -->
<!-- 			id="username"> <br /></td> -->
<!-- 			  </tr> -->
<!-- 			  <tr> -->
<!-- 			    <td><label>Enter password: </label></td> -->
<!-- 			    <td><input -->
<!-- 			type="password" name="password" id="password"><br /> <br /></td> -->
<!-- 			  </tr> -->
<!-- 			  <tr> -->
<!-- 			    <td colspan="2"><input -->
<!-- 			type="submit" value="Login"><br /> <br /><br /> <br /></td> -->
<!-- 			  </tr> -->
<!-- 			  <tr> -->
<!-- 			    <td colspan="2"><a href="register"><input type="button" value="Register"></a></td> -->
<!-- 			  </tr> -->
<!-- 			</table> -->
<!-- 		</form> -->
			<br class="clear"/>
		</section>
		<br class="clear"/>
	</section>
	
	<!-- FOOTER -->
	<section id="footer">
		
		<% if (request.getAttribute("loginErrorMessage") != null) { %>
		<p><%=request.getAttribute("loginErrorMessage")%></p><br />
		<% } %>
		<% if (request.getAttribute("registerSuccess") != null) { %>
		<p><%=request.getAttribute("registerSuccess")%></p><br />
		<% } %>
	</section>
</section>

	
	
</body>
</html>