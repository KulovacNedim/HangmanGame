<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<%@ include file="headContent.jsp"%>
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
							<input type="text" name="username" id="username" value="<%= request.getAttribute("username") == null ? "" : request.getAttribute("username")%>"  autofocus>
							 
							<label>Enter password: </label>
							<input type="password" name="password" id="password"  value="<%= request.getAttribute("password") == null ? "" : request.getAttribute("password")%>"><br /> <br />
							<input class="button" type="submit" value="Register">
		
							<a href="login"><input class="button" type="button" value="GO TO LOGIN PAGE"></a>
	
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