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
				<%@ include file="adminButtons.jsp"%>
				
				<br class="clear"/>
			</section>
			
			<!-- RIGHT SIDE -->
			<section id="rightSide">

				<h3>ADD USER SECTION</h3>
				<br />
				
				<form action="addUser" method="post" class="form">
					<label>Username</label> 
					<input type="text" name="username" id="username" value=""><br /> 
					<label>Password</label>
					<input type="password" name="password" id="password"  value=""><br /> 
					<input class="button" type="submit" value="Save user">
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