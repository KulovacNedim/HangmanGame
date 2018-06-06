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
					
					<br class="clear"/>

				</section>
				
				<!-- RIGHT SIDE -->
				<section id="rightSide">
						
					<h1>LOGIN</h1>
				
					<form action="login" method="post" class="form">
						
						<label>Enter username: </label> 
					    <input type="text" name="username" id="username" autofocus> <br />
					  
						<label>Enter password: </label>
						<input type="password" name="password" id="password"><br /> <br />
					  
						<input class="button" type="submit" value="Login">
					 
						<a href="register"><input class="button" type="button" value="Register"></a>
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